const FaucetContractMigration = artifacts.require("Faucet");

module.exports = function (deployer) {
  deployer.deploy(FaucetContractMigration);
};
