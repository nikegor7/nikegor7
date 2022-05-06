// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract MyShop {  // контракт
// 0xd9145CCE52D386f254917e481eB44e9943F39138
    address public owner;
    mapping (address => uint) public payments; // в  переменной payments идет хранение инфы о плательщике. 

    constructor() {       // конструктор
        owner = msg.sender;
    }

    function payForItem() public payable {  // функция для приема денег
        payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {  // функция для вывода денег
        address payable _to = payable(owner); // временная переменная, хранится в памяти, как функция закончится , переменная не сохранится
        address _thisContract = address(this); // временная переменная, получаем адрес
        _to.transfer(_thisContract.balance);
    }
} 