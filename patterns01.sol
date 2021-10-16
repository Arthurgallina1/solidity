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