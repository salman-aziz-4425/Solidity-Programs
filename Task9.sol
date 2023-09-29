//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;


import "./TokenA.sol";
import "./TokenB.sol";

contract DecentralizedExchange{
    TokenA public tokenA;
    TokenB public tokenB;

    constructor(uint initialSupply) {
        tokenA = new TokenA(initialSupply);
        tokenB = new TokenB(initialSupply);
    }
    function getGoldToken(uint initialSupply)public {
        tokenA.minting(msg.sender, initialSupply);
    }
    function getPlatinumToken(uint initialSupply)public {
        tokenB.minting(msg.sender, initialSupply);
    }
    function seemyGold()public returns(uint){
        return tokenA.balanceOf(msg.sender);
    }
    function seemyPlatinum()public returns(uint){
        return tokenB.balanceOf(msg.sender);
    }
    function ExchangeGoldtoPlatinum(uint amountA,address user2,uint amountB)public {
        require(tokenA.transfer(user2,amountA),"Exchange failed");
        require(tokenB.transfer(msg.sender,amountB),"Exchange failed");
    }
      function ExchangePlatinumtoGold(uint amountA,address user2,uint amountB)public {
        require(tokenB.transfer(msg.sender,amountB),"Exchange failed");
        require(tokenA.transfer(user2,amountA),"Exchange failed");
    }


}