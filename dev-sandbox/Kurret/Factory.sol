pragma solidity ^0.4.19;

contract App  {


  string nameOfAgency;
  string agencyDescription;
  string addressOfAgency;
  string websiteOfAgency;
  string emailOfAgency;
    address owner;
    address creator;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  struct Credential {
    bytes32 requirements;
    bytes32 name;

    bool received;
    bool approved;
    uint blockApproved;
    uint timeApproved;

  }

  Credential[] credentials;

  event CredentialSubmitted(address sender, uint credentialNumber);
  event CredentialReceived(address sender, uint credentialNumber);

  function App(address _owner) public {
	owner = _owner;
    creator = msg.sender;
	}

  function getOwner() constant public returns (address){
    return owner;
  }

  function getCreator() constant public returns (address){
    return creator;
  }

  function submitMicroCredential() public returns (bool){
    //submitting a credential should include some documentation/photos, right?
    //this could be a great usecase for the Pirl masternode system, namely the masternodes 
    //will store the files for a period of time, at least until the agency has fetched the data themselves
    //after the data has been fetched from the (storage) masternodes, the owner should perhaps call a function
    //called "credentialReceived", acknowledging that the credential application has been seen, data has been received
    //and the process for approval is submitted

    CredentialSubmitted(msg.sender,credentials.length-1);
  }



  function credentialReceived(uint index) public onlyOwner returns (bool){

  }


  function approveMicroCredential(uint index) onlyOwner returns (bool) {
    require(index<credentials.length);
    require(!credentials[index].approved);
    credentials[index].approved=true;
    credentials[index].blockApproved=block.number;
    credentials[index].timeApproved=block.timestamp;


    return true;
  }

}


contract Factory {


mapping (address=>address) apps;

function deployNewContract() public returns (bool){
require(apps[msg.sender]==address(0));
address a;
App app = new App(msg.sender);
apps[msg.sender]=address(app);
return true;
}


function getContractAddress() constant public returns (address) {
return apps[msg.sender];
}





}
