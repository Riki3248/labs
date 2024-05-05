// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract amm {
uint256 updateX=100;
uint256 updateY=100;
uint256 amountX;
uint256 amountY;
uint256 total;
// uint256 a;
// uint256 b;
address owner;


    constructor() {
       total=updateX* updateY;
       owner=msg.sender;
    }
    function changeX(uint256 amount) public returns(uint256){
        amountY=updateY+amount;
        amountX=updateX-(updateX/amountY);
        uint256 change=updateX-amountX;
        return change;

    }
     function changeY(uint256 amount) public returns(uint256){
        amountX=updateX+amount;
        amountY=updateY-(updateY/amountX);
        uint256 change=updateY-amountY;
        return change;

    }
}