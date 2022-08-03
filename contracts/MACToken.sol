// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC-20.sol";

contract MACToken is ERC20{
    constructor(uint initialSuply) ERC20("MACCOM", "MAC",msg.sender){  
        mint(msg.sender, initialSuply); 
    
    }
    }