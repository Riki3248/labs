pragma solidity ^0.8.20;
 import "forge-std/Test.sol";
import "@hack/store/store.sol";
import "../../../src/EqualDevide.sol";
// import "../src/like/IERC20.sol";
import "../new-project/src/MyToken.sol";


contract EqualDevideTest is Test {
    uint256 WAD = 10 ** 18;
    EqualDevide public ed;
    IERC20 token;

    function setUp() public {
        ed = new EqualDevide();   
         token = new IERC20('TOKEN');
    }
function TestFnEqualDevide() public{
    uint initialBalance=ed.userAddress.
    ed.fnEqualDevide(400*WAD);

}
   
}
