/* 
- **address:** Guarda um valor de 20 byte 
(Tamanho de um Ethereum address)
- **address payable:** Mesmo que um address mas 
com os membros adicionais de **transfer** e **send.**

The idea behind this distinction is that address payable is an address you can send Ether to,
while a plain address cannot be sent Ether.
Conversão de tipos entre eles ⇒ Implicita de payable pra 
address é permitido, de address → payable é necessario ser explicito usando **payable(<address>).**
Address tem vários membros ⇒ **balance** e **transfer** (e mt mais). 
*/


pragma solidity >= 0.7.1 < 0.9.0;

contract Purchase {

    address public seller;
    address payable public pagador;
    address public myAddress = address(this); //contract address
    address payable myWallet = payable(myAddress);

    function getAddressStuff() public view returns (address) {
        return pagador;
    }
    
    function deposit(uint256 amount) payable public {
        require(msg.value == amount, 'No amount provided');
    }
    
     function getBalance() public view returns (uint256) {
        return myWallet.balance;
    }
 
}