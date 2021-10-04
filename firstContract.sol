pragma solidity >= 0.7.0 < 0.9.0;

contract ThisIsAWelcomeContract {
    
    uint globalNumber;
    
    function setResult(uint number) public {
        globalNumber = number;
    }
    
    function getNumber() public view returns (uint) {
        return globalNumber;
    }
    
    function getResult() public view returns (uint) {
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        return result;
    }   
}





















// SPDX-License-Identifier: MIT