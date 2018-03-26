pragma solidity ^0.4.19;

// TO DO: This big ugly thing will be broken apart once I figure out how to do it

contract Microcredential {

    // Events
    event NewSubscriber(uint userId, string userKey, string userName, string userSponsor);
    event NewCredential(uint userId, uint credentialId, string credentialTitle);
    event ApprovedCredential(uint credentialId, uint userId, string credentialTitle);
    event DeniedCredential(uint credentialId, uint userId, string credentialTitle);
    event NewFile(uint fileId, string fileName, string friendlyName, string userName);
    
    // State Variables
    string OwnerName;

    // Structs
    struct Subscriber {
        uint id;
        address wallet;
        string name;
    }
    
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
    
    // Arrays and Mappings
    Subscriber[] private subscribers;
    Credential[] private credentials;
    File[] private files;

    mapping(address => uint) public subscriberMapping;
    mapping(uint => uint) public credentialMapping;
    mapping(uint => string) public credentialMessages;
    mapping(uint => uint) public credentialFileCount;
    
    // Private functions
    function _uint2str(uint i) internal pure returns (string){
        if (i == 0) return "0";
        uint j = i;
        uint length;
        while (j != 0){
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint k = length - 1;
        while (i != 0){
            bstr[k--] = byte(48 + i % 10);
            i /= 10;
        }
        return string(bstr);
    }

    function _strConcat(string _a, string _b, string _c, string _d, string _e) internal pure returns (string){
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
        for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
        for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
        for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
        return string(babcde);
    }
    
    function _getCredentialKey(uint _subscriberId, string _subscriberPk) private pure returns (uint) {
        string memory key =  _strConcat(_uint2str(_subscriberId),"-", _subscriberPk,"","");
        return uint(keccak256(key));
    }
    
    // Public functions
    function AddSubscriber(string _name) public returns (string) {
        require(subscriberMapping[msg.sender]==0);
        uint id = subscribers.push(Subscriber(subscribers.length + 1,msg.sender, _name))-1;
        subscriberMapping[msg.sender] = id;
        return "success";
    }

    function AddCredential(string _subscriberPk, string _title,uint _epochTime, string _payload, string _credentialCode) public returns (bool) {
        uint subscriberId = subscriberMapping[msg.sender];
        uint id = 0;
        if (subscriberId > 0) {
            uint  key = _getCredentialKey(subscriberId,_subscriberPk);
            id = credentials.push(Credential(key, _title,_epochTime,_payload,_credentialCode,"pending"))-1;
        }
        return (id>0);
    }
    
    function AddFile(string _subscriberPk, string _fileName,string _fileFrindlyName, string _fileExtension) public returns (bool) {
        // TO DO:  Receive the incoming bytes and actually save the file to the masternode
        uint subscriberId = subscriberMapping[msg.sender];
        uint id = 0;
        if (subscriberId > 0) {
            uint key = _getCredentialKey(subscriberId,_subscriberPk);
            credentialFileCount[key]++;
            string memory storageFileName = _strConcat(_uint2str(key),"-",_uint2str(credentialFileCount[key]),_fileExtension,"");
            id = files.push(File(_uint2str(key), _fileName,_fileFrindlyName,_fileExtension,storageFileName))-1;
        }
        return (id>0);
    }    
    
}
