require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.3",
  networks: {
    buildbear: {
      url: "https://rpc.buildbear.io/eastern-ratts-tyerel-a65f07de",
      accounts: {
        mnemonic: 'stem program proof jealous layer fashion emerge sad throw asset scrub width'
      }
    }
  }
  
};
