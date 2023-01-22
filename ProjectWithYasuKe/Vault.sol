// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Vault

/*

V1

1. CoffreFort (0 amount) (12j) (justEth) (justOwner)
2. CoffreFort (0) (2j)

...
Write function
    +createVault onlyOwner defineTime
    +depositToVault
    +withdrawFromVault if(defineTime <= now) open (sends token to Owner)

    +updateVaultDeadline defineTime

    +selfDestruct onlyOwner 

Read function
    +readDataFromVault Owner Time Token VaultID

... ... ... ...

*/

contract Vault {
    address payable public owner;
    uint public timestamp = block.timestamp;

    struct vaultStruct {
        // uint8 vaultID; ID is position in array.
        uint256 startingTimestamp;
        uint256 endingTimestamp;
        // address depositor; // owner
        uint256 vaultBalance; 
        bool ongoing; //ongoing or finished.
    }

    vaultStruct[] public vaults;

    
    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner () {
        require(msg.sender == owner, "Owner did not call the contract !");
        _;
    }

    function createVault (uint _endingTimestamp) public onlyOwner {
        require(_endingTimestamp > updateBlockTimestamp(), "_endingTimestamp has already passed !");

        vaults.push(vaultStruct( timestamp, _endingTimestamp, 0, true));
        //arr.push(i);
    }

    function depositToVault (uint _vaultId) public payable {
        vaultStruct storage vault = vaults[_vaultId];
        vault.vaultBalance += msg.value;
    }

    function withdrawFromVault (uint _vaultId) public onlyOwner {

        uint amount = vaults[_vaultId].vaultBalance;

        require(vaults[_vaultId].endingTimestamp < updateBlockTimestamp(),"You cannot withdraw, deadline not passed yet !");

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
        vaults[_vaultId].vaultBalance = 0;
        vaults[_vaultId].ongoing = false;
    }

    function updateVaultDeadline (uint _vaultId, uint _newEndingTimestamp) public onlyOwner {
        vaultStruct storage vault = vaults[_vaultId];
        vault.endingTimestamp = _newEndingTimestamp;
    }

    function updateBlockTimestamp () public returns (uint) {
        timestamp = block.timestamp;
        return timestamp;
    }

    function selfDestruct() public {
        // self destruct function to receive the money back.
        selfdestruct(owner);
    }
}