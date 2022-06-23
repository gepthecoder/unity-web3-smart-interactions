// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 0x9aEB5A6128465b989969F95eC4Bfc55d07604393

contract MoriaGates {

    event CorrectPassword(bool result);
    bytes32 private _magicPassword;

    address owner;
    
    constructor(bytes32 magicPassword) {
        _magicPassword = magicPassword;
        owner = msg.sender;
    }
    
    function openGates(string memory password) public {   

        //DISCLAIMER -- NOT PRODUCTION READY CONTRACT
        //require(msg.sender == owner);

        if (hash(password) == _magicPassword)
        {
            emit CorrectPassword(true);
        }
        else
        {
            emit CorrectPassword(false);
        }
    }   

    function hash(string memory stringValue) internal pure returns(bytes32) {
        return keccak256(abi.encodePacked(stringValue));
    } 
}