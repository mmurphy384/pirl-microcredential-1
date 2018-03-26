pragma solidity ^0.4.19;


contract Subscriber {

    // Events
    event NewSubscriber(uint userId, string userKey, string userName, string userSponsor);
    
    // Structs
    struct Organization {
        uint id;
        address wallet;
        string name;
    }    

    // Arrays
    Organization[] private orgs;
    
    // Mappings
    mapping(address => uint) public orgMapping;
    
    // Public functions
    function AddOrganization(string _name) public returns (string) {
        require(orgMapping[msg.sender]==0);
        uint id = orgs.push(Organization(orgs.length + 1,msg.sender, _name))-1;
        orgMapping[msg.sender] = id;
        return "success";
    }    
    
}
