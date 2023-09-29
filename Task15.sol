
//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract esCrow{
     address payable public seller;
    address owner;
    bool public sellerApproved;
     bool public admin;
      constructor(address payable _seller) payable {
        owner=msg.sender;
        seller = _seller;
    }
    function adminApproved()public{
        require(msg.sender==owner);
        admin=true;
    }
    function approveseller()public{
        require(msg.sender==seller,"its not a Seller");
        sellerApproved=true;
    }
    function conditionalTransaction()public payable{
        require(sellerApproved==true,"Seller doesnt approved");
        require(msg.value<=address(this).balance,"Not sufficient funds");
        seller.transfer(msg.value);
    }
}