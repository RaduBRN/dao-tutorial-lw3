// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FakeNFTMarketplace {
    // mapping of Fake TokenID to Owner addresses
    mapping(uint256 => address) public tokens;
    // purchase price for each nft
    uint256 nftPrice = 0.1 ether;

    // accepts ETH and marks the owner of the given tokenId as the caller address
    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nftPrice, "This NFT costs 0.1 ether");
        tokens[_tokenId] = msg.sender;
    }

    // returns the price of 1 nft
    function getPrice() external view returns (uint256) {
        return nftPrice;
    }

    // checks if given tokenId has been sold
    function available(uint256 _tokenId) external view returns (bool) {
        // default address (0x00...)
        if (tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }
}
