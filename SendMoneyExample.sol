pragma solidity ^0.8.7;
contract SendMoneyExample{
    uint public BalanceReceived;

    function ReceiveMoney() public payable {
        BalanceReceived += msg.value;
    

    }
    function getBalance () public view returns (uint) {
    
    
    return address(this).balance;

    }

    function WithdrawMoney() public{
        address payable to = payable(msg.sender);
        to.transfer (getBalance()); 



    }
    function WithdrawMoneyTo(address payable _to) public {
        _to.transfer (getBalance());


    }


}