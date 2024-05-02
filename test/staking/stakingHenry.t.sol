pragma solidity ^0.8.20;
//  import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "@hack/store/store.sol";
import "@hack/erc20/erc20.sol";
import "../../../src/staking/stakingHenry.sol";

contract staking is Test {
    uint WAD = 10 ** 18;
    StakingRewards public staking;
    ERC20 rt;
    ERC20 st;


    function setUp() public {
        st = new ERC20();
        rt=new ERC20();
}

}
