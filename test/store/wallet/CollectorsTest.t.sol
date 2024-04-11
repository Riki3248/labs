// pragma solidity ^0.8.15;

// import "foundry-huff/HuffDeployer.sol";
// import "forge-std/Test.sol";
// import "@hack/store/store.sol";
// import "../../../src/wallet/CollectorsWallet.sol";

// contract TestWallet is Test {
//     Wallet public w;
//     address public myUser = vm.addr(1234);

//     function setUp() pubpragma solidity ^0.8.15;

// import "foundry-huff/HuffDeployer.sol";
// import "forge-std/Test.sol";
// import "@hack/store/store.sol";
// import "../../../src/wallet/CollectorsWallet.sol";

// contract TestWallet is Test {
//     Wallet public w;
//     address public myUser = vm.addr(1234);

//     function setUp() public {
//         console.log("oooooooooooooooooooo");
//         vm.startPrank(myUser);
//         w = new Wallet();
//         vm.stopPrank();
//     }

//     function testReceive() public {
//         uint256 startBalance = address(w).balance; //How much money is in the current account
//         console.log(startBalance);
//         payable(address(w)).transfer(100); //Depositing money into the account
//         uint256 finalBalance = address(w).balance; //How much money is in the current account
//         assertEq(finalBalance, startBalance + 100);
//     }

//     function testAddGabayIsAllowd() public {
//         uint256 nowcounter = w.counter();
//         vm.startPrank(myUser);
//         w.addGabay(0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71);
//         assertEq(w.counter(), nowcounter + 1);
//         vm.stopPrank();
//     }

//     function testAddGabayIsntAllowd() public {
//         uint256 nowcounter = w.counter();
//         address IsntAllowd=vm.addr(8);
//         vm.startPrank(IsntAllowd);
//         vm.expectRevert("you are not owner");
//         w.addGabay(0x074AC318E0f004146dbf4D3CA59d00b96a100100);
//         assertEq(w.counter(), nowcounter);
//         vm.stopPrank();
//     }

//     function testAddGabayAlreadyExists() public {
//         vm.startPrank(myUser);
//         vm.expectRevert("this is already a gabay");
//         w.addGabay(0x434d091Ef55054e5fe7e43008A7120f92D471415);
//         vm.stopPrank();
//     }

//     function testAddGabayMoreThanThree() public {
//         uint256 nowcounter = w.counter();
//         vm.startPrank(myUser);
//         w.addGabay(0x074AC318E0f004146dbf4D3CA59d00b96a100100);
//         vm.expectRevert("too many Gabaim");
//         w.addGabay(0x7ae3DbAC75D264B6F6976639ebBfC645601D3F15);
//         assert(nowcounter > 3);
//         vm.stopPrank();
//     }

//     function testChangeOwner() public {
//         address newCollector = vm.addr(10);
//         address oldCollector = 0x434d091Ef55054e5fe7e43008A7120f92D471415;
//         w.changeOwner(oldCollector, newCollector);
//         assertEq(w.collectors(oldCollector), 0);
//         assertEq(w.collectors(newCollector), 1);
//     }

//     function testChangeOwnerIsAllowd() public {
//         address oldCollector = vm.addr(15);
//         address newCollector = 0x074AC318E0f004146dbf4D3CA59d00b96a100100;
//         vm.expectRevert("you are not owner");
//         w.changeOwner(oldCollector, newCollector);
//         assertEq(w.collectors(oldCollector), 0);
//     }

//     function testChangeOwnerIsntAllowd() public {
//         address oldCollector = 0x434d091Ef55054e5fe7e43008A7120f92D471415;
//         address newCollector = 0x168e5f2f4D0aBA5f4B4434b9Be4beAF43dc9c5d5;
//         vm.expectRevert("you are a collector");
//         w.changeOwner(oldCollector, newCollector);
//         assertEq(w.collectors(newCollector), 1);
//     }

