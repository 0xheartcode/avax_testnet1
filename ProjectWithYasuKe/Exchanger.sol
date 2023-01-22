// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Exchanger

/*

V1


*. function to send out funds to a full list of addresses / divided by the number of token holders. 
**. function to send out funds to a full list of addresses / set amount for each token holder.

. function to check if the result divided by each holders works correctly or if the contract is out of funds, and how much would be missing.
. check contract balance
. 

*** advanced. function to send out funds to a full list of addresses / % amounts for each token holder, in relationship by a random arbitrairy percentage.

0. OnlyOwner
1. Receive ETH, sendout ETH to list of addresses.
2. Display list of addresses
3. Add, remove, edit list of addresses



...
Write functions

View functions

... ... ... ...

*/

contract Exchange{

    function sendToAdressesSetAmount(uint _amount, address[] memory _adresses) payable public {
        // Require 100 Wei or more
        require(msg.value >= 100, "You must send at least 100 Wei");

        // TODO: Check if adresses exist
        
        require(_amount*_adresses.length > msg.value, "Amount is too small");

        for (uint i=0; i < _adresses.length; i++) {
            (bool sent,) = payable(_adresses[i]).call{value: _amount}("");

        }
    }
    
    function sendToAdressesDivided(address[] memory _adresses) payable public{
        // Require 100 Wei or more
        require(msg.value >= 100, "You must send at least 100 Wei");

        // TODO: Check if adresses exist
        
        uint256 fraction = msg.value / _adresses.length;


        for (uint i=0; i < _adresses.length; i++) {
            (bool sent,) = payable(_adresses[i]).call{value: fraction}("");

        }
    }
}