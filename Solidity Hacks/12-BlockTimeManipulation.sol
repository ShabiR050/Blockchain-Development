/**
 * 
 * A miner has the ability to manipulate the block timestamp, which they can exploit to their advantage in order to attack a smart contract on the blockchain. In this tutorial, we'll go through how a miner can manipulate the Ethereum system in order to take Ether from a Solidity smart contract, and we'll do it with Solidity.

 * Blocks contain a timestamp field in the block header, which is set by the miner and can be altered to anything the miner desires at any time (with some restriction). It is necessary for a miner to win the next block in order to set a block timestamp, and they must also adhere to the following time constraints:

 * The timestamp for the next block is immediately following the timestamp for the previous block.
 * The timestamp cannot be more than a few days in the future.
 * If a miner wins a block, he or she has the ability to subtly alter the block timestamp to their favor.

 * block.timestamp can be manipulated by miners with the following constraints:

 - it cannot be stamped with an earlier time than its parent
 - it cannot be too far in the future
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

/*
Roulette is a game where you can win all of the Ether in the contract
if you can submit a transaction at a specific timing.
A player needs to send 10 Ether and wins if the block.timestamp % 15 == 0.
*/

/*
1. Deploy Roulette with 10 Ether
2. Eve runs a powerful miner that can manipulate the block timestamp.
3. Eve sets the block.timestamp to a number in the future that is divisible by
   15 and finds the target block hash.
4. Eve's block is successfully included into the chain, Eve wins the
   Roulette game.
*/

contract Roulette {
    uint public pastBlockTime;

    constructor() payable {}

    function spin() external payable {
        require(msg.value == 10 ether); // must send 10 ether to play
        require(block.timestamp != pastBlockTime); // only 1 transaction per block

        pastBlockTime = block.timestamp;

        if (block.timestamp % 15 == 0) {
            (bool sent, ) = msg.sender.call{value: address(this).balance}("");
            require(sent, "Failed to send Ether");
        }
    }
}

//Don't use block.timestamp for a source of entropy and random number