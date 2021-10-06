/* memory ⇒ Igual memória RAM (runtime), no solidity é um 
espaço temporário para guardar dados entre as chamadas 
da função, só pode ser chamada em funções e não em nível 
de contrato. Um SC pode usar qlqr tamanho de
memória durante a execução mas assim que a execução
termina a memória é completamente limpa pra próxima
execução.*/

contract StringsAndArrays {

    uint [] public numberList = [1,2,3, 4, 5, 6, 7, 8];
    
    string greetings = 'Hello';
    
    function checkMultiple() public view returns (uint) {
        uint count = 0;
        for(uint i=1; numberList.length > i; i++) {
            if(numberList[i] % 2 == 0){
                count++;
            }
        }
        return count;
    }
    
    function sayHello() public view returns(string memory)  {
        return greetings;
    }
    
    function changeGreeting(string memory _change) public  {
        greetings = _change;
    }
    
      function getChar() public view returns(uint)  {
        // return greetings.length; CAN'T DO IT BECUSE ITS TO EXPENSIVE
        //convert string to bytes32
        bytes memory stringToBytes = bytes(greetings);
        return stringToBytes.length;
        
    }
 
}