//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TokenB is ERC20{

    address owner;
   constructor(uint256 initialSupply) ERC20("Platinum", "PLT") {
        _mint(msg.sender, initialSupply);
    }
    function minting(address user,uint256 initialSupply)public{
         _mint(user, initialSupply);
    }
}