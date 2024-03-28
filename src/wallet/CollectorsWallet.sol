// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Wallet {
    mapping(address => uint256) public owners;
    address payable public owner;
    uint256 public counter = 0;

    constructor() {
         owner =payable(msg.sender);
    }

    receive() external payable {}

    function addGabay(address gabay) public isOwner {
        require(counter < 3, "There are enough collectors");
        owners[gabay] = 1;
        counter++;
    }

    function changeOwner(address oldGabay, address newGabai) public isOwner {
        require(owners[oldGabay]==1,"you aren't a collector");
        require(owners[newGabai]==0,"You are already a tax collector");
        owners[oldGabay] = 0;
        owners[newGabai] = 1;
    }

    modifier isOwner() {
        require(msg.sender == owner, "you are not owner");
        _;
    }

    function whithdraw(uint256 amount) external {
        require(msg.sender == owner || owners[msg.sender] == 1);
        require((msg.sender).balance>=amount,"the amount of mony in the wallet is too low");
        payable(msg.sender).transfer(amount);
    }

    function getbalance() external view returns (uint256) {
        return address(this).balance;
    }
}
