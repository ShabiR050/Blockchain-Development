/**
 * Events allow logging to the Ethereum blockchain. Some use cases for events are:
   - Listening for events and updating user interface
   - A cheap form of storage
 */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Event {
    // Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}

// SPDX-License-Identifier: MIT

// Events in Solidity
pragma solidity >=0.8.4; // solidity compiler version

contract Blocktrain {
    struct Student {
        string name;
        string emailId;
        uint256 contactNumber;
        uint256 rollNumber;
        uint256 timestamp;
    }
    mapping(uint256 => Student) public studentDatabase;
    uint256 rollNumber = 1;

    event studentAdded(string name, uint256 rollNumber, uint256 timestamp);

    function addStudent(
        string memory _name,
        string memory _emailId,
        uint256 _contactNumber
    ) public {
        studentDatabase[rollNumber].name = _name;
        studentDatabase[rollNumber].emailId = _emailId;
        studentDatabase[rollNumber].rollNumber = rollNumber;
        studentDatabase[rollNumber].timestamp = block.timestamp;
        studentDatabase[rollNumber].contactNumber = _contactNumber;
        emit studentAdded(_name, rollNumber, block.timestamp);
        rollNumber += 1;
    }
}
