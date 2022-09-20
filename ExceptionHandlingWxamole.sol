pragma solidity ^0.8.7;
contract ExceptionHandlingExample {
    mapping (address => uint) public balanceReceived;

    function ReceiveMoney() public payable {
        balanceReceived [msg.sender] += msg.value;

    }
    function WithdrawMoney (address payable _to, uint _amount) public{
        require (_amount <= balanceReceived[msg.sender], "Not Enough Funds, aborting");
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);


        

    }
}