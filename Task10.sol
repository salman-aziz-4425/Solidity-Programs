
//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;
contract fundsTransfer{

    address owner;
    mapping(address=>bool) public permisions;
    address[] public keys;
    constructor(address[] memory owners){
        require(owners.length>0,"Their are no owner");
        keys=owners;
    }
    function gavePermision()public returns(bool){
        for(uint i=0;i<keys.length;i++){
            if(msg.sender==keys[i]){
              permisions[msg.sender]=true;
              return true;
            }
        }
        return false;
    }
    function getfunds()public payable{
       require(keys.length>0,"Rsgister authorities first");
       uint counter=0;
       for (uint key=0;key<keys.length;key++) {
           if(permisions[keys[key]]==true){
               counter+=1;
           }
      }
    require(counter==keys.length,"Not all approved");
    payable(msg.sender).transfer(address(this).balance);
     for (uint key=0;key<keys.length;key++) {
         permisions[keys[key]]=false;
      }
    }

}