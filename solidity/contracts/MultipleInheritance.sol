// SPDX-License-Identifier: GPL 3.0
pragma solidity >0.4.0 <= 0.9.0;

contract Animal {
    function makeSound() public pure virtual returns (string memory) {
        return "Some sound";
    }
}

contract Mammal {
    function giveBirth() public pure virtual returns (string memory) {
        return "Giving birth to live young ones";
    }}

contract Dog is Animal, Mammal {
    function makeSound() public pure override returns (string memory) {
        return "Woof!";
    }
}