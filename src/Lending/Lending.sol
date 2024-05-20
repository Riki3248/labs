// SPDX-License-Identifier: MIT
pragma solidity >=0.5.11;

import "../../new-project/src/MyToken.sol";
import "../..//new-project/lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Lending {
    address owner;
    mapping(address => uint256) deposites;
    MyToken bonds;
    MyToken Dai;

    constructor(address bondsToken, address DaiToken) public {
        owner = msg.sender;
        bonds = new MyToken();
        Dai = new MyToken();
    }

    function deposit(uint256 countDai) public {
        deposites[msg.sender] = countDai;
        bonds.mint(msg.sender, countDai);
    }

    function reciveDai(uint256 countBonds) public {
        require(bonds.balanceOf(msg.sender) >= countBonds, "Not enough bonds");
        bonds.burn(msg.sender, countBonds);
        Dai.transfer(msg.sender, countBonds);
    }

    function getLatestPrice() public view returns (int256) {
        priceFeed = AggregatorV3Interface(0xF79D6aFBb6dA890132F9D7c355e3015f15F3406F);
        (, int256 price,,,) = priceFeed.latestRoundData();
        return price;
    }

    function borrow(uint256 amount) public {
        getLatestPrice();
    }

}
