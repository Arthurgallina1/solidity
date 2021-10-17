pragma solidity >=0.7.0 <0.9.0;

// São contratos que contem pelo menos uma função sem implementação. Esses contratos são usados como contratos base (para serem derivados) - servem como uma interface.

// base abstract
abstract contract X {
    function y() public view virtual returns (string memory);
}

//derived contract
contract Z is X {
    
    function y() public override pure returns (string memory) {
        return 'hello';
    }
}

//is abstract since has one empty function
contract Member {
    string name;
    uint age = 3;
    
    // because it has no body its considered abstract
    function setName() public virtual returns (string memory) {}
    
    function returnAge() public view returns(uint) {
        return age;
    }
}

//derived
contract Teacher is Member {
    function setName() public pure override returns(string memory) {
        return 'Gordan';
    }
}

contract Calculator {
    function calculate() public virtual returns (uint) {}
}

contract Test is Calculator {
    function calculate() public pure override returns(uint) {
        uint a = 3;
        uint b = 5;
        
        return a+b;
    }
}







