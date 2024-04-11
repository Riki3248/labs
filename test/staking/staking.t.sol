
 pragma solidity ^0.8.20;
//  import "foundry-huff/HuffDeployer.sol";
 import "forge-std/Test.sol";
 import "@hack/store/store.sol";
 import "../../../src/staking/staking.sol";
 import "../../../MyToken/new-project/src/MyToken.sol";
 contract TestStaking is Test{
   StakingRewards public s;
   MyToken token;
   address public myUser = vm.addr(1234);
     function setUp() public {
        token= new MyToken(); 
        s = new StakingRewards(address(token));
      
     }

  function  TestDepositIsntUser()  public {
    vm.startPrank(myUser);
    // vm.deal(myUser,10000);
   token.mint(myUser,1000);
   vm.stopPrank();

   console.log("11111111111111111111111111",token.balanceOf(myUser));
    }
 }