
 pragma solidity ^0.8.15;
 import "foundry-huff/HuffDeployer.sol";
 import "forge-std/Test.sol";
 import "@hack/store/store.sol";
 import "../../../src/staking/staking.sol";
 import "../../../MyToken/new-project/src/MyToken.sol";
 contract TestStaking is Test{
   staking public s;
   address public myUser = vm.addr(1234);
     function setUp() public {
         token=new MyToken(); 
         s = new staking();
      
     }
 function TestDeposit()  returns {
  
    }
 }