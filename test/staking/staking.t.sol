pragma solidity ^0.8.20;
//  import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "@hack/store/store.sol";
import "../../../src/staking/staking.sol";
import "../../../MyToken/new-project/src/MyToken.sol";

contract TestStaking is Test {
    uint WAD = 10 ** 18;
    StakingRewards public stack;
    MyToken token;
    address public myUser = vm.addr(1234);

    function setUp() public {
        token = new MyToken();
        stack = new StakingRewards(address(token));
    }


    function TestDeposit() public {
        uint sum = 100 * WAD;
        token.mint(address(this), 1000);
        uint256 balanceBefore = stack.amount();
        uint256 initialTtoalBalance = stack.getBalance();
        token.approve(address(stake), sum);
        stack.deposit(sum);
        uint256 finalTtoalBalance = stack.amount();
        uint256 finalUserBalance = stack.getBalance();
        assertEq(
            finalTtoalBalance,
            initialTtoalBalance + sum,
            "Contract balance not updated correctly"
        );
        assertEq(
            finalUserBalance,
            balanceBefore + sum,
            "Contract balance not updated correctly"
        );
    }
    function TestWithdraw()   {
      console.log("testWithdraw");
        uint256 sum = 100 * wad;
        token.mint(address(this), sum);
        token.approve(address(stake),sum);
        stake.deposit(sum);
        vm.warp(block.timestamp + 7 days );
        uint256 balanceBefore = stake.amount(); //200
        stake.withdraw(sum);
        uint256 finalUserBalance = stake.amount(); //100
        console.log("finamsglUserBalance", finalUserBalance);
        assertEq(finalUserBalance, balanceBefore - sum, "d");
    }
     function TestIsNtWithdraw()   {
        uint256 sum = 200 * wad;
        token.mint(address(this), sum);
        token.approve(address(stake),sum);
        stake.deposit(sum);
        uint256 balanceBefore = stake.amount();
        vm.expectRevert(); //Not a week has passed
        stake.withdraw(sum);
    }
}
