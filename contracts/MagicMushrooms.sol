//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MagicMushroom is ERC721, Ownable{

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  event Minted(address _minter, uint256 _tokenID);

  constructor() ERC721("MagicMushroom", "MUSH") {}

  function mintMushroom(address _minter) public onlyOwner returns (uint256){

    _tokenIds.increment();  // Increment token ids

    uint256 newItemId = _tokenIds.current(); // Get current token id

    _mint(_minter, newItemId); // Mint NFT to minter with current token id

    emit Minted(_minter, newItemId);  // Emit minted event

    return newItemId; // Return NFT id

  }

}