const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("RegisterDisasterModule", (m) => {
  // Deploy the contract
  const registerDisaster = m.contract("RegisterDisaster", []);

  // You can return the deployed contract instance
  return { registerDisaster };
});
