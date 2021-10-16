pragma solidity >=0.7.0 <0.9.0;

//Only the creator can issue new coins
//Anyone can send without need for registering (only need eth keypair)

contract Coin {
    //visible to be accessed outside contract from other contracts
    address public minter; 
    mapping (address => uint) public balances;
    
    //events to allow clients to react to changes on contracts
    event Sent(address from, address to, uint amount);
    
    constructor() {
        minter = msg.sender;
        
    }
    
    // make new coins and send them to an address
    // only the owner can send these coins
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter, 'only owner can mint');
        balances[receiver] += amount;
    }
    
    error insufficientBalance(uint requested, uint available);
    
    function send(address receiver, uint amount) public {
        // require(balances[msg.sender] < amount, 'you don't have the funds');
        
        if(amount > balances[msg.sender]) {
            revert insufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
        
        
    }
    
    
    
    
    
    
}