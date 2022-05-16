//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract TokenImplementation is ERC20 {

    bool private _initialized;
    string private _newName;
    string private _newSymbol;

    constructor() ERC20("FOO", "FOO") {
    }

    function initialize (string memory name_, string memory symbol_) public {
        require(_initialized == false, "already initialized");

        _initialized = true;

        _newName = name_;
        _newSymbol = symbol_;
    }

    function name() public view override returns (string memory){
        return _newName;
    }


    function symbol() public view override returns (string memory){
        return _newSymbol;
    }

}
