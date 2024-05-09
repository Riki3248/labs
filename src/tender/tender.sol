// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../../new-project/src/MyTokenNft.sol";

contract Tender {
    MyTokenNft nft;
    mapping(address  => uint256) users;
    mapping(uint256 => address) indexes;
    uint256 counter;
    uint256 duration = 7 days;
    address public maxValue;
    address payable public owner;

    constructor(address Nft) {
        address owner = msg.sender;
        counter = 1;
        nft = MyTokenNft(Nft);
        users[owner] = 100;
        maxValue = owner;
    }

    function addNft(uint256 amount) private {
        require(amount > 0, "amount is zero");
        require(amount > users[maxValue], "The value is less than the initial value");
        maxValue = msg.sender;
        nft.transferFrom(msg.sender, address(this), amount);
        users[msg.sender] = amount;
        counter += 1;
        indexes[counter] = msg.sender;
    }

    function AddOffer(uint256 amount) external {
        if (block.timestamp >= duration) {
            endTender();
        } else {
            addNft(amount);
        }
    }

    modifier isOwner() {
        require(msg.sender == owner, " isnt owner");
        _;
    }

    function removOffer(address user) external isOwner {
        require(users[user] == users[maxValue], "You cannot withdraw the money since you have the higher value");
        users[user] = 0;
    }

    function endTender() private {
        while (counter > 0) {
            address offer = indexes[counter];
           nft.transferFrom(address(this),offer, users[offer]);
            counter = counter - 1;
        }
    }
}
