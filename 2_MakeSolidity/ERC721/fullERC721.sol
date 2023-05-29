// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ERC721Token {
    string public name;
    string public symbol;
    address public owner;

    mapping(uint256 => address) public ownerOf;
    mapping(uint256 => address) public approved;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    constructor(
        string memory _name,
        string memory _symbol,
        address _owner
    ) {
        name = _name;
        symbol = _symbol;
        owner = _owner;
    }

    function transfer(address to, uint256 tokenId) public {
        require(msg.sender == ownerOf[tokenId], "Only the owner can transfer the token");
        require(to != address(0), "Invalid 'to' address");

        ownerOf[tokenId] = to;

        emit Transfer(msg.sender, to, tokenId);
    }

    function approve(address approvedAddress, uint256 tokenId) public {
        require(msg.sender == ownerOf[tokenId], "Only the owner can approve");
        require(msg.sender != approvedAddress, "Approval to self not allowed");

        approved[tokenId] = approvedAddress;

        emit Approval(msg.sender, approvedAddress, tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) public {
        require(msg.sender == approved[tokenId] || msg.sender == ownerOf[tokenId], "Not approved or owner");
        require(ownerOf[tokenId] == from, "Invalid owner");
        require(to != address(0), "Invalid 'to' address");

        ownerOf[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    function mint(address to, uint256 tokenId) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        require(to != address(0), "Invalid 'to' address");
        require(ownerOf[tokenId] == address(0), "Token already minted");

        ownerOf[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

    function burn(uint256 tokenId) public {
        require(msg.sender == ownerOf[tokenId], "Only the token owner can burn the token");

        address ownerAddress = ownerOf[tokenId];
        ownerOf[tokenId] = address(0);

        emit Transfer(ownerAddress, address(0), tokenId);
    }
}
