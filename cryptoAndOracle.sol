pragma solidity >= 0.7.0 < 0.9.0;

//Oracle contract and then add to the crypto hashing to mininize outside interference from miners

contract Oracle {
    address admin;
    uint public rand;
    
    constructor() {
        admin = msg.sender;
    }
    
    function setRand(uint input) external  {
        require(msg.sender == admin, 'Sender must be the admin');
        rand = input;
    }
}




contract GenerateRandomNumber {
    
    // using modulo -> produce random number in a range
    // cryptographic hashing
    
    Oracle oracle;
    
    constructor(address oracleAddress) {
        // When deploying this contract we  grab the oracle contract and
        // this adress will be set to the oracle address
        oracle = Oracle(oracleAddress);
    }
    
    function randRange(uint range) external view returns(uint) {
        // grab information from blockchain randomly to generate random
        //abi.encodePacked concatanetes arguments nicely
        return uint(keccak256(abi.encodePacked(oracle.rand, block.timestamp, block.difficulty, msg.sender))) % range; 
        // this can be manipulated by miners 
        // we can  leverage Oracle dynamic feeds
    }
    
}

