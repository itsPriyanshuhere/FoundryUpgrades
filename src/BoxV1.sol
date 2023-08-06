//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

// storage is store in proxy contract, NOT the implementation.
//Proxy (borrowing funcs) -> Implementation
// proxy -> deploy implementation -> call some "intializier" function
// which is some sort of constructor

contract BoxV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function intialize() public initializer {
       __Ownable_init(); // sets owner to: owner = msg.sender
       __UUPSUpgradeable_init();
    }

    function  getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256){
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}