//     function testWhithdrawIsAllowd() public {
//        payable(address(w)).transfer(100); //Depositing money into the account
//         uint256 amount = 50;
//         uint256 prevbalanc = address(w).balance;
//         uint256 expectedbalanc = address(w).balance + amount;
//         vm.startPrank(myUser);
//         w.whithdraw(amount);
//         console.log("hello");
//         assertEq(prevbalanc, expectedbalanc);
//         vm.stopPrank();
//     }
//     // function testWhithdrawisntenoughmoney() public{
//     //   uint256 amount=150;
//     //   uint256 prevbalanc=address(CollectorWallet).balance;
//     //   uint256 expectedbalanc=address(CollectorWallet).balance+amount;
//     //   vm.startPrank(myUser);
//     //   CollectorWallet.whithdraw(amount);
//     //   assertEq(prevbalanc,expectedbalanc,"you do not have enough money");
//     //   vm.stopPrank();

//     // }
//     // function testWhithdrawIsntAllowd() public{
//     //   uint256 amount=10;
//     //   uint256 prevbalanc=address(CollectorWallet).balance;
//     //   uint256 expectedbalanc=address(CollectorWallet).balance+amount;
//     //   vm.expectRevert("You do not have permissions");
//     //   vm.startPrank(0x81Ee0c1564B711bDf324295a1f1e02E1920876aD);
//     //   CollectorWallet.whithdraw(amount);
//     //   assertEq(prevbalanc,expectedbalanc);
//     //   vm.stopPrank();

//     // }

//     function testGetBalance() public {
//         uint256 nowBalance = address(w).balance;
//         uint256 getbalance = w.getBalance();
//         assertEq(nowBalance, getbalance, "Erore");
//     }
// }

//         console.log("oooooooooooooooooooo");
//         vm.startPrank(myUser);
//         w = new Wallet();
//         vm.stopPrank();
//     }

//     function testReceive() public {
//         uint256 startBalance = address(w).balance; //How much money is in the current account
//         console.log(startBalance);
//         payable(address(w)).transfer(100); //Depositing money into the account
//         uint256 finalBalance = address(w).balance; //How much money is in the current account
//         assertEq(finalBalance, startBalance + 100);
//     }pragma solidity ^0.8.15;

// import "foundry-huff/HuffDeployer.sol";
// import "forge-std/Test.sol";
// import "@hack/store/store.sol";
// import "../../../src/wallet/CollectorsWallet.sol";

// contract TestWallet is Test {
//     Wallet public w;
//     address public myUser = vm.addr(1234);

//     function setUp() public {
//         console.log("oooooooooooooooooooo");
//         vm.startPrank(myUser);
//         w = new Wallet();
//         vm.stopPrank();
//     }

//     function testReceive() public {
//         uint256 startBalance = address(w).balance; //How much money is in the current account
//         console.log(startBalance);
//         payable(address(w)).transfer(100); //Depositing money into the account
//         uint256 finalBalance = address(w).balance; //How much money is in the current account
//         assertEq(finalBalance, startBalance + 100);
//     }

//     function testAddGabayIsAllowd() public {
//         uint256 nowcounter = w.counter();
//         vm.startPrank(myUser);
//         w.addGabay(0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71);
//         assertEq(w.counter(), nowcounter + 1);
//         vm.stopPrank();
//     }

//     function testAddGabayIsntAllowd() public {
//         uint256 nowcounter = w.counter();
//         address IsntAllowd=vm.addr(8);
//         vm.startPrank(IsntAllowd);
//         vm.expectRevert("you are not owner");
//         w.addGabay(0x074AC318E0f004146dbf4D3CA59d00b96a100100);
//         assertEq(w.counter(), nowcounter);
//         vm.stopPrank();
//     }

//     function testAddGabayAlreadyExists() public {
//         vm.startPrank(myUser);
//         vm.expectRevert("this is already a gabay");
//         w.addGabay(0x434d091Ef55054e5fe7e43008A7120f92D471415);
//         vm.stopPrank();
//     }

