// License: SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LibraryContract {

  // stores a timestamp 
  uint firstTime;
  uint secondTime;
  uint storedTime;  

  function setTime(uint _time) public {
    storedTime = _time;
  }
}