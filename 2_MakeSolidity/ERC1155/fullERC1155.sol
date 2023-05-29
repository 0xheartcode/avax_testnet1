// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ERC1155Token {
    string public name;
    string public symbol;
    uint8 public decimals;
    address public owner;

    mapping(uint256 => mapping(address => uint256)) public balanceOf;

    event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value);
    event TransferBatch(address indexed operator, address indexed from, address indexed to, uint256[] ids, uint256[] values);

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        address _owner
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        owner = _owner;
    }

    function transferSingle(
        address from,
        address to,
        uint256 id,
        uint256 value
    ) public {
        require(msg.sender == owner, "Only the owner can transfer tokens");
        require(from != address(0), "Invalid 'from' address");
        require(to != address(0), "Invalid 'to' address");

        balanceOf[id][from] -= value;
        balanceOf[id][to] += value;

        emit TransferSingle(msg.sender, from, to, id, value);
    }

    function transferBatch(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values
    ) public {
        require(msg.sender == owner, "Only the owner can transfer tokens");
        require(from != address(0), "Invalid 'from' address");
        require(to != address(0), "Invalid 'to' address");
        require(ids.length == values.length, "Arrays length mismatch");

        for (uint256 i = 0; i < ids.length; i++) {
            uint256 id = ids[i];
            uint256 value = values[i];
            balanceOf[id][from] -= value;
            balanceOf[id][to] += value;
        }

        emit TransferBatch(msg.sender, from, to, ids, values);
    }
}
