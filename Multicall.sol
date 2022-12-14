// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract TestMultiCall {
 
    function func1() external view returns (uint, uint) {
        return (1, block.timestamp);
    }

    function func2() external view returns (uint, uint) {
        return (2, block.timestamp);
    }

    function getData1() external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.func1.selector);
    }

    function getData2() external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.func2.selector);
    }
}


contract MultiCall {
    function multiCall(address target, bytes[] calldata data)
        external
        view
        returns (bytes[] memory)
    {
        bytes[] memory results = new bytes[](data.length);

        for (uint i; i < data.length; i++) {
            //(bool success, bytes memory result) = target.staticcall(data[i]);
            (bool success, bytes memory result) = target.staticcall({data: data[i]});
            require(success, "call failed");
            results[i] = result;
            //targets[i].staticcall({data: data[i]});
        }
        
        return results;
    }

}