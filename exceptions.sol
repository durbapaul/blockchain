pragma solidity ^0.8.7;
 contract Excemption {
      
      mapping (address => uint) public balanceReceived;

      function receiveMoney () public payable {
         
          assert (msg.value == uint64(msg.value));
          balanceReceived [msg.sender] += uint64 (msg.value);
          
          assert (balanceReceived[msg.sender] >= uint64(msg.value));

      }

      function withdrawMoney (address payable _to, uint64 _amount) public {
          require (_amount <= balanceReceived[msg.sender], "Not Enough Funds, aborting");
         
          assert (balanceReceived[msg.sender] >= balanceReceived[msg.sender]- _amount);

          balanceReceived[msg.sender] -= _amount;

          _to.transfer(_amount);
      }
 }

