// SPDX-License-Identifier: private
pragma solidity ^0.8.20;

// import "@hack/like/IERC20.sol";
// import "@hack/erc20/erc20.sol";

contract Change {

    IERC20 public usdc;
    IERC20 public usdt;

    /// if you want to fork from the mainnet and check data from there,
    /// just change the new instance to the usdc and usdt addresses:
    // usdc = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    // usdt = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    constructor() {
        usdc = new ERC20("myUSDC");
        usdt = new ERC20("myUSDT");
        // gnosis
        // usdc = IERC20(0xDDAfbb505ad214D7b80b1f830fcCc89B60fb7A83);
        // usdt = IERC20(0x4ECaBa5870353805a9F068101A40E0f32ed605C6);
    }

    function getSymbols() view external returns (string memory, string memory) {
        return (usdc.symbol(),
                usdt.symbol());
    }

    function getUSDCBalance(address from) view external returns (uint256) {
        return usdc.balanceOf(from);
    }

    function change(uint256 amount) public{
        usdc.transferFrom(address(this), msg.sender, amount);
        usdt.transferFrom(msg.sender, address(this), amount);
    }
}