// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./IERC20custom.sol";

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}
    
    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint){
        return address(this).balance;
    }

    // find balance of any erc20 token associated with this address
    function balanceOfThisToken(address _erc20) external view returns (uint){
        ERC20Standard erc20instance = ERC20Standard(_erc20);
        return erc20instance.balanceOf(address(this));
    }
}

