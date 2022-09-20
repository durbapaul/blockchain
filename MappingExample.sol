pragma solidity ^0.8.7;
contract MappingExample {
    mapping(uint=>bool) myMapping;
    mapping(address=>bool) myAddressMapping;
    
    function setValue (uint _index) public {
        myMapping[_index]=true;
    }
    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}