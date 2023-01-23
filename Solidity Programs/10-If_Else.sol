// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract IfElse {
    function foo(uint256 x) public pure returns (uint256) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint256 _x) public pure returns (uint256) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // shorthand way to write if / else statement
        // the "?" operator is called the ternary operator
        return _x < 10 ? 1 : 2;
    }
}

// SPDX-License-Identifier: MIT

// Loops & Break Keyword
pragma solidity >=0.8.4; // solidity compiler version

contract Blocktrain {
    mapping(uint256 => string) public students;

    // Types of Loops
    // 1. For Loop
    function add(uint256 _num) public {
        for (uint256 i = 0; i < _num; i++) {
            students[i] = "Blocktrain";
        }
    }

    // 2. While Loop
    function addNames(string[] memory _names) public {
        uint256 i = 0;
        while (
            i < _names.length // entry controlled
        ) {
            students[i] = _names[i];
            i++;
        }
    }

    // 3. Do While Loop
    function letsBreak(uint256 _num) public {
        do {
            students[0] = "Blocktrain";
        } while (_num < 0); // exit controlled
    }

    // Break Keyword

    uint256 public coins = 0;

    function something() public {
        for (int256 i = 0; i < 10; i++) {
            if (i == 4) {
                break;
            }
            coins++;
        }
    }
}
