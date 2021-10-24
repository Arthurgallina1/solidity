

//Send vs tranfer
//Transfer reverts the code while send returns a bool

contract Send {

    function sendRefund() public onlyOwner returns (bool success) {
        if(!tatiana.send(amount)) {
            //if sending fails
            // it gets messy
        }
    }

    //Solution: Write a withdrawl function so that the investor can
    // withdraw funds on their own through that function.
    // Using: msg.sender and withdrawl pattern


    function claimRefund() public {
        require(balance[msg.sender] > 0);
        msg.sender.transfer(balance[msg.sender]);

        //by the customer working directly to refund with their
        //contract address we eliminate outside interference 
    }

    //By making our transaction one at a time greatly reduce danger to our executions
    //ITS NOT SAFE TO INTERACT WITH MORE THAN ONE CUSTOMER AT A time


    //directional flow is the best practice for security.
    function withdrawlFunds(uint amount) public returns (bool success) {
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return true;
    }


}