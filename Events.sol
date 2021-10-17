**São emitidos pro mundo para quem esta consumindo o contrato saber que algo acontenceu** (one way pois só sai). 

Aplicações podem subescrever e ouvir esses eventos através de uma RPC interface no cliente Ethereum (web3js).

**Guarda os argumentos passados no log de transações** (uma estrutura de dados especial do blockchain) ****que são guardados no blockchain e são acessiveis usando o endereco do contrato. **Eventos não são acessiveis de dentro do contrato (nem pelo que criou e emitou ele).**

- É possivel adicionar **indexed** nos argumentos do evento que adiciona eles a uma estrutura de dados especial chamadas **topics** → Que permitem procurar por eventos filtrando sequencia de blocos.


contract Events { 
    
    //declare events and emit events
    //Camelcase naming for events
    //keyword index for event -> allow outside consumer to filter and find the information they need (but it costs higher gas)
    //only allowed to use 3 indexes
    event NewTrade(uint indexed date, address from, address indexed to, uint amount);
    
    
    function trade(address to, uint amount) external {
        // outside consumer can see the event through web3js
        // block.timestamp is a global variable 
        emit NewTrade(block.timestamp, msg.sender, to, amount);
    }
    
}