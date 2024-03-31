// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Wallet {
    mapping(address => uint256) public collectors;
    address payable public owner;
    uint256 public counter = 0;

    constructor() {
        owner = payable(msg.sender);
        collectors[0x434d091Ef55054e5fe7e43008A7120f92D471415] = 1;
        collectors[0x168e5f2f4D0aBA5f4B4434b9Be4beAF43dc9c5d5] = 1;
    }

    receive() external payable {}

    modifier isOwner() {
        require(msg.sender == owner, "you are not owner");
        _;
    }

    function addGabay(address collector) public isOwner {
        require(counter < 3, "There are enough collectors");
        collectors[collector] = 1;
        counter++;
    }

    function changeOwner(address oldCollector, address newCollector) public isOwner {
        require(collectors[oldCollector] == 1, "you aren't a collector");
        require(collectors[newCollector] == 0, "You are already a tax collector");
        collectors[oldCollector] = 0;
        collectors[newCollector] = 1;
    }

    function whithdraw(uint256 amount) external {
        require(msg.sender == owner || collectors[msg.sender] == 1);
        require((msg.sender).balance >= amount, "the amount of mony in the wallet is too low");
        payable(msg.sender).transfer(amount);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
