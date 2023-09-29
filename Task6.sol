//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract A{

    address owner;
    mapping(address=>uint) public voters;
    constructor(){
        owner=msg.sender;
    }

function AddVote(address voter)public{//Task 6
  require(voters[voter]==0,"You have already voted");
  voters[voter]+=1;
}
}