//     function testAddGabayMoreThanThree() public {
//         uint256 nowcounter = w.counter();
//         vm.startPrank(myUser);
//         w.addGabay(0x074AC318E0f004146dbf4D3CA59d00b96a100100);
//         vm.expectRevert("too many Gabaim");
//         w.addGabay(0x7ae3DbAC75D264B6F6976639ebBfC645601D3F15);
//         assert(nowcounter > 3);
//         vm.stopPrank();
//     }

//     function testChangeOwner() public {
//         address newCollector = vm.addr(10);
//         address oldCollector = 0x434d091Ef55054e5fe7e43008A7120f92D471415;
//         w.changeOwner(oldCollector, newCollector);
//         assertEq(w.collectors(oldCollector), 0);
//         assertEq(w.collectors(newCollector), 1);
//     }

//     function testChangeOwnerIsAllowd() public {
//         address oldCollector = vm.addr(15);
//         address newCollector = 0x074AC318E0f004146dbf4D3CA59d00b96a100100;
//         vm.expectRevert("you are not owner");
//         w.changeOwner(oldCollector, newCollector);
//         assertEq(w.collectors(oldCollector), 0);
//     }

//     function testChangeOwnerIsntAllowd() public {
//         address oldCollector = 0x434d091Ef55054e5fe7e43008A7120f92D471415;
//         address newCollector = 0x168e5f2f4D0aBA5f4B4434b9Be4beAF43dc9c5d5;
//         vm.expectRevert("you are a collector");
//         w.changeOwner(oldCollector, newCollector);
//         assertEq(w.collectors(newCollector), 1);
//     }

//     function testWhithdrawIsAllowd() public {
//        payable(address(w)).transfer(100); //Depositing money into the account
//         uint256 amount = 50;
//         uint256 prevbalanc = address(w).balance;
//         uint256 expectedbalanc = address(w).balance + amount;
//         vm.startPrank(myUser);
//         w.whithdraw(amount);
//         console.log("hello");
//         assertEq(prevbalanc, expectedbalanc);
//         vm.stopPrank();
//     }
//     // function testWhithdrawisntenoughmoney() public{
//     //   uint256 amount=150;
//     //   uint256 prevbalanc=address(CollectorWallet).balance;
//     //   uint256 expectedbalanc=address(CollectorWallet).balance+amount;
//     //   vm.startPrank(myUser);
//     //   CollectorWallet.whithdraw(amount);
//     //   assertEq(prevbalanc,expectedbalanc,"you do not have enough money");
//     //   vm.stopPrank();

//     // }
//     // function testWhithdrawIsntAllowd() public{
//     //   uint256 amount=10;
//     //   uint256 prevbalanc=address(CollectorWallet).balance;
//     //   uint256 expectedbalanc=address(CollectorWallet).balance+amount;
//     //   vm.expectRevert("You do not have permissions");
//     //   vm.startPrank(0x81Ee0c1564B711bDf324295a1f1e02E1920876aD);
//     //   CollectorWallet.whithdraw(amount);
//     //   assertEq(prevbalanc,expectedbalanc);
//     //   vm.stopPrank();

//     // }

//     function testGetBalance() public {
//         uint256 nowBalance = address(w).balance;
//         uint256 getbalance = w.getBalance();
//         assertEq(nowBalance, getbalance, "Erore");
//     }
// }


//     function testAddGabayIsAllowd() public {
//         uint256 nowcounter = w.counter();
//         vm.startPrank(myUser);
//         w.addGabay(0x57C91e4803E3bF32c42a0e8579aCaa5f3762af71);
//         assertEq(w.counter(), nowcounter + 1);
//         vm.stopPrank();
//     }

