var FTChainLinkContract = artifacts.require("FTChainLinkContract");

var link = "0x01BE23585060835E02B77ef475b0Cc51aA1e0709";
var oracle = "0x7AFe1118Ea78C1eae84ca8feE5C65Bc76CcF879e";

module.exports = (deployer, network, accounts) => {
  deployer.deploy(FTChainLinkContract, link, oracle, {from: accounts[0]});
};