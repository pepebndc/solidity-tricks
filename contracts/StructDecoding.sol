//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


contract StructDecoding {

    User public user;

    struct User {
        uint256 balance;
        bool happy;
    }

    function addUser(bytes memory _data) public {
        user = abi.decode(_data, (User));
    }

}
