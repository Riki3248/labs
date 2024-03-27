// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Wallet {
    bool state;
    mapping(address => uint256) public owners;
    address payable public owner;
    uint256 public counter = 0;

    constructor() {
         owner =payable(msg.sender);
    }

    receive() external payable {}

    function addGabay(address gabay) public isOwner {
        require(counter < 3, "");
        owners[gabay] = 1;
        counter++;
    }

    function changeOwner(address oldGabay, address newGabai) public isOwner {
        owners[oldGabay] = 0;
        owners[newGabai] = 1;
    }

    modifier isOwner() {
        require(msg.sender == owner, "you are not owner");
        _;
    }

    function whithdraw(uint256 num) external {
        require(msg.sender == owner || owners[msg.sender] == 1);
        payable(msg.sender).transfer(num);
    }

    function getbalance() external view returns (uint256) {
        return address(this).balance;
    }
}
