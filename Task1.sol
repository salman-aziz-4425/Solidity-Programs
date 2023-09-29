//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract A{

    address owner;
    mapping(address=>uint) public voters;
    constructor(){
        owner=msg.sender;
    }

function isContract(address addr) public returns (bool isContract){
   return addr.code.length>0;//Task 1
  }

}