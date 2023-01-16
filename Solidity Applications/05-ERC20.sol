/**
 * Ethereum, a famous cryptocurrency and blockchain system, is built on the use of tokens, which may be purchased, sold, or exchanged on the Ethereum exchange. Ethereum was first introduced in 2015, and since then it has grown to become one of the most important factors in the rise of cryptocurrency popularity. When used in the Ethereum system, tokens can represent a wide variety of digital assets, including vouchers, IOUs, and even physical, actual goods in the real world. Ethereum tokens, in their most basic form, are smart contracts that make use of the Ethereum network.


* The ERC-20 token is considered to be one of the most important Ethereum tokens. This standard has emerged as the technical standard for token implementation on the Ethereum blockchain; it is used for all smart contracts on the blockchain, and it specifies a set of criteria that all Ethereum-based tokens must follow in order to be considered valid.

* ERC-20 is similar to bitcoin, Litecoin, and any other cryptocurrency in that it is a blockchain-based asset that has value and can be transmitted and received; however, ERC-20 tokens are not a cryptocurrency in the traditional sense. The key distinction between ERC-20 tokens and other cryptographic tokens is that they are released on the Ethereum network rather than on their own blockchain.

ERC-20 establishes a standardized set of rules.

* As of March 24, 2022, there are around 508,074 ERC-20-compatible tokens on Ethereum's main network, according to CoinMarketCap.
2 The ERC-20 standard is critical because it establishes a set of rules that all Ethereum tokens must follow in order to function properly. Some of these regulations govern how tokens can be moved, how transactions are approved, how users can access information about a token, and the overall number of tokens available for circulation.

* As a result, this special token standard provides developers of all kinds with the ability to precisely predict how new tokens will function inside the broader Ethereum system. For developers, this simplifies the process at hand; they can proceed with their work confident that each and every new project will not need to be rewritten every time a new token is published, as long as the token complies with the rules. This compliance is also required since it assures that the numerous different tokens created on Ethereum are compatible with one another.

* Unfortunately, the vast majority of token developers have failed to comply with ERC-20 guidelines, resulting in the fact that the vast majority of tokens issued through Ethereum initial coin offers (ICOs) are not ERC-20 compliant.

* A large number of well-known digital currencies, such as Maker (MKR), Basic Attention Token (BAT), Augur (REP), and OmiseGO (OMG), are built on the ERC-20 standard (OMG). If you intend to purchase any digital currency that has been released as an ERC-20 token, you must also have a wallet that is compatible with these tokens in order to complete the transaction. The fact that ERC-20 tokens are so popular means that there are many different wallet alternatives to choose from.

 * Any contract that follow the ERC20 standard is a ERC20 token.

ERC20 tokens provide functionalities to

    - transfer tokens
    - allow others to transfer tokens on behalf of the token holder
Here is the interface for ERC20.
 */

//ERC20 Interface:-->
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol
interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

//Example of ERC20 token contract.:
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract ERC20 is IERC20 {
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    string public name = "Solidity by Example";
    string public symbol = "SOLBYEX";
    uint8 public decimals = 18;

    function transfer(address recipient, uint256 amount)
        external
        returns (bool)
    {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint256 amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint256 amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
//Using Open Zeppelin it's really easy to create your own ERC20 token.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        _mint(msg.sender, 100 * 10**uint256(decimals()));
    }
}

/**
 * Here is an example contract, TokenSwap, that can be used to trade one ERC20 token for another in the Ethereum blockchain.

* This contract will trade tokens by using the swap function,which will transfer the token's value from the sender to the recipient.

* In order for transferFrom to be successful, the sender must have more tokens in their balance than the maximum number of tokens allowed. TokenSwap can withdraw a quantity of tokens by calling approve first, then calling transfer after TokenSwap has called transfer. 

 * 
 * Contract to swap tokens
Here is an example contract, TokenSwap, to trade one ERC20 token for another.

This contract will swap tokens by calling:
    transferFrom(address sender, address recipient, uint256 amount)
which will transfer amount of token from sender to recipient.

For transferFrom to succeed, sender must:
    - have more than amount tokens in their balance
    - allowed TokenSwap to withdraw amount tokens by calling approve
prior to TokenSwap calling transferFrom.
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/IERC20.sol";

/*
How to swap tokens

1. Alice has 100 tokens from AliceCoin, which is a ERC20 token.
2. Bob has 100 tokens from BobCoin, which is also a ERC20 token.
3. Alice and Bob wants to trade 10 AliceCoin for 20 BobCoin.
4. Alice or Bob deploys TokenSwap
5. Alice approves TokenSwap to withdraw 10 tokens from AliceCoin
6. Bob approves TokenSwap to withdraw 20 tokens from BobCoin
7. Alice or Bob calls TokenSwap.swap()
8. Alice and Bob traded tokens successfully.
*/

contract TokenSwap {
    IERC20 public token1;
    address public owner1;
    uint256 public amount1;
    IERC20 public token2;
    address public owner2;
    uint256 public amount2;

    constructor(
        address _token1,
        address _owner1,
        uint256 _amount1,
        address _token2,
        address _owner2,
        uint256 _amount2
    ) {
        token1 = IERC20(_token1);
        owner1 = _owner1;
        amount1 = _amount1;
        token2 = IERC20(_token2);
        owner2 = _owner2;
        amount2 = _amount2;
    }

    function swap() public {
        require(msg.sender == owner1 || msg.sender == owner2, "Not authorized");
        require(
            token1.allowance(owner1, address(this)) >= amount1,
            "Token 1 allowance too low"
        );
        require(
            token2.allowance(owner2, address(this)) >= amount2,
            "Token 2 allowance too low"
        );

        _safeTransferFrom(token1, owner1, owner2, amount1);
        _safeTransferFrom(token2, owner2, owner1, amount2);
    }

    function _safeTransferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint256 amount
    ) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
    }
}

//To implement the token swap, execute the following function call:
transferFrom(address sender, address recipient, uint256 amount)