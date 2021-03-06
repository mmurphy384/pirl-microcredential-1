pragma solidity ^0.4.19;

import "./credential.sol";
import "./ownable.sol";

contract App is Credential, Ownable {

    // State Variables
    string ownerName;
    address wallet;

    function Destroy() public returns (string) {
        // return funds
        // do something to destroy this
        return "success";
    }
}
