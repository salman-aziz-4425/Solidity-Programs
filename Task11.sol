pragma solidity ^0.8.0;

contract TokenStaking {
    mapping(address => uint256) public stakedTokens; 
    mapping(address => uint256) public lastStakeTime; 
    uint256 public rewardRate;
    constructor(uint256 _rewardRate) {
        rewardRate = _rewardRate;
    }
    function stakeTokens(uint256 _numTokens) public {
        require(_numTokens > 0, "Must stake at least 1 token");
        uint256 reward = (block.timestamp - lastStakeTime[msg.sender]) * rewardRate * stakedTokens[msg.sender];
        stakedTokens[msg.sender] += _numTokens;
        lastStakeTime[msg.sender] = block.timestamp;
    
        payable(msg.sender).transfer(reward);
    }
}

