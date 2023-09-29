//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract A{

    address owner;
    mapping(address=>uint) public users;
    mapping(address=>uint) public lastwidhrawlTime;
    constructor(){
        owner=msg.sender;
    }

function timeelapsedFunds(address addr)public payable{//Task 5
    require(block.timestamp-lastwidhrawlTime[addr]>16,"Not a right time to widhdrawl");
    lastwidhrawlTime[addr]=block.timestamp;
    payable(addr).transfer(msg.value);
}

}