pragma solidity ^0.8.15;
 
import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "@hack/store/store.sol";
import "../../../src/wallet/CollectorsWallet.sol";


contract TestWallet is Test{

Wallet public CollectorWallet;
address public myUser = vm.addr(1234);


function setUp() public{
   CollectorWallet=new Wallet(); 

   // address Collector=
   CollectorWallet.addGabay(0x074AC318E0f004146dbf4D3CA59d00b96a100100);
   payable(address(CollectorWallet)).transfer(50);//move  50 to the contract

}

function testReceive() public{
uint256 startBalance=address(CollectorWallet).balance;//How much money is in the current account
payable(address(CollectorWallet)).transfer(100);//Depositing money into the account
uint256 finalBalance=address(CollectorWallet).balance;//How much money is in the current account
assertEq(finalBalance,startBalance+100);
}


function testAddGabayIsAllowd() public{
   address isOwner=0x2691200b3624C82757F28B52E4573bB61f6CCFf4;
   vm.startPrank(isOwner);
   assertLe(CollectorWallet.counter(),3);
   vm.stopPrank();
}
function testAddGabayIsntAllowd() public{
   address isOwner=vm.addr(1234);
   vm.startPrank(isOwner);
  // vm.expectRevert("you are not owner");
   vm.stopPrank();
}
function testAddGabay() public{
   CollectorWallet.addGabay(0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71);
   assertLe(CollectorWallet.counter(),2);
}
function testChangeOwner() public{
   address oldGabay = 0x074AC318E0f004146dbf4D3CA59d00b96a100100;
   address newGabai = 0x81Ee0c1564B711bDf324295a1f1e02E1920876aD;//update new address
   CollectorWallet.changeOwner(oldGabay,newGabai);
}

function testWhithdrawIsAllowd() public{
  uint256 amount=50;
  uint256 prevbalanc=address(CollectorWallet).balance;
  uint256 expectedbalanc=address(CollectorWallet).balance+amount;
  vm.startPrank(myUser);
  CollectorWallet.whithdraw(amount);
  console.log("hello");
  assertEq(prevbalanc,expectedbalanc);
  vm.stopPrank();
   
}

function testWhithdrawIsntAllowd() public{

}
}