// SPDX-License-Identifier: MIT

// Sending ERC20 tokens via SmartContract
pragma solidity >=0.8.4; // solidity compiler version

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Blocktrain {
    address public owner;
    uint256 public balance;

    modifier onlyOwner() {
        require(msg.sender == owner, "Can<t touch this!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        balance += msg.value;
    }

    // Simple withdraw function for native tokens - enter the values and get your tokens.
    function withdraw(address to, uint256 value) public onlyOwner {
        require(value <= balance, "Don<t have enough funds!");
        balance -= value;
        payable(to).transfer(value);
    }

    // Simple withdraw function for ERC 20 tokens - you need to call the transfer function with the token parameter.
    function withdrawERC20(
        IERC20 token,
        address to,
        uint256 value
    ) public onlyOwner {
        uint256 erc20balance = token.balanceOf(address(this));
        require(value <= erc20balance, "Don<t have enough funds!");
        token.transfer(to, value);
    }
}
