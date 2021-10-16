// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract WithdralPattern {
    
    mapping (address => uint) contributionWallet;
    
    modifier onlyOwner() {
        require(true);
        _; //runs the function
    }
    
    function returnFunds() public onlyOwner returns (bool success) {
        
        for(uint i = 0; funders.length; i++) {
            funders[i].transfer(contributedAmount);
        }
        
        return true;
    }
    
        //what could wrong?
        //What happens if tatiana rejects the tranfer? => The function would fail and  then Jonh doesnt get paid
      function returnFunds2() public onlyOwner returns (bool success) {
        
        tatiana.transfer(contributedAmount);
        roberson.transfer(contributedAmount);
        
        
        return true;
    }
    
    //Basic Error: Think that all contract and accounts want to accept funds automaticcaly (dangerous and naive);
    //Might be in their interst to reject the funds
    
    
    // a default fallback function is not payable - it will reject refunds
    //if one contract has a default fallback function would be wrong to refund this address -> it will not accept


    
    fallback() public {
        
    }
}

    //how does a contract find out if another addres is a contract?
contract Victim {
    function isItAContract() public view returns (bool) {
        //if the are bytes of code greater than zero then its a contract
        uint32 size;
        address a = msg.sender;
        //inline assembly acesses EVM at a low level
        assembly {
            //extcodesize retrieves size of the code
            size := extcodesize(a)
        }
        return (size > 0);

    }
}

contract Attacker {
    bool public trickedYou;
    Victim victim;

    constructor(address _v) public {
        // if you call the address from the construtor there are no bytes codes
        victim = Victim(_v);
        trickedYou = !victim.isItAContract();
    }
}