//     function testAddGabayIsntAllowd() public {
//         uint256 nowcounter = w.counter();
//         address IsntAllowd=vm.addr(8);
//         vm.startPrank(IsntAllowd);
//         vm.expectRevert("you are not owner");
//         w.addGabay(0x074AC318E0f004146dbf4D3CA59d00b96a100100);
//         assertEq(w.counter(), nowcounter);
//         vm.stopPrank();
//     }

//     function testAddGabayAlreadyExists() public {
//         vm.startPrank(myUser);
//         vm.expectRevert("this is already a gabay");
//         w.addGabay(0x434d091Ef55054e5fe7e43008A7120f92D471415);
//         vm.stopPrank();
//     }

//     function testAddGabayMoreThanThree() public {
//         uint256 nowcounter = w.counter();
//         vm.startPrank(myUser);
//         w.addGabay(0x074AC318E0f004146dbf4D3CA59d00b96a100100);
//         vm.expectRevert("too many Gabaim");
//         w.addGabay(0x7ae3DbAC75D264B6F6976639ebBfC645601D3F15);
//         assert(nowcounter > 3);
//         vm.stopPrank();
//     }

//     function testChangeOwner() public {
//         address newCollector = vm.addr(10);
//         address oldCollector = 0x434d091Ef55054e5fe7e43008A7120f92D471415;
//         w.changeOwner(oldCollector, newCollector);
//         assertEq(w.collectors(oldCollector), 0);
//         assertEq(w.collectors(newCollector), 1);
//     }

//     function testChangeOwnerIsAllowd() public {
//         address oldCollector = vm.addr(15);
//         address newCollector = 0x074AC318E0f004146dbf4D3CA59d00b96a100100;
//         vm.expectRevert("you are not owner");
//         w.changeOwner(oldCollector, newCollector);
//         assertEq(w.collectors(oldCollector), 0);
//     }

//     function testChangeOwnerIsntAllowd() public {
//         address oldCollector = 0x434d091Ef55054e5fe7e43008A7120f92D471415;
//         address newCollector = 0x168e5f2f4D0aBA5f4B4434b9Be4beAF43dc9c5d5;
//         vm.expectRevert("you are a collector");
//         w.changeOwner(oldCollector, newCollector);
//         assertEq(w.collectors(newCollector), 1);
//     }

//     function testWhithdrawIsAllowd() public {
//        payable(address(w)).transfer(100); //Depositing money into the account
//         uint256 amount = 50;
//         uint256 prevbalanc = address(w).balance;
//         uint256 expectedbalanc = address(w).balance + amount;
//         vm.startPrank(myUser);
//         w.whithdraw(amount);
//         console.log("hello");
//         assertEq(prevbalanc, expectedbalanc);
//         vm.stopPrank();
//     }
//     // function testWhithdrawisntenoughmoney() public{
//     //   uint256 amount=150;
//     //   uint256 prevbalanc=address(CollectorWallet).balance;
//     //   uint256 expectedbalanc=address(CollectorWallet).balance+amount;
//     //   vm.startPrank(myUser);
//     //   CollectorWallet.whithdraw(amount);
//     //   assertEq(prevbalanc,expectedbalanc,"you do not have enough money");
//     //   vm.stopPrank();

//     // }
//     // function testWhithdrawIsntAllowd() public{
//     //   uint256 amount=10;
//     //   uint256 prevbalanc=address(CollectorWallet).balance;
//     //   uint256 expectedbalanc=address(CollectorWallet).balance+amount;
//     //   vm.expectRevert("You do not have permissions");
//     //   vm.startPrank(0x81Ee0c1564B711bDf324295a1f1e02E1920876aD);
//     //   CollectorWallet.whithdraw(amount);
//     //   assertEq(prevbalanc,expectedbalanc);
//     //   vm.stopPrank();

//     // }

//     function testGetBalance() public {
//         uint256 nowBalance = address(w).balance;
//         uint256 getbalance = w.getBalance();
//         assertEq(nowBalance, getbalance, "Erore");
//     }
// }
