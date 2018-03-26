pragma solidity ^0.4.19


contract Subscriber {

    event NewSubscriber(uint userId, string userKey, string userName, string userSponsor);
    
    // Structs
    struct Subscriber {
        uint id;
        address wallet;
        string name;
    }    

    // Arrays
    Subscriber[] private subscribers;
    
    // Mappings
    mapping(address => uint) public subscriberMapping;
    
    
    // Public functions
    function AddSubscriber(string _name) public returns (string) {
        require(subscriberMapping[msg.sender]==0);
        uint id = subscribers.push(Subscriber(subscribers.length + 1,msg.sender, _name))-1;
        subscriberMapping[msg.sender] = id;
        return "success";
    }    
    
}
