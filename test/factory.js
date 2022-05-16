const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Proxy Factory system", function () {
  it("Should deploy a single token and initialize it", async function () {
    const tokenFactory = await ethers.getContractFactory("TokenImplementation");
    const tokenContract = await tokenFactory.deploy();
    await tokenContract.deployed();

    const initializeTx = await tokenContract.initialize("PEPE STABLECOIN", "PPS");

    // wait until the transaction is mined
    await initializeTx.wait();

  });


  it("Should deploy a Factory and a token instance", async function () {
    const tokenFactory = await ethers.getContractFactory("TokenFactory");
    const tokenContract = await tokenFactory.deploy();
    await tokenContract.deployed();

    const birthTx = await tokenContract.birth("PEPE STABLECOIN", "PPS");

    // wait until the transaction is mined
    await birthTx.wait();

  });

});
