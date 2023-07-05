// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ERC721 {
    mapping(address => uint) tokens;
    mapping(uint => address) tokenOwner;
    mapping(address => mapping(address => uint)) approveArray;

    string public name;
    string public symbol;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    function balanceOf(address _owner) external view returns (uint256) {
        return tokens[_owner];
    }

    function ownerOf(uint tokenId) public view returns (address) {
        return tokenOwner[tokenId];
    }

    function approve(address to, uint tokenId) public {
        require(tokenOwner[tokenId] == msg.sender, "User doesn't own the NFT");
        approveArray[msg.sender][to] = tokenId;
        tokenOwner[tokenId] = to;
    }

    function transferFrom(address from, address to, uint tokenId) public {}
    /**
     * Todo : add all the method required for ERC721
     * create a sample testcase to test
     *
     */
}
