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
    // access my address from another contract
    function updatedBalance() public {
        LedgerBalance ledger = new LedgerBalance();        
        ledger.updateBalance(30);
    }
    
    
}