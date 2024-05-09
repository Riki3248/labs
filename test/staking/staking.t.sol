 pragma solidity ^0.8.20;
// //  import "foundry-huff/HuffDeployer.sol";
// import "forge-std/Test.sol";
// import "@hack/store/store.sol";
// import "../../../src/staking/staking.sol";
// import "../../new-project/src/MyToken.sol";

// contract TestStaking is Test {
//     uint WAD = 10 ** 18;
//     Staking public stake;
//     MyToken token;
//     address public myUser = vm.addr(1234);

//     function setUp() public {
//         token = new MyToken();
//         stake = new Staking(address(token));
//     }

//     function TestDeposit() public {
//         uint sum = 100 * WAD;
//         token.mint(address(this), 1000);
//         uint256 balanceBefore = stake.getBalance();
//         token.approve(address(stake), sum);
//         stake.deposit(sum);
//         uint256 balanceAffterDeposit = stake.getBalance();
//         // assertEq(
//         //     balanceBefore,
//         //     balanceAfterDeposit,
//         //     "Contract balance not updated correctly"
//         // );
//     }

//     function TestWithdraw() public {
//         console.log("testWithdraw");
//         uint256 sum = 100 * WAD;
//         token.mint(address(this), sum);
//         token.approve(address(stake), sum);
//         stake.deposit(sum);
//         vm.warp(block.timestamp + 7 days);
//         uint256 balanceBefore = stake.getBalance();
//         stake.withdraw(sum);
//         uint256 finalUserBalance = stake.getBalance(); //100
//         console.log("finamsglUserBalance", finalUserBalance);
//         assertEq(balanceBefore, finalUserBalance, "error");
//     }

//     function TestIsNtWithdraw() public{
//         uint256 sum = 200 * WAD;
//         token.mint(address(this), sum);
//         token.approve(address(stake), sum);
//         stake.deposit(sum);
//         uint256 balanceBefore = stake.getBalance();
//         vm.expectRevert(); //Not a week has passed
//         stake.withdraw(sum);
//     }

//     function TestcalcReward() public{
//         uint total = stake.totalSupply;
//         uint calc = stake.calc();
//         assertEq(((calc * 100) / total)/1e18,stake.calcReward(),'error');

//     }
// }
