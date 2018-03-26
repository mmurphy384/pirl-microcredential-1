pragma solidity ^0.4.19;

import "./Credential.sol";

contract App is Credential {

    // State Variables
    string ownerName;
    address wallet;

    // Constructor
    function App(string _ownerName) {
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
