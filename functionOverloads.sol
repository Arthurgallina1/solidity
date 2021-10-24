pragma solidity >= 0.7.0 < 0.9.0;

contract Functons2 {
    
    // Function overload ⇒ Pode ter multiplas funções com mesmo nome no mesmo escopo. A definição delas deve variar pelos tipos e números de argumentos - não é possivel fazer overload se elas diferem apenas no retorno.
    //Chama a que bate os argumentos
    function getSum(uint a, uint b) public pure returns (uint) {
        return a + b;    
    }
    
    function getSum(uint a, uint b, uint c) public pure returns (uint) {
        return a + b + c;
    }
    

    
    function getSum2Args() public pure returns (uint) {
       return getSum(15, 5);
    }
    
    function getSum3Args() public pure returns (uint) {
        return getSum(20, 30, 3);
    }
    
}