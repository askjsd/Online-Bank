// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.

  // We get the contract to deploy in the contracts folder for Greeter.sol


  const Consultant = await hre.ethers.getContractFactory("Consultant"); // obtain object
  const consultant = await Consultant.deploy(); // deploy with a string constructor

  //await consultant.deployed(); // wait for contract to be deployed

  console.log("Consultant deployed to:", consultant.address);



  // const Consultant = await hre.ethers.getContractFactory("consultant"); // obtain object
  // const consultant = await Consultant.deploy(); // deploy with a string constructor

  // await consultant.deployed(); // wait for contract to be deployed

  // console.log("Consultant deployed to:", consultant.address);
}



// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

