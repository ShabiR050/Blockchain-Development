//Merkle tree allows you to cryptographically prove that an element is contained in a set without revealing the entire set.

/**
 * A blockchain is made up of a number of blocks that are connected to one another by links (hence the name blockchain). Using a hash tree, also known as the Merkle tree, blockchain data can be encoded in an efficient and secure manner. When used in conjunction with a peer-to-peer blockchain network, it allows for the rapid verification and movement of enormous volumes of data from one computer node to another on the network.

* Almost every transaction that takes place on the blockchain network is associated with a hash value. On the block, these hashes are not recorded in a sequential sequence, but rather in the form of a tree-like structure, with each hash linked to its parent through a parent-child tree-like relationship between the two hashes.

* Because there are numerous transactions stored on a single block, all of the transaction hashes contained within the block are also hashed, resulting in a Merkle root being generated.

* Consider the case of a transaction block with seven transactions. There will be four transaction hashes at the lowest level of the hierarchy (referred to as the leaf level). There will be two transaction hashes at the level one above the leaf level, each of which will connect to two hashes that are below them at the leaf level, at the level one above the leaf level. At the very top (level two), there will be the last transaction hash, which will be referred to as the root, and it will connect to the two hashes below it by a network of connections (at level one).

* To put it another way, you end up with an upside-down binary tree, with each node of the tree connecting to only two nodes below it (hence the name "binary tree"). A single root hash is located at the top of the structure, which connects to two hashes at level one, each of which connects to the two hashes at level three (leaf-level), and the structure continues indefinitely depending on the number of transaction hashes present.

* The hashing process begins with the nodes at the lowest level (leaf level), and all four hashes are included in the hash of nodes that are related to it at the first level. Similarly, hashing begins at level one, which leads to hashes of hashes reaching higher levels, until it reaches a single top root hash, which is the final result.

* This root hash is referred to as the Merkle root, and it holds all of the information about every single transaction hash that appears on the block due to the tree-like connectivity of hashes that exists between them. It provides a single-point hash value that allows you to validate anything that is contained within that block.

* Consider the following scenario: If someone has to validate a transaction that claims to have originated in block #137, they only need to look at the block's Merkle tree, and they don't have to worry about confirming anything in any other blocks on the blockchain, such as blocks #136 or #138.

* Enter the Merkle root, which expedites the verification process even further. The fact that it contains all of the information about the entire tree means that all that is required is to check that transaction hash, its sister node (if it exists), and then move upward until it reaches the top of the tree

* Essentially, the Merkle tree and Merkle root mechanisms greatly minimize the amount of hashing that must be done, allowing for speedier verification and transaction processing.

* The following program implements merkle tree in Solidity:

 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract MerkleProof {
    function verify(
        bytes32[] memory proof,
        bytes32 root,
        bytes32 leaf,
        uint256 index
    ) public pure returns (bool) {
        bytes32 hash = leaf;

        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];

            if (index % 2 == 0) {
                hash = keccak256(abi.encodePacked(hash, proofElement));
            } else {
                hash = keccak256(abi.encodePacked(proofElement, hash));
            }

            index = index / 2;
        }

        return hash == root;
    }
}

contract TestMerkleProof is MerkleProof {
    bytes32[] public hashes;

    constructor() {
        string[4] memory transactions = [
            "alice -> bob",
            "bob -> dave",
            "carol -> alice",
            "dave -> bob"
        ];

        for (uint256 i = 0; i < transactions.length; i++) {
            hashes.push(keccak256(abi.encodePacked(transactions[i])));
        }

        uint256 n = transactions.length;
        uint256 offset = 0;

        while (n > 0) {
            for (uint256 i = 0; i < n - 1; i += 2) {
                hashes.push(
                    keccak256(
                        abi.encodePacked(
                            hashes[offset + i],
                            hashes[offset + i + 1]
                        )
                    )
                );
            }
            offset += n;
            n = n / 2;
        }
    }

    function getRoot() public view returns (bytes32) {
        return hashes[hashes.length - 1];
    }

    /* verify
    3rd leaf
    0xdca3326ad7e8121bf9cf9c12333e6b2271abe823ec9edfe42f813b1e768fa57b

    root
    0xcc086fcc038189b4641db2cc4f1de3bb132aefbd65d510d817591550937818c7

    index
    2

    proof
    0x8da9e1c820f9dbd1589fd6585872bc1063588625729e7ab0797cfc63a00bd950
    0x995788ffc103b987ad50f5e5707fd094419eb12d9552cc423bd0cd86a3861433
    */
}
