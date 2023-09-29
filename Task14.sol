//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;
contract rentalStorage{

    mapping(address=>uint) public usersBalances;
    mapping(address=>uint)public storageOwner;
    function getToken(uint value)public{
        usersBalances[msg.sender]+=value;
    }
    function rentStorage()public{
        require(usersBalances[msg.sender]>20,"Not sufficient to buy storage");
        usersBalances[msg.sender]-=20;
        storageOwner[msg.sender]+=1;
    }
}