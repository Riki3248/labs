// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;

// import "../../new-project/src/MyToken.sol";

// contract amm {
//     MyToken tokenX;
//     MyToken tokenY;
//     uint256 balanceX;
//     uint256 balanceY;
//     uint256 amountX;
//     uint256 amountY;
//     uint256 total;
//     // uint256 a;
//     // uint256 b;
//     mapping(address => uint256) public liquidity;

//     address owner;

//     constructor(address _tokenX, address _tokenY) {
//         tokenX = new MyToken(_tokenX);
//         tokenY = new MyToken(_tokenY);
//         tokenX.transfer(address(this), 10);
//         tokenY.transfer(address(this), 10);
//         balanceY = tokenY.balanceOf();
//         balanceX = tokenX.balanceOf();
//         total = balanceX * balanceY;

//         //    amountX=balanceX;
//         //    amountY=balanceY;
//         owner = msg.sender;
//     }

//     function traidX(uint256 amount) public returns (uint256) {
//         require(amount > 0, "amount =0");
//         tokenY.transferFrom(msg.sender, address(this), amount);
//         balanceY += amount;
//         uint256 calc = calcX(balanceY, balanceX);
//         tokenX.transfer(msg.sender, calc);
//         balanceX -= calc;
//     }

//     function traidY(uint256 amount) public returns (uint256) {
//         require(amount > 0, "amount =0");
//         tokenX.transferFrom(msg.sender, address(this), amount);
//         balanceX += amount;
//         uint256 calc = calcY(balanceY, balanceX);
//         tokenY.transfer(msg.sender, calc);
//         balanceY -= calc;
//     }

//     function calcX(uint256 _balanceY, uint256 _balanceX) public returns (uint256) {
//         uint256 buy = balanceX - (total / balanceY);
//         return buy;
//     }

//     function calcY(uint256 _balanceY, uint256 _balanceX) public returns (uint256) {
//         uint256 buy = balanceY - (total / balanceX);
//         return buy;
//     }

//     function add(uint256 x, uint256 y) public {}
// }
