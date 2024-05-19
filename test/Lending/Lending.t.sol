// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.20;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@hack/store/store.sol";
import "../../../../new-project/src/MyToken.sol";
import "../../src/Lending/Lending.sol";

contract TestLending is Test {
    MyToken public bonds;
    MyToken public Dai;
    Lending lending;

    function setUp() public {
        bonds = new MyToken();
        Dai = new MyToken();
        lending = new Lending(address(bonds),address(Dai));
    }

    function testBorrow() public {
        lending.getLatestPrice();
    }
}
