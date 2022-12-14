// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract DepositForce {
    
    string public hi = "meow";
    constructor() payable{}

    address to = 0xE3f80bA82FcAf5946306D32E782378A4a50da5ff;

    //address payable to2 = 0xC8154B5e94946aE7419Ae0f1b9c08C5E260DCb75;

    function quickTransfer(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function withdrawNotPayable() public payable {
    (bool sent, bytes memory data) = to.call{gas :10000, value: msg.value}(abi.encodeWithSignature(""));
    }

    function withdrawPayable() public payable {
    (bool sent, bytes memory data) = to.call{gas :10000, value: msg.value}(abi.encodeWithSignature(""));
    }

}