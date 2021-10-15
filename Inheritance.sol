// SPDX-License-Identifier: GPL-3.0
// Here we see how to work with multiple SC, use inheritance and create new SC inside a SC
// and call another SC functions inside a SC
pragma solidity >=0.7.0 <0.9.0;

contract Ownable {
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, 'must be owner');
        _;
    }
    
    
}

contract SecretVault {
    string secret;
    
        
    constructor(string memory _secret) {
        secret = _secret;
 
    }
    
    function getSecret() public view returns(string memory)  {
        return secret;
        
    }
    
    
}


contract MyContract is Ownable {
    address secretVault;
    
    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
 
    }
    
    function getSecret() public view onlyOwner returns(string memory)  {
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();
        
    }
    
   
    
    
}