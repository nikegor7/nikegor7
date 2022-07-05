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
    }
    
blockhash(uint blockNumber) returns (bytes32): hash of the given block when blocknumber is one of the 256 most recent blocks; otherwise returns zero

block.basefee (uint): current block’s base fee (EIP-3198 and EIP-1559)

block.chainid (uint): current chain id

block.coinbase (address payable): current block miner’s address

block.difficulty (uint): current block difficulty

block.gaslimit (uint): current block gaslimit

block.number (uint): current block number

block.timestamp (uint): current block timestamp as seconds since unix epoch

gasleft() returns (uint256): remaining gas

msg.data (bytes calldata): complete calldata

msg.sender (address): sender of the message (current call)

msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)

msg.value (uint): number of wei sent with the message

tx.gasprice (uint): gas price of the transaction

tx.origin (address): sender of the transaction (full call chain)
    */

/*
ABI Encoding and Decoding Functions
abi.decode(bytes memory encodedData, (...)) returns (...): ABI-decodes the given data, while the types are given in parentheses as second argument. Example: (uint a, uint[2] memory b, bytes memory c) = abi.decode(data, (uint, uint[2], bytes))

abi.encode(...) returns (bytes memory): ABI-encodes the given arguments

abi.encodePacked(...) returns (bytes memory): Performs packed encoding of the given arguments. Note that packed encoding can be ambiguous!

abi.encodeWithSelector(bytes4 selector, ...) returns (bytes memory): ABI-encodes the given arguments starting from the second and prepends the given four-byte selector

abi.encodeWithSignature(string memory signature, ...) returns (bytes memory): Equivalent to abi.encodeWithSelector(bytes4(keccak256(bytes(signature))), ...)

abi.encodeCall(function functionPointer, (...)) returns (bytes memory): ABI-encodes a call to functionPointer with the arguments found in the tuple. Performs a full type-check, ensuring the types match the function signature. Result equals abi.encodeWithSelector(functionPointer.selector, (...))*/

}
