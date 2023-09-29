//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;
contract Lottery{

   address public manager;
   address payable[] public participants;

    constructor()
    {
        manager=msg.sender;//gloabl variable   
    }
    function receivePay() external payable
    {
        require(msg.value==1 ether);//condition atleast 1 ether shoeul transfer
        participants.push(payable(msg.sender));
    }
    function getBal() public view returns(uint)
    {
        require(msg.sender== manager);
        return address(this).balance;
    }
    function random() public view returns(uint)
    {
      return uint(keccak256(abi.encodePacked(block.prevrandao,block.timestamp,participants.length)));
    }
    function selectWinner() public
    {
        require(msg.sender==manager);
        require(participants.length>=3);
        uint r=random();
        uint index=r%participants.length;
        address payable winner;
        winner=participants[index];
        winner.transfer(getBal());

    }
}