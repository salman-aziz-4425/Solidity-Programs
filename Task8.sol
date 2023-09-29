//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

import "./Task7.sol";

contract crowdSale{
    ERCTokens public tokenA;
    constructor(uint initialSupply){
        tokenA=new ERCTokens(initialSupply);
    }
    function checkBalance()public returns(uint){
        return tokenA.balanceOf(msg.sender);
    }
    mapping(address=>uint256) public TokenPrice;
    function addToken(uint value)public{
        tokenA.addTokens(msg.sender,value);
    }

    function buyToken(uint numTokens)public payable{
        uint amount=0.01 ether;
        require(numTokens<=tokenA.balanceOf(msg.sender),"Not sufficient Tokens");
        uint256 etherAmount=numTokens* amount / 1e18;
        payable(msg.sender).transfer(etherAmount);
        tokenA.deductToken(msg.sender,numTokens);
    }
}