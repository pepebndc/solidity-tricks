//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./TokenImplementation.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";

contract TokenFactory {

    address public implementationReference;

    event newBirth(address tokenAddress);


    constructor() {
        implementationReference = address(new TokenImplementation());
    }

    function birth(string memory name, string memory symbol) public returns (address newTokenAddress) {

        newTokenAddress = Clones.clone(implementationReference);

        TokenImplementation newImplementation = TokenImplementation(newTokenAddress);
        newImplementation.initialize(name, symbol);

        emit newBirth(newTokenAddress);
    }



}
