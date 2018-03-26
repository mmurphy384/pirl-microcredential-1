pragma solidity ^0.4.19;

import "./MyUtils.sol";
import "./Subscriber.sol";
import "./Credential.sol";

contract Microcredential {

    // Events

    // State Variables
    string ownerName;
    address wallet;
    
    // Structs

    // Arrays

    // Mappings

    // Constructor
    function Microcredential(string _ownerName) {
        ownerName = _ownerName;
        wallet = msg.sender;
    }

    // Public functions
    function ChangeOwnerName(string _ownerName) {
        require (wallet = msg.sender);
        ownerName = _ownerName;
        
    }

    function Destroy() public returns (string) {
        // return funds
        // do something to destroy this
        return "success";
    }
}
