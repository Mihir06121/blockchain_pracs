// SPDX-License-Identifier: GPL 3.0
pragma solidity >0.4.0 <= 0.9.0;

contract VisibilityExample {
    uint256 public publicNumber;
    uint256 internal internalNumber;
    uint256 private privateNumber;
    
    constructor(uint256 _initialValue) {
        publicNumber = _initialValue;
        internalNumber = _initialValue;
        privateNumber = _initialValue;
    }
    
    function setPublicNumber(uint256 _newValue) public {
        publicNumber = _newValue;
    }
    
    function setInternalNumber(uint256 _newValue) internal {
        internalNumber = _newValue;
    }
    
    function setPrivateNumber(uint256 _newValue) private {
        privateNumber = _newValue;
    }
    
    function getInternalNumber() external view returns (uint256) {
        return internalNumber;
    }
    
    function getPrivateNumber() external view returns (uint256) {
        return privateNumber;
    }
}
