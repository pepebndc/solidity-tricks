const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Struct Decoding", function () {
  it("Should return the user's information after adding it", async function () {
    const structDecodingFactory = await ethers.getContractFactory("StructDecoding");
    const structDecodingContract = await structDecodingFactory.deploy();
    await structDecodingContract.deployed();

    let userData = [
      123,
      true
    ];

    let userEncoded = ethers.utils.defaultAbiCoder.encode (
      ["uint256", "bool"],
      userData
    );

    const addUserTx = await structDecodingContract.addUser(userEncoded);

    // wait until the transaction is mined
    await addUserTx.wait();

    user = await structDecodingContract.user();

    console.log(user);
  });
});
