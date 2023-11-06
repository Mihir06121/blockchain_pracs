// SPDX-License-Identifier: GPL 3.0
pragma solidity >0.4.0 <= 0.9.0;

contract SimpleToken {
    // State variables
    string public name;
    string public symbol;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;
 
    // Events
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
 
    // Constructor
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }
 
    // Function to transfer tokens
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_value <= balances[msg.sender], "Insufficient balance");
        require(_to != address(0), "Invalid recipient address");
 
        balances[msg.sender] -= _value;
        balances[_to] += _value;
 
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
