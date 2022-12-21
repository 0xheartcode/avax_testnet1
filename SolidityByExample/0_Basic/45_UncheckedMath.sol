/* 
Overflow and underflow of numbers in Solidity 0.8 throw an error. This can be disabled by using unchecked.

Disabling overflow / underflow check saves gas.
*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract UncheckedMath {
    function add(uint x, uint y) external pure returns (uint) {
        // 22291 gas
        // return x + y;

        // 22103 gas
        unchecked {
            return x + y;
        }
    }

    function sub(uint x, uint y) external pure returns (uint) {
        // 22329 gas
        // return x - y;

        // 22147 gas
        unchecked {
            return x - y;
        }
    }

    function sumOfCubes(uint x, uint y) external pure returns (uint) {
        // Wrap complex math logic inside unchecked
        unchecked {
            uint x3 = x * x * x;
            uint y3 = y * y * y;

            return x3 + y3;
        }
    }
}

// https://solidity-by-example.org/unchecked-math/
// https://www.youtube.com/watch?v=_pvup5lyC3Q
