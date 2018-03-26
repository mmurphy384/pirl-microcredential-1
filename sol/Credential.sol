pragma solidity ^0.4.19;

import "./Subscriber.sol";
import "./MyUtils.sol";

contract Credential is Subscriber, MyUtils {

    // Events
    event NewCredential(uint userId, uint credentialId, string credentialTitle);
    event ApprovedCredential(uint credentialId, uint userId, string credentialTitle, string message);
    event DeniedCredential(uint credentialId, uint userId, string credentialTitle, string message);
    event NewFile(uint fileId, string fileName, string friendlyName, string userName);
 
    // Structs
    struct Credential {
        uint key;
        string title;
        uint epochTime;
        string payload;
        string credentialCode;
        string status;
    }
     
    struct File {
        string key;
        string name;
        string friendlyName;
        string fileExtension;
        string storageFileName;
    }
     
     // Arrays
    Credential[] private credentials;
    File[] private files;    
    
    // Mappings
    mapping(uint => uint) public credentialMapping;
    mapping(uint => string) public credentialMessages;
    mapping(uint => uint) public credentialFileCount;
 
    // Public functions
    function AddCredential(string _subscriberPk, string _title,uint _epochTime, string _payload, string _credentialCode) public returns (bool) {
        uint orgId = orgMapping[msg.sender];
        uint id = 0;
        if (orgId > 0) {
            uint  key = _getCredentialKey(orgId,_subscriberPk);
            id = credentials.push(Credential(key, _title,_epochTime,_payload,_credentialCode,"pending"))-1;
        }
        return (id>0);
    }
    
    function AddFile(string _subscriberPk, string _fileName,string _fileFrindlyName, string _fileExtension) public returns (bool) {
        // TO DO:  Receive the incoming bytes and actually save the file to the masternode
        uint orgId = orgMapping[msg.sender];
        uint id = 0;
        if (orgId > 0) {
            uint key = _getCredentialKey(orgId,_subscriberPk);
            credentialFileCount[key]++;
            string memory storageFileName = strConcat(uint2str(key),"-",uint2str(credentialFileCount[key]),_fileExtension,"");
            id = files.push(File(uint2str(key), _fileName,_fileFrindlyName,_fileExtension,storageFileName))-1;
        }
        return (id>0);
    }     
 
    function Approve(string _subscriberPk, string _message) public returns (bool) {
        uint orgId = orgMapping[msg.sender];
        if (orgId > 0) {
            uint key = _getCredentialKey(orgId,_subscriberPk);
            // ugh.  Loop through the array to find the credential and update the status/message
        }
        return (true);
    }   

    function Deny(string _subscriberPk, string _message) public returns (bool) {
        uint orgId = orgMapping[msg.sender];
        uint id = 0;
        if (orgId > 0) {
            uint key = _getCredentialKey(orgId,_subscriberPk);
            // ugh.  Loop through the array to find the credential and update the status/message
        }
        return (true);
    }  
 
    // Private Functions
    function _getCredentialKey(uint _orgId, string _subscriberPk) private pure returns (uint) {
        string memory key =  strConcat(uint2str(_orgId),"-", _subscriberPk,"","");
        return uint(keccak256(key));
    } 
    
}

