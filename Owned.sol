pragma solidity ^0.8.7;

contract Owned{
    address owner;

    constructor() public {
        owner=msg.sender;
    }

    
    modifier onlyOwner(){
        require(msg.sender==owner, "You are not allowed");
        _;
}
}
