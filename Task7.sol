//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract ERCTokens{

    address owner;
    mapping(address => uint256) public balances;
    mapping(address => mapping (address => uint256)) public allowed;
   uint256 totalSupply_;
   constructor(uint256 total) public 
   {
      totalSupply_ = total;
      balances[msg.sender] =totalSupply_;
    }
function totalSupply() public view returns (uint) {
  return totalSupply_;
}
function addTokens(address user,uint amount)public{
  require(amount<=totalSupply_,"Not enough suplly");
  balances[user]+=amount;
}

function balanceOf(address tokenOwner) public view returns (uint) {
  return balances[tokenOwner];
}

function deductToken(address tokenOwner,uint numtokens) public{
  balances[tokenOwner]-=numtokens;
}


function allowance(address owner,address delegate) public view returns (uint) {
  return allowed[owner][delegate];
}


function transfer(address receiver,uint numTokens) public returns (bool) {
  require(numTokens <= balances[msg.sender]);
  balances[msg.sender]= balances[msg.sender]- numTokens;
  balances[receiver] = balances[receiver] + numTokens;
  return true;
}

function approve(address delegate,uint numTokens) public returns (uint) {
  allowed[msg.sender][delegate] = numTokens;
  return allowed[msg.sender][delegate];
}


function transferFrom(address owner, address buyer,uint numTokens) public returns (bool) {
  require(numTokens <= balances[owner]);
  require(numTokens <= allowed[owner][msg.sender]);
  balances[owner] = balances[owner] - numTokens;
  allowed[owner][msg.sender] =allowed[owner][msg.sender] - numTokens;
  balances[buyer] = balances[buyer] + numTokens;
  return true;
   }
}
