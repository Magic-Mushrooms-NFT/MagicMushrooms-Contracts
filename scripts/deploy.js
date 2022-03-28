async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());

  const MushroomMinter = await ethers.getContractFactory("MagicMushroom");
  const mushroomMinter = await MushroomMinter.deploy();

  console.log("Minter address:", mushroomMinter.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });