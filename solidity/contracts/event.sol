// SPDX-License-Identifier: GPL 3.0
pragma solidity >0.4.0 <= 0.9.0;

contract EventExample {
    event LogEvent(address indexed sender, uint256 value);
 
    function triggerEvent(uint256 _value) public {
        emit LogEvent(msg.sender, _value);
    }
}
