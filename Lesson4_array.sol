// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Demo{

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

    
    
    
    
 /*   //Byte
// можно присваивать как строки так и числа, но стороки будут закодированы как последовательность байт
 bytes32 public myVaar = "test here";
 bytes public myVV ="test here"; // для создания массива с динамической длиной
  
  // размерность 1 байт
    bytes32 public myVar = "test here";
    bytes public myDynvAr = "test here";

    //1--> 32 байт
    // 32 * 8 = 256 бит --> uint256;

    function dlina() public view returns(uint){
        return myVV.length;
    }
  // вывод 1 элемента строки 
 function dlina1() public view returns(bytes1){
        return myVV[0];
    }*/

    //Array
    // статический массив
   /*  uint[3][2] public items;  //массив [3][2] -> [3] - количество столбцов. [2] - количество
    
    function demo() public { 
       items[0]=100;
      items[1]=200;
      items[4]=400; 
    items = [
        [1,2,3],
        [7,8,9]
    ];

    } 


    // динамический массив в блокчейне
 // массив динамический если не указан размер масива
    uint[] public items;
    uint public len;
    function demo() public {
        items.push(4); // push доступен только для динамических массивов
        items.push(5);
        len=items.length; // для отображения количества элементов массива 
    }

    агтсешщт 


    // временный массив
    function SampleMemory() public view returns(uint[] memory) { // если создается временный массив надо указывать размер массива
        // memory тут отвечает за создание массива в памяти
        uint[] memory tempArray = new uint[](10); 
        tempArray[0]=1;
        return tempArray;
    }

*/
    
   /*  //enum
    enum Status { Paid, Delivered, Received}
    Status public currentStatus;

    function pay() public {
        currentStatus = Status.Paid;
    }

    function deliver() public {
        currentStatus = Status.Delivered;
    } */

}