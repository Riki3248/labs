// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.13;

import "../../new-project/lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../../new-project/lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, ERC20Permit {
    constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken") {
        
    }
     function mint (address add, uint amount) external {
        _mint(add,amount);
    }
        function burn(address account, uint256 value) external {
          _burn(account,value);
        }


}