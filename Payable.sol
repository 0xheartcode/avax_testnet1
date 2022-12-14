// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.13;

contract Payable {

address payable public owner;

constructor () payable {
    owner = payable(msg.sender);
}

// deposit

function deposit () external payable {}

// withdraw
function withdraw () public {
    uint _amount = address(this).balance;
    owner.transfer(_amount);
}

// transfer
function transfer (uint _amount, address payable _addr) external {
    _addr.transfer(_amount);
}

function notPayable () public {}
} 