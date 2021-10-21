// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 publicWaveCount;
    uint256 trueWaveCount;
    mapping(address => uint256) public wavesOf;

    constructor() {
        console.log("I'm a contract and I have big brain");
    }

    function wave() public {
        incrementWaves();
        // notice that wavesOf[anything] is 0 by default
        wavesOf[msg.sender] += 1;
        console.log("%s has waved!", msg.sender);
    }

    function unWave() public {
        decrementWaves();
        wavesOf[msg.sender] -= 1;
        console.log("%s has unwaved!", msg.sender);
    }

    function getTotalWaveCount() public view returns (uint256) {
        console.log("We have %d waves in total!", publicWaveCount);
        return publicWaveCount;
    }

    function incrementWaves() private {
        trueWaveCount++;
        publicWaveCount++;
    }

    function decrementWaves() private {
        trueWaveCount--;
        if (publicWaveCount > 0)
          publicWaveCount--;
    }
}