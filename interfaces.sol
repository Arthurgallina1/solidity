pragma solidity >=0.7.0<0.9.0;

//Podem ser usados para conectar os contratos que implementam a interface utilzando o **address** do contrato.

// - Não podem ter nenhuma função com implemetação
// - Funções só podem ser do tipo **external**
// - **Não tem construtor, state variables e modifiers;**
// - Podem ter enum, structs e podem ser acessados usando nome da interface e dot notation. (Ex:**Token.TokenType** or Token.Coin)

contract Counter {
    uint public count;
    
    function increment() external {
        count += 1;
    }
}


// how do we interact with this contract without copy and code? => Interfaces

interface ICounter {
    function increment() external;
    function count() external view returns (uint);

}


contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment;
    }
    
    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}