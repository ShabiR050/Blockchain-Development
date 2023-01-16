/**
 * Ethereum wallets are applications that let you interact with your Ethereum account. Think of it like an internet banking app – without the bank. Your wallet lets you read your balance, send transactions and connect to applications.

An example of a basic Ether wallet:

●	Anyone can send ETH.
●	Only the owner can withdraw.


Solidity code to implement a basic Ether wallet:

 */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

