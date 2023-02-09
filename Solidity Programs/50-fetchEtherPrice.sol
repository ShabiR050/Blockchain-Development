// SPDX-License-Identifier: MIT

// Creating new smart contracts from another smart contract
pragma solidity >=0.8.7; // solidity compiler version

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsume{
    AggregatorV3Interface internal ethPrice;
    constructor(){
        ethPrice = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    }

    function getLatestPrice() public view returns(int){
        (,int price,,,) = ethPrice.latestRoundData();
        return price;

    }
}