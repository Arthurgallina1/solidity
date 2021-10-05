/* **Modificadores de funções**
Usado para adicionar semanticas nas funções de maneira declarativa. 
Por exemplo pode usar modifier pra automaticamente checar uma condição antes de 
executar a função. Modifiers são propriedades herdadadas de contratos
 e podem ser sobrescritos por contratos derivados 
 se for marcados como **virtual**. */

pragma solidity >= 0.7.1 < 0.9.0;

contract Purchase {
    address public seller;
    
    modifier onlySeller() {
        require(msg.sender == seller, 'Only Seller can see it');
        _;
    }

    function showSellerAddress() public view onlySeller returns (address) {
        return seller;
    }
}