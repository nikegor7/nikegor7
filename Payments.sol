// SPDX-License-Identifier:MIT

pragma solidity ^0.8.4;

contract Payments{

   struct Payment{
       uint amount;
       uint timestamp;
       address from;
       string message;
   } 

   struct Balance {
       uint totalPayments;
       mapping(uint => Payment) payments;
   }

   mapping (address =>Balance) public balances;

   function currentBalance() public view returns(uint){
       return address(this).balance;
   } 

   function getPayment(address _addr, uint _index) public view returns(Payment memory){
       return balances[_addr].payments[_index];
   }

   function pay(string memory message) public payable{ // адрес отправителя , и увеличиение общее количества платежа
    uint paymentNum = balances[msg.sender].totalPayments;
     balances[msg.sender].totalPayments++;

      
// создаем еще один платеж
        Payment memory newPayment = Payment(
            msg.value,
            block.timestamp, // block информация о блоке, в нашем случае для отображения времени в unix
            msg.sender,
            message
        );

        balances[msg.sender].payments[paymentNum]= newPayment;
   }

}