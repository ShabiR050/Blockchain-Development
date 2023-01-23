// SPDX-License-Identifier: MIT

// Let<s code a Vault
pragma solidity >=0.8.4; // solidity compiler version

contract Blocktrain {
    // variables

    address public owner;

    struct locker {
        uint256 value;
        uint256 time_locked;
    }
    uint256 counter = 0;
    mapping(uint256 => locker) public Vault;

    // modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Can<t touch this!!");
        _;
    }

    // constructor
    constructor() {
        owner = msg.sender;
    }

    // functions

    function deposit(uint256 _time) public payable onlyOwner {
        counter += 1;
        Vault[counter].time_locked = _time;
        Vault[counter].value = msg.value;
    }

    function withdraw(uint256 _lockerNumber) public onlyOwner {
        require(
            block.timestamp >= Vault[_lockerNumber].time_locked,
            "Come back later !!"
        );
        payable(owner).transfer(Vault[_lockerNumber].value);
    }
} // SPDX-License-Identifier: MIT

// Let<s code a Vault
pragma solidity >=0.8.4; // solidity compiler version

contract Blocktrain {
    // variables

    address public owner;

    struct locker {
        uint256 value;
        uint256 time_locked;
    }
    uint256 counter = 0;
    mapping(uint256 => locker) public Vault;

    // modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Can<t touch this!!");
        _;
    }

    // constructor
    constructor() {
        owner = msg.sender;
    }

    // functions

    function deposit(uint256 _time) public payable onlyOwner {
        counter += 1;
        Vault[counter].time_locked = _time;
        Vault[counter].value = msg.value;
    }

    function withdraw(uint256 _lockerNumber) public onlyOwner {
        require(
            block.timestamp >= Vault[_lockerNumber].time_locked,
            "Come back later !!"
        );
        payable(owner).transfer(Vault[_lockerNumber].value);
    }
}
