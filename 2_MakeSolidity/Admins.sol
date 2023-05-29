// SPDX-License-Identifier: None

pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Admins is Ownable {

    mapping(address => bool) public administrators;
    event AddedAdmin(address newAdmin);
    event RemovedAdmin(address removedAdmin);


    modifier onlyAdmin() {
        require(administrators[msg.sender] || msg.sender == owner(), "Not admin or owner.");
        _;
    }

    // normally an onlyOwner modifier is added here. Removed for simplicity.

    function addAdmin(address _newAdmin) public {
        require(_newAdmin != address(0));
        administrators[_newAdmin] = true;
	
	emit AddedAdmin(_newAdmin);
    }

    function removeAdmin(address _removedAddress) public {
        require(_removedAddress != address(0));
        require(_removedAddress != msg.sender);
        administrators[_removedAddress] = false;

	emit RemovedAdmin(_removedAddress);
    }

}
