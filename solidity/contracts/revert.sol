// SPDX-License-Identifier: GPL 3.0
pragma solidity >0.4.0 <= 0.9.0;

contract ExceptionExample {
    function divide(uint256 _numerator, uint256 _denominator) public pure returns (uint256) {
        if (_denominator == 0) {
            revert("Division by zero is not allowed");
        }
        return _numerator / _denominator;
        }
}