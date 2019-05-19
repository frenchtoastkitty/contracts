var WeatherGame = artifacts.require("WeatherGame");

module.exports = (deployer, network, accounts) => {
  deployer.deploy(WeatherGame, {from: accounts[0]});
};