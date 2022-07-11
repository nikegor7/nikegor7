// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//Merkle Tree

contract Tree {

    bytes32[] public hashes;
    string[4] transactions = [
        "TX1: Sherlok -> John",
        "TX2: John -> Sherlok",
        "TX3: Sherlok -> Mary",
        "TX4: Mary -> Sherlok"
    ];

    constructor(){
        for(uint i=0; i< transactions.length; i++){
            hashes.push(makeHash(transactions[i]));
        }


        // хэширование транзакциий 
        //        ROOT

//   H1-2      H3-4

// H1   H2   H3   H4

// TX1  TX2  TX3  TX4
uint count = transactions.length;
uint offset =0;


        while(count>0){
            for(uint i=0; i<count-1; i+=2){
               hashes.push(keccak256(abi.encodePacked(hashes[offset + i], hashes[offset + i + 1])));
            }
            offset += count; 
            count = count/2;
        }

    }

function verify(string memory transaction, uint index, bytes32 root, bytes32[] memory proof) public pure returns(bool){
//"TX3: Sherlok -> Mary"
// 2
//0x8fd2e01530a213c5afbb361b8fd03a0b783de9db1fbedfb8e76f23ee777e2cbc
//0xc3a55c3be5040c4d0ca449d0d768beb00759b2ba1585941b2283ea50848399ba
//0xae990566154a3a313d69688c05fd6916f724f9c13edba4a469266fafee8ce741
//        ROOT

//   H1-2      H3-4

// H1   H2   H3   H4

// TX1  TX2  TX3  TX4
    bytes32 hash = makeHash(transaction);
    for(uint i=0; i<proof.length; i++){
        bytes32 element = proof[i];

        if(index % 2 ==0) {
            hash=keccak256(abi.encodePacked(hash,element));
        } else{
            hash=keccak256(abi.encodePacked(element,hash));
        }
        index= index/2;
    }
 return hash == root ;
}


    function encode(string memory input) public pure returns(bytes memory){
        return abi.encodePacked(input);
        }

    function makeHash(string memory input) public pure returns(bytes32){
      return keccak256(encode(input));
    }
}
