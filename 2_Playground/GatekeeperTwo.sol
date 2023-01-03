// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperTwo {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    uint x;
    assembly { x := extcodesize(caller()) }
    require(x == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == type(uint64).max);
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }


  function enterTwo() public gateTwo returns (bool) {
    entrant = tx.origin;
    return true;
  }

  function enterThree(bytes8 _gateKey) public gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }

  function resetEntrant() public {
    entrant = address(0);
  }

function addressUint() external view returns (uint64) {
    return ~ uint64(bytes8(keccak256(abi.encodePacked(address(msg.sender)))));
    }
}