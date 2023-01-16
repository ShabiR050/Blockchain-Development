/**
 * Multisig: is an abbreviation for multi-signature, which is a sort of digital signature that allows two or more users to sign documents together as a group. Therefore, a multi-signature is created by combining numerous distinct signatures into a single document. Even while multisig technology has been around for a while in the realm of cryptocurrencies, its underlying idea dates back well before the invention of the Bitcoin currency.

* As for cryptocurrencies, the concept was first applied to Bitcoin addresses in 2012, which finally led to the establishment of multisig wallets the following year. Multisig addresses can be utilized in a variety of situations, although the vast majority of them are related to security issues. In this section, we will examine their application in cryptocurrency wallets.

What is the procedure?

* As a simple illustration, consider a safe deposit box with two locks and two keys. Alice is in possession of one key, and Bob is in possession of the other. The only way they can open the box is if they both provide their keys at the same moment, which means that one cannot access the box without the approval of the other.

* Essentially, funds saved on a multi-signature address can only be retrieved by using two or more signatures, unless the address is changed. As a result, the usage of a multisig wallet enables users to add an additional layer of security to their funds, increasing their overall security. However, before proceeding, it is necessary to grasp the fundamentals of a normal Bitcoin address, which relies on a single key rather than many keys (single-key address).


Single-key VS Multisignature:

* Standard, single-key addresses for Bitcoin are used to store the digital currency. This means that anyone who has access to that address's associated private key is able to access the money. In practice, this implies that only one key is required to sign transactions, and anyone who has the private key has the ability to transfer the money at their leisure, without the need for permission from anyone else.


* While managing a single-key address is more convenient and faster than managing a multisig address, it comes with a number of drawbacks, particularly in terms of security. It is because of this single point of failure that the funds are safeguarded, which is why fraudsters are continuously devising new phishing schemes to attempt to steal the bitcoins and other cryptocurrencies that are being used.

* Furthermore, single-key addresses are not the greatest option for enterprises who are involved in cryptocurrency transactions and exchanges. Consider the scenario in which the funds of a large corporation are kept on a standard address with a single associated private key. Essentially, this would mean that the private key would be handed to either a single individual or to a group of individuals at the same time - neither of which is the most secure option.

* Multisig wallets have the ability to provide a solution to both of these issues. It is not possible to move cash stored on a multisig address without providing multiple signatures, which is in contrast to single-key (which are generated through the use of different private keys).

* It is possible that a multisig address will require a different combination of keys depending on how it is configured: One of the most prevalent types of 2-of-3 addresses is one in which just two signatures are required to access the funds of a three-signature address. However, there are numerous different permutations, such as 2-of-2, 3-of-3, 3-of-4, and so on, that can be played.

* There are a plethora of potential uses for this technological advancement. Here are a few of the most prevalent scenarios in which multi-signature bitcoin wallets are employed.


Increasing the level of security:

* By utilizing a multisig wallet, users can avoid the difficulties that can arise as a result of the loss or theft of a private key. Because of this, even if one of the keys is compromised, the money is still protected.

* Consider the following scenario: Alice establishes a 2-of-3 multisig address and then saves each private key in a separate location or device (e.g. mobile phone, laptop, and tablet). Even if her mobile device is taken, the thief will not be able to access her cash if he or she just has one of the three keys in their possession. Additionally, phishing assaults and malware infections are less likely to succeed because the hacker would most likely only have access to a single device and its associated encryption key.

* Even if Alice loses one of her private keys as a result of a malicious attack, she will still be able to access her funds using the other two keys.

Two-factor authentication (also known as two-factor authentication):

* Alice is able to construct a two-factor authentication mechanism for accessing her funds by establishing a multisig wallet with two keys that requires two keys. In this case, she may have one private key kept on her laptop and another stored on her mobile device (or even on a piece of paper). Only someone who has access to both keys would be able to complete a transaction as a result of this arrangement.

* Always keep in mind, however, that utilizing multisignature technology as a two-factor authentication method can be risky, particularly if the address is configured as a 2-of-2 multisignature address. If you misplace one of the keys, you will not be able to access your funds until you replace it. As a result, employing a two-of-three setup or a third-party two-factor authentication solution that includes backup codes would be safer. Google Authenticator is highly recommended for crypto exchange trading accounts when it comes to ensuring the security of your accounts.


Transactions that are held in escrow:

* In the instance of an escrow transaction between two parties (Alice and Bob), the creation of a 2-of-3 multisig wallet can allow for the inclusion of a third person (Charlie) as a mutually trusted arbitrator in the event that something goes wrong.

* In such a scenario, Alice would first deposit the funds, which would then be placed in a trust account (neither user being able to access them on their own). Then, if Bob provides the products or services in accordance with the agreement, they can both use their keys to sign and close the transaction.

* In the event of a disagreement, Charlie, the arbiter, would only be required to intervene, at which time he may use his key to generate a signature that would be sent to either Alice or Bob, depending on Charlie's decision.


The process of making a decision:

* A multisig wallet may be used by a company's board of directors to control access to the company's cash. For example, by establishing a 4-of-6 wallet in which each board member has one key, it is impossible for any individual board member to misuse the cash. As a result, only choices that have been unanimously approved by the majority can be implemented.

Disadvantages of Multisig Wallets:

* Despite the fact that multisig wallets are a suitable solution for a variety of problems, it is crucial to remember that there are some dangers and limits associated with using them. A multisig address requires some technical knowledge, especially if you do not want to rely on third-party service providers for the setup.


* Furthermore, because blockchain technology and multisignature addresses are both relatively new concepts, it may be difficult to seek legal remedy if something goes wrong with the system. There is no legal stewardship of funds deposited into a shared wallet with many keyholders because there is no legal stewardship.

 * Let's create an multi-sig wallet. Here are the specifications.

* The wallet owners can:
    - submit a transaction
    - approve and revoke approval of pending transcations
    - anyone can execute a transcation after enough owners has approved it.
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract MultiSigWallet {
    event Deposit(address indexed sender, uint256 amount, uint256 balance);
    event SubmitTransaction(
        address indexed owner,
        uint256 indexed txIndex,
        address indexed to,
        uint256 value,
        bytes data
    );
    event ConfirmTransaction(address indexed owner, uint256 indexed txIndex);
    event RevokeConfirmation(address indexed owner, uint256 indexed txIndex);
    event ExecuteTransaction(address indexed owner, uint256 indexed txIndex);

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint256 public numConfirmationsRequired;

    struct Transaction {
        address to;
        uint256 value;
        bytes data;
        bool executed;
        uint256 numConfirmations;
    }

    // mapping from tx index => owner => bool
    mapping(uint256 => mapping(address => bool)) public isConfirmed;

    Transaction[] public transactions;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "not owner");
        _;
    }

    modifier txExists(uint256 _txIndex) {
        require(_txIndex < transactions.length, "tx does not exist");
        _;
    }

    modifier notExecuted(uint256 _txIndex) {
        require(!transactions[_txIndex].executed, "tx already executed");
        _;
    }

    modifier notConfirmed(uint256 _txIndex) {
        require(!isConfirmed[_txIndex][msg.sender], "tx already confirmed");
        _;
    }

    constructor(address[] memory _owners, uint256 _numConfirmationsRequired) {
        require(_owners.length > 0, "owners required");
        require(
            _numConfirmationsRequired > 0 &&
                _numConfirmationsRequired <= _owners.length,
            "invalid number of required confirmations"
        );

        for (uint256 i = 0; i < _owners.length; i++) {
            address owner = _owners[i];

            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner not unique");

            isOwner[owner] = true;
            owners.push(owner);
        }

        numConfirmationsRequired = _numConfirmationsRequired;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function submitTransaction(
        address _to,
        uint256 _value,
        bytes memory _data
    ) public onlyOwner {
        uint256 txIndex = transactions.length;

        transactions.push(
            Transaction({
                to: _to,
                value: _value,
                data: _data,
                executed: false,
                numConfirmations: 0
            })
        );

        emit SubmitTransaction(msg.sender, txIndex, _to, _value, _data);
    }

    function confirmTransaction(uint256 _txIndex)
        public
        onlyOwner
        txExists(_txIndex)
        notExecuted(_txIndex)
        notConfirmed(_txIndex)
    {
        Transaction storage transaction = transactions[_txIndex];
        transaction.numConfirmations += 1;
        isConfirmed[_txIndex][msg.sender] = true;

        emit ConfirmTransaction(msg.sender, _txIndex);
    }

    function executeTransaction(uint256 _txIndex)
        public
        onlyOwner
        txExists(_txIndex)
        notExecuted(_txIndex)
    {
        Transaction storage transaction = transactions[_txIndex];

        require(
            transaction.numConfirmations >= numConfirmationsRequired,
            "cannot execute tx"
        );

        transaction.executed = true;

        (bool success, ) = transaction.to.call{value: transaction.value}(
            transaction.data
        );
        require(success, "tx failed");

        emit ExecuteTransaction(msg.sender, _txIndex);
    }

    function revokeConfirmation(uint256 _txIndex)
        public
        onlyOwner
        txExists(_txIndex)
        notExecuted(_txIndex)
    {
        Transaction storage transaction = transactions[_txIndex];

        require(isConfirmed[_txIndex][msg.sender], "tx not confirmed");

        transaction.numConfirmations -= 1;
        isConfirmed[_txIndex][msg.sender] = false;

        emit RevokeConfirmation(msg.sender, _txIndex);
    }

    function getOwners() public view returns (address[] memory) {
        return owners;
    }

    function getTransactionCount() public view returns (uint256) {
        return transactions.length;
    }

    function getTransaction(uint256 _txIndex)
        public
        view
        returns (
            address to,
            uint256 value,
            bytes memory data,
            bool executed,
            uint256 numConfirmations
        )
    {
        Transaction storage transaction = transactions[_txIndex];

        return (
            transaction.to,
            transaction.value,
            transaction.data,
            transaction.executed,
            transaction.numConfirmations
        );
    }
}

//Here is a contract to test sending transactions from the multi-sig wallet:

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract TestContract {
    uint256 public i;

    function callMe(uint256 j) public {
        i += j;
    }

    function getData() public pure returns (bytes memory) {
        return abi.encodeWithSignature("callMe(uint256)", 123);
    }
}
