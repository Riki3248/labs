// pragma solidity ^0.8.20;
// //  import "foundry-huff/HuffDeployer.sol";

// import "forge-std/Test.sol";
// import "@hack/store/store.sol";
// import "../../../src/vars/vars.sol";
// import "../../new-project/src/MyToken.sol";

// contract CpTest is Test {
//     uint256 WAD = 10 ** 18;
//     CP public myCp;
//     MyToken tokenA;
//     MyToken tokenB;

//     function setUp() public {
//         myCp = new CP(address(tokenA), address(tokenB));
//         tokenA = new MyToken();
//         tokenB = new MyToken();
//         tokenA.mint(address(this), 50000);
//         tokenB.mint(address(this), 50000);
//     }

//     function TestAddLiquidity() public {
//         vm.starPrank(address(12));
//         tokenA.approve(address(myCp), 5);
//         tokenB.approve(address(myCp), 10);
//         uint256 sharese = myCp.addLiquidity(5, 10);
//         console.log(sharese);
//         vm.starPrank();
//     }
// }
