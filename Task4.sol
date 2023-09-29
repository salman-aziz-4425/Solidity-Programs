//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract A{

    address owner;
    mapping(address=>uint) public voters;
    constructor(){
        owner=msg.sender;
    }

function checkBalance()public returns(uint){
    return address(msg.sender).balance;//Task 4
}

}