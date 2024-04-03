import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "@hack/store/store.sol";
import "../../../src/change/changeContract.sol";
contract TestChange is Test {

Change public c;

function setUp() public{
    c=new Change();
}

}
