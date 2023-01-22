//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Runtime code
// Creation code
// Factory contract

contract Factory {
    event Log(address addr);


    function deploy() external {

        bytes memory bytecode = hex"69602a60005260206000f3600052600a6016f3";
        address addr;
        assembly {
            addr := create(0, add(bytecode, 0x20), 0x13)
        }
        require(addr != address(0), "deploy failed");
        emit Log(addr);
    }
}

interface IContract {
    function getMeaningOfLife() external view returns (uint);
}
/*
Sotre 42 to memory
mstore(p, v) - store v at memory p to p + 32


PUSH1 0x2a
PUSH1 0
MSTORE

return(p, s) = end execution and return data from memory p to p + s

Return 32 bytes from memory
PUSH1 0x20
PUSH1 0
RETURN

Run time code - return 42
602a60005260206000f3
69
602a60005260206000f3 60 0 0 52
600a6016f3
*/

/*

Creat code 
Store run time code to memorz



PUSH10 0x602a60005260206000f3

PUSH1 0
MSTORE

PUSH1 0x0a
PUSH1 0x16
RETURN

69602a60005260206000f3600052600a6016f3
*/

