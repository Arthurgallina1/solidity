pragma solidity >= 0.7.0 < 0.9.0;

contract LedgerBalance {
    
    //create a map of wallets with amount
    // set a function to update amount of person calling contract (current address)
    
    mapping(address => uint) balance;
    
    function updateBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;    
    }
    
    
}

contract Updated {
    
    function updatedBalance() public {
        LedgerBalance ledger = new LedgerBalance();        
        ledger.updateBalance(30);
    }
    
    
}

contract SimpleStoroge {
    
    uint storedData;
    
    function set(uint x) public {
        // find block dificulty 
        //storedData = block.difficulty;
        
        //find time which we`re running this function
        // storedData = block.timestamp;

        //grab block number
        storedData = block.number;
        
        // storedData = x;
    }
    
    function get() public view returns (uint) {
        return storedData;       
    }
    
}