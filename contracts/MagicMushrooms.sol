//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract MagicMushroom is ERC721, Ownable{

  address maticAddr = 0x0000000000000000000000000000000000001010;
  ERC20 matic = ERC20(maticAddr);

  uint256 mushroomPrice = 2 * 10**18;

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  event Minted(address _minter, uint256 _tokenID);

  constructor() ERC721("MagicMushroom", "MUSH") {}

  function mintMushroom() public returns (uint256){

    uint256 minterBalance = matic.balanceOf(msg.sender);  // Get MATIC balance of minter
    require(minterBalance >= mushroomPrice, "Insufficient funds");  // Check MATIC balance of minter

    

    _tokenIds.increment();  // Increment token ids

    uint256 newItemId = _tokenIds.current(); // Get current token id

    _mint(msg.sender, newItemId); // Mint NFT to minter with current token id

    emit Minted(msg.sender, newItemId);  // Emit minted event

    return newItemId; // Return NFT id

  }

}