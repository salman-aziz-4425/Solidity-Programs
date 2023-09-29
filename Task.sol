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

function fundsTransfer(address addr) public payable {
    payable(addr).transfer(msg.value);//Task 2
  }

function Getfunds() public payable {
    payable(msg.sender).transfer(address(this).balance);//Task 3
  }

function checkBalance()public returns(uint){
    return address(msg.sender).balance;//Task 4
}
function timeelapsedFunds()public{//Task 5
    
}
function AddVote(address voter)public{//Task 6
  require(voters[voter]==0,"You have already voted");
  voters[voter]+=1;
}
}