// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {

    uint initialSupply = 9000;

    constructor() ERC20("Token", "CuteToken<3") {
        _mint(msg.sender, initialSupply);
    }
}

