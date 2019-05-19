pragma solidity 0.4.24;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract WeatherGame is Ownable {

    uint256 public woeid; // start with one now

    // 5 day mapping and data
    mapping (uint256 => Metadata) public kittyIdToMetadata;
    mapping (address => uint256) public userToId;
    mapping (address => uint256) public userToWoeid;

   struct Metadata {
        bytes32 weather;
        uint256 timestamp;
    }

    constructor() public {
        woeid = 2459115; // default to brooklyn
    }

    // @dev update in case user sets a location
    function setWoeid(uint256 _woeid) public {
        userToWoeid[msg.sender] = woeid;
    }

    function addKittyId(uint256 id, uint256 _woeid) public {
        userToId[msg.sender] = id;
        userToWoeid[msg.sender] = _woeid;
        kittyIdToMetadata[id] = Metadata("", now);
    }

    function updateWeather(uint256 id, bytes32 data) public {
        kittyIdToMetadata[id] = Metadata(data, now);
    }

    function getWeather(uint256 id) public view returns (bytes32) {
        return kittyIdToMetadata[id].weather;
    }
}