// SPDX-License-Identifier:Unlicense

pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted address allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelisted address
    // If an address is whitelisted, we would set it to true , it is false by default for all other address
    mapping(address => bool) public WhitelistedAddresses;

    // numAddressWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment

    constructor(uint8 _maxWhitelistedAddress) {
        maxWhitelistedAddresses = _maxWhitelistedAddress;
    }

    /** 
    addAddressToWhitelist - This function adds the addresss of the sender to the whitelist
    */

    function addAddressToWhitelist() public{
        // check if the user has already been whitelisted
        require(!WhitelistedAddresses[msg.sender],"Sender has already been whitelisted");
        // check if the numAddressWhitelisted < maxwhitelistedAddresses, if not throw an error.
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More address cannot be aaded , Limit reached");
        // Add the address which called the function to the whitelistedAddress array
        WhitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}