// SPDX-License-Identifier: GPL 3.0
pragma solidity >0.4.0 <= 0.9.0;

contract ChatContract {
    struct Message {
        address sender;
        address receiver;
        string ipfsHash; // IPFS hash of the actual message content
    }
 
    mapping(address => mapping(address => Message[])) private messages;
 
    event MessageSent(address indexed sender, address indexed receiver, string ipfsHash);
 
    function sendMessage(address _receiver, string memory _ipfsHash) public {
        Message memory newMessage = Message(msg.sender, _receiver, _ipfsHash);
        messages[msg.sender][_receiver].push(newMessage);
        messages[_receiver][msg.sender].push(newMessage);
        emit MessageSent(msg.sender, _receiver, _ipfsHash);
    }
 
    function getMessages(address _receiver) public view returns (Message[] memory) {
        return messages[msg.sender][_receiver];
    }
}
