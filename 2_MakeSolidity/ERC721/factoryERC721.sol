// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0ö

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
	constructor() ERC721("NFT", "CuteNFT") {
	}

	function _baseURI() internal pure override returns (string memory) {
		return "google.com";
	}
}
