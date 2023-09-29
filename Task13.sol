//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract blindAuction{
    mapping(address=>uint) public bidders;
    address[] public keys;
    address owner;

    constructor(){
        owner=msg.sender;
    }

    function dobiding(uint value)public{
        bidders[msg.sender]+=value;
        for(uint i=0;i<keys.length;i++){
            if(msg.sender==keys[i]){
                return;
            }
        }
        keys.push(msg.sender);
    }
 function myMappingFunction() public view returns (address[] memory) {
  return keys;
}
    function pickWinner()public returns(address){
        require(msg.sender==owner,"Only manager is allowed");
        uint max=0;
        address user;
        for(uint i=0;i<keys.length;i++){
            if(max<bidders[keys[i]]){
                max=bidders[keys[i]];
                user=keys[i];
            }
        }
        return user;
    }
}
