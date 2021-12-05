// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 favoriteNumber;

    struct Person {
        string name;
        uint256 number;
    }

    Person[] public people;
    mapping(string => uint256) public nameToFavNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory name, uint256 number) public {
        people.push(Person({name: name, number: number}));
        nameToFavNumber[name] = number;
    }
}

// Different testnets faucet
// https://docs.chain.link/docs/link-token-contracts/