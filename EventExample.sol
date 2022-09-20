pragma solidity ^0.8.7;

contract EventExample {

    mapping (address => uint) public tokenBalance;

    event tokensSent ( address _from, address _to, uint _amount);

    constructor() public {
        tokenBalance[msg.sender]= 100;
    }

    function sendToken (address _to, uint _amount) public returns(bool){
        require(tokenBalance[msg.sender]>= _amount, "Not Enough Funds");
        assert (tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert (tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);

        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit tokensSent (msg.sender, _to, _amount);

        return true;
    }
}