// SPDX-License-Identifier: GLP-3.0

pragma solidity ^0.8.0;

contract Demo{

function fun() public pure returns(uint) {
uint  myVal = 1;
uint  myVel = 10;
uint  uintSum = myVal + myVel;
return uintSum;
}


/*function inc() public{
    // myVal = myVal +1;
    // myval +=1;

    unchecked{ // отлавилвает ошибки переполнения

    myVal--; // myval--;

    }
}




    uint public maximum;      // maximum and minimum
    function demo() public{
        maximum = type(uint8).max;
    }


    // unsigned integers
    // 0,1,2,3,...
    // 2^256 - максимальное число которое можно сохранить в переменной.
    uint public myUint = 42;
    uint8 public mySmallUint =2;
    // 2^8 = 256
    function demo(uint _inputUint) public {
        uint localUint = 42;
        localUint +1;
        localUint -1;
        localUint *1;
        localUint /5;
        localUint **2;
        localUint %3;

        -muInt;
        // сравнение
        localUint == 1;
        localUint !=1;
        localUint >-1;
        localUint >=1;
        localUint <-2;
        localUint <=2;

    }
    // signed integers\
    int public myInt = -42;
    int8 public mySmallInt =-1;
    // 2^7 = 128; => from -128 to 127;
    function demo1(int )
    // -5,-4,....
   bool public myBool = true; // переменная состояния или  state ; true or false ;

    function myFunc(bool _inputBool) public { // внутри функции также пишется временная переменная
        bool localBool = false; //local временная переменная.
        // логические операции к булевым значениям
        localBool && _inputBool
        localBool || _inputBool
        localBool == _inputBool
        localBool != _inputBool
        !localBool

        if(_inputBool || localBool){
            
        }
    }*/

    



}