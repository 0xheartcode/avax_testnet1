// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperOne {

bool public level1;
bool public level2;
bool public level3;

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    level1 = true;
    _;
  }

  modifier gateTwo() {
    require(gasleft() % 8191 == 0);
    level2 = true;
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
      level3 = true;
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}