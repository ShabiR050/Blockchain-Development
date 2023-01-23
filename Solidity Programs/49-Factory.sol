// SPDX-License-Identifier: MIT

// Creating new smart contracts from another smart contract
pragma solidity >=0.8.4; // solidity compiler version

contract Blocktrain {
    ASuperFancySmartContract[] public arrayOfContract;

    function publishing() public {
        ASuperFancySmartContract a = new ASuperFancySmartContract();
        a.doesSuperFancyStuff();
        arrayOfContract.push(a);
    }

    function checkingOwner(uint256 _number) public view returns (address) {
        return arrayOfContract[_number].owner();
    }
}

contract ASuperFancySmartContract {
    address public owner;

    constructor() {
        owner = tx.origin;
    }

    function doesSuperFancyStuff() public {
        // does something I don<t know
    }
}

// factory smart contract => a
//                        => b

// User => Smart Contract Factory => Published Contract

contract Factory{
     Child[] public children;
     uint disabledCount;

    event ChildCreated(address childAddress, uint data);

     function createChild(uint data) external{
       Child child = new Child(data, children.length);
       children.push(child);
       emit ChildCreated(address(child), data);
     }

     function getChildren() external view returns(Child[] memory _children){
       _children = new Child[](children.length- disabledCount);
       uint count;
       for(uint i=0;i<children.length; i++){
          if(children[i].isEnabled()){
             _children[count] = children[i];
             count++;
          }
        }
     }  

     function disable(Child child) external {
        children[child.index()].disable();
        disabledCount++;
     }
 
}
contract Child{
    uint data;
    bool public isEnabled;
    uint public index;
    constructor(uint _data,uint _index){
       data = _data;
       isEnabled = true;
       index = _index;
    }

    function disable() external{
      isEnabled = false;
    }
}

pragma solidity ^0.8.0;

import './CloneFactory.sol';

contract Factory is CloneFactory {
     Child[] public children;
     address masterContract;

     constructor(address _masterContract){
         masterContract = _masterContract;
     }

     function createChild(uint data) external{
        Child child = Child(createClone(masterContract));
        child.init(data);
        children.push(child);
     }

     function getChildren() external view returns(Child[] memory){
         return children;
     }
}

contract Child{
    uint public data;
    
    // use this function instead of the constructor
    // since creation will be done using createClone() function
    function init(uint _data) external {
        data = _data;
    }
}

//Test-case:
contract("Factory", function (/* accounts */) {
  it("should assert true", async function () {
    await Factory.deployed();
    return assert.isTrue(true);
  });

  describe("#createChild()",async () => {
    let factory;
    beforeEach(async ()=>{
      factory = await Factory.deployed();
    });

    it("should create a new child", async () => {
      await factory.createChild(1);
      await factory.createChild(2);
      await factory.createChild(3);
      const children = await factory.getChildren();
      //console.log(children);
      const child1 = await Child.at(children[0]);
      const child2 = await Child.at(children[1]);
      const child3 = await Child.at(children[2]);

      const child1Data = await child1.data();
      const child2Data = await child2.data();
      const child3Data = await child3.data();

      assert.equal(children.length, 3);
      assert.equal(child1Data, 1);
      assert.equal(child2Data, 2);
      assert.equal(child3Data, 3);

    });
  });
});