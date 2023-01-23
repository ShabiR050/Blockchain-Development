/**
 * There are 3 types of variables in Solidity:
local:
    - declared inside a function
    - not stored on the blockchain
state:
    - declared outside a function
    - stored on the blockchain
global: (provides information about the blockchain)
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() public view {
        // Local variables are not saved to the blockchain.
        uint256 i = 456;

        // Here are some global variables
        uint256 timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
    }
}

// SPDX-License-Identifier: MIT

// Variables and Function Visibility Deep Dive
pragma solidity >=0.8.4; // solidity compiler version

contract Blocktrain {
    // variables visibility

    // private => variable can only be called from the original contract
    uint256 private coins = 0;

    // internal => variable can also be called from the contracts who inherit original contract
    uint256 internal variable = 0;

    // public => variable can be accessed from anywhere
    uint256 public IamPublic = 0;

    // functions visibility

    // private => function can only be called from the original contract
    function setValue() private {
        // do something
    }

    // internal => functions can be called by other contracts who inherit original contract
    function getValue() internal {
        // do something
    }

    // external => function can only be called from outside the contract
    function someRandomFunction() external {
        // do something
    }

    // public => function can be called from anywhere
    function otherRandomFunction() public {
        // do something
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Function {
    // Functions can return multiple values.
    function returnMany()
        public
        pure
        returns (
            uint256,
            bool,
            uint256
        )
    {
        return (1, true, 2);
    }

    // Return values can be named.
    function named()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        return (1, true, 2);
    }

    // Return values can be assigned to their name.
    // In this case the return statement can be omitted.
    function assigned()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        x = 1;
        b = true;
        y = 2;
    }

    // Use destructuring assignment when calling another
    // function that returns multiple values.
    function destructuringAssignments()
        public
        pure
        returns (
            uint256,
            bool,
            uint256,
            uint256,
            uint256
        )
    {
        (uint256 i, bool b, uint256 j) = returnMany();

        // Values can be left out.
        (uint256 x, , uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Cannot use map for either input or output

    // Can use array for input
    function arrayInput(uint256[] memory _arr) public {}

    // Can use array for output
    uint256[] public arr;

    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }
}
