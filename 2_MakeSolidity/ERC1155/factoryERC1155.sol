// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";

contract ElevenFiftyFive is ERC1155 {
	constructor() ERC1155("") {}

	function setURI(string memory newuri) public {
		_setURI(newuri);
	}
}
