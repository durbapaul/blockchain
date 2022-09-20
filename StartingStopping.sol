pragma solidity ^0.8.7;
contract StartStopUpdateExample{

    address public owner;
    bool public paused;
    constructor (){
        owner = msg.sender;
        
    }

    function SendMoney() public payable {

    }
    function setPaused(bool _paused) public {
        require (owner == msg.sender, "You are not the owner.");
        paused = _paused;
    }
    function WithdrawMoney(address payable _to)public {
        require(owner == msg.sender, "You Cannot Withdraw.");
        _to.transfer (address(this).balance);

    }

    function DestroySmartContract (address payable _to) public {
        require(owner == msg.sender,"You are not the owner.");
        selfdestruct(_to);
    }

}