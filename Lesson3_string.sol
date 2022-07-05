// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Demo {

    mapping(address => uint) public payments; // хранится в блокчейне. storage

    address public myAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 

   
   function receiveFunds() public payable{  // функция созданная для перевода денег на смарт контракт 
      payments[msg.sender] = msg.value ; // адрес счета это ключ , а число это значение под которым хранится ключ
   //value работает если прописанно payable
   }
   
    function transferTo(address targetAddr, uint amount) public { // функция для перевода денег
        address payable _to = payable(targetAddr);
        _to.transfer(amount);
    }

    function getBalance(address targetAddr) public view returns(uint) { // функция для просмотра баланса на этом счету, но при добавлении перемнной в функцию можно узнать баланс на другом счету
    // для возврата используется return
       return targetAddr.balance;
    } 


  /*  string public myStr = "test"; // storage, хранятся в блокчейне

    function demo( string memory newValueStr) public{
    //    string memory myTempStr = "temp"; // временное хранение в памяти пока работает функция с помощью memory
        myStr = newValueStr;
    }*/
    
    /*
    Members of bytes
bytes.concat(...) returns (bytes memory): Concatenates variable number of bytes and bytes1, …, bytes32 arguments to one byte array

Members of string
string.concat(...) returns (string memory): Concatenates variable number of string arguments to one string array*/
}
