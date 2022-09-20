pragma solidity ^0.8.7;

contract SharedWallet {

    address owner;
    constructor() {
        owner=msg.sender;
    }

    modifier OnlyOwner() {
        require (msg.sender == owner, "You are not the owner");
        _;
    }
    

    function withdrawMoney (address payable _to, uint _amount) public OnlyOwner {
        _to.transfer(_amount);
    }

    receive () external payable {

    }
}