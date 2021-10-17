pragma solidity >=0.7.0<0.9.0;

// Accesso restrito é o comum para contratos. Por padrão o estado de um contrato é **read-only** a menos que especifique como **public.**

// Fizemos a restrição de quem pode modificar o estado ou chamar funções usando modifiers.

// - onlyBy - only mentioned caller can call this function
// - onlyAfter - called after certain time period.
// - costs - call this function only if certain value is provided.

contract RestrictedAccess {
    
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;
    
    
    modifier onlyBy(address allowedCaller) {
        require(msg.sender == allowedCaller, 'You\'re not allowed to call');
        _;
    }
    
     //only run the function after 3 weeks of creation of the contract
    modifier onlyAfter(uint _time) {
        require(block.timestamp > _time, "Not enough time passed!");
        _;
    }
    
    modifier costs(uint _amount) {
        require(msg.value >= _amount, 'not enough ether sent!');
        _;
    }
    
    
    
    function changeOwnerAddress(address _newAddress) onlyBy(owner) public {
        owner = _newAddress;
    }   
    
    function disown() onlyBy(owner) onlyAfter(creationTime + 10 seconds) public {
        delete owner;
    }
    
    function forceOwnerChange(address payable _newOwner) costs(10 ether) payable public {
        owner = _newOwner;
    }
    
}







