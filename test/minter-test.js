const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Magic Mushroom tests", function (){
  var mushroomMinter;

  beforeEach(async function(){

    const MushroomMinter = await ethers.getContractFactory("MagicMushroom");
    mushroomMinter = await MushroomMinter.deploy();
    await mushroomMinter.deployed();
  });

  it("Mint NFT for owner", async function() {
    const [owner] = await ethers.getSigners();

    let balance = await mushroomMinter.balanceOf(owner.address);
    expect(balance).to.equal(0);

    await mushroomMinter.mintMushroom(owner.address);

    balance = await mushroomMinter.balanceOf(owner.address);
    expect(balance).to.equal(1);

  });

  it("Mint NFT for non-owner", async function() {
    const [owner, minter] = await ethers.getSigners();

    await mushroomMinter.connect(owner).mintMushroom(minter.address);

    expect(await mushroomMinter.balanceOf(minter.address)).to.equal(1);

    await expect(mushroomMinter.connect(minter).mintMushroom(minter.address)).to.be.reverted;


  })
});
