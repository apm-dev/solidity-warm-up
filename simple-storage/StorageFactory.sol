// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public returns (uint256) {
        simpleStorageArray.push(new SimpleStorage());
        return simpleStorageArray.length;
    }

    function sfStore(uint256 sfIndex, uint256 value) public {
        SimpleStorage(address(simpleStorageArray[sfIndex])).store(value);
    }

    function sfGet(uint256 sfIndex) public view returns (uint256) {
        return SimpleStorage(address(simpleStorageArray[sfIndex])).retrieve();
    }
}
