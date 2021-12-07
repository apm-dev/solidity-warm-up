// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundMe {
    address public owner;

    mapping(address => uint256) public addressToAmountFunded;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You're not the owner!");
        _;
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function myFounds() public view returns (uint256) {
        return addressToAmountFunded[msg.sender];
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw(address payable destination) public payable onlyOwner {
        (destination).transfer(balance());
    }
}
