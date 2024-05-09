// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.13;

import "../../new-project/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
// 
contract MyTokenNft is ERC721  {
    constructor() ERC721("MyTokenNft", "MTK")  {
        
    }
     function mint (address add, uint amount) external {
        _mint(add,amount);
    }
}