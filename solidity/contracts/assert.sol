// SPDX-License-Identifier: GPL 3.0
pragma solidity >0.4.0 <= 0.9.0;

contract ExceptionExample {
    function assertExample(uint256 age) public pure returns (uint256) {
        assert(age <= 12); // Assertion check
        return age;
    }
}