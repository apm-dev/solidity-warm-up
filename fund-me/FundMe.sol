// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundMe {
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function myFounds() public view returns (uint256) {
        return addressToAmountFunded[msg.sender];
    }
}
