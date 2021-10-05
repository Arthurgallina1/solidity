pragma solidity >=0.7.0 <0.9.0;

//scope is the visibility: public (acessada fora do contrato por outros contatos) 
// or private  (acessada só por esse contrato).
// o view é keyword pra ver o resultado do retorno na IDE

contract Functions {
    uint chocolateBarPrice = 30;
    bool isChocolateBarAvailable = true;
    string chocolateBarBrand = 'Rex';
    bool isDoorOpen = true;
    
    
    function remoteControlOpen(bool closed) public returns (bool) {
        isDoorOpen = !isDoorOpen;
        return isDoorOpen;
    }
    
    function getDoorOpen() public view returns (bool) {
        return isDoorOpen;
    }
    
}


contract FunctionsContract {
    
    uint globalNumber;
    
    function setResult(uint number) public {
        globalNumber = number;
    }
    
    function getNumber() private view returns (uint) {
        return globalNumber;
    }

    function mutateState(int a, int b) internal pure returns (int) {
        return a - b;
    }
    
    function getResult() external view returns (uint) {
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        return result;
    }   
}


//