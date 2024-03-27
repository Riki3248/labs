pragma solidity ^0.8.15;
 
import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "@hack/store/store.sol";
import "../../../src/wallet/CollectorsWallet.sol";


contract TestWallet is Test{

Wallet public CollectorWallet;

function setUp() public{
   CollectorWallet=new Wallet(); 
   payable(address(CollectorWallet)).transfer(50);//move  50 to the contract
}

function testReceive() public{
uint256 startBalance=address(CollectorWallet).balance;//How much money is in the current account
payable(address(CollectorWallet)).transfer(100);//Depositing money into the account
uint256 finalBalance=address(CollectorWallet).balance;//How much money is in the current account
assertEq(finalBalance,startBalance+100);
}

function tastModifier() public{
   console.log("wertyuiodsffgfdggggggggggg");
   // address isOwner=0x2691200b3624C82757F28B52E4573bB61f6CCFf4;
   // vm.startPrank(isOwner);
   // assertEq(isOwner,CollectorWallet.owner(),"sddsfsfs");
   // vm.stopPrank();

}
function testAddGabayIsAllowd() public{
   address isOwner=0x2691200b3624C82757F28B52E4573bB61f6CCFf4;
   vm.startPrank(isOwner);
// assertLe
   assert(CollectorWallet.counter()<=3);
   vm.stopPrank();
}
function testAddGabayIsntAllowd() public{
   address isOwner=vm.addr(1234);
   vm.startPrank(isOwner);
   vm.expectRevert();
  
   vm.stopPrank();
}
// function testChangeOwner() public{
//    address isOwner=0x2691200b3624C82757F28B52E4573bB61f6CCFf4;

// }
}