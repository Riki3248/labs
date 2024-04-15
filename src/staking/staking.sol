// SPDX-License-Identifier: MIT
// https://solidity-by-example.org/defi/staking-rewards/
pragma solidity ^0.8.20;
import "../../../MyToken/new-project/src/MyToken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

struct User {
    uint amount;
    uint calc;
    uint time;
}

contract Staking {
    uint WAD = 10 ** 18;
    MyToken public token;
    uint reward;
    mapping(address => User) public start;

    address public user;

    uint public startAt;

    uint public duration = 7;

    uint public updatedAt;
    uint public rewardPerTokenStored;
    mapping(address => uint) public deposits;
    uint256 percentOfDeposit; //percent from totalSupply
    uint public totalSupply;
    mapping(address => uint256) public rewards;

    constructor(address _token) {
        user = msg.sender;
        token = MyToken(_token);
        reward = 100000 * WAD;
        token.mint(100000 * WAD);
    }

    modifier onlyUser() {
        require(msg.sender == user, "not authorized");
        _;
    }

    receive() external payable {}

    function Deposit(uint256 amount) external onlyUser {
        require(amount > 0, "amount = 0");
        token.transferFrom(msg.sender, address(this), amount);
        totalSupply += amount;
        start[msg.sender].time = block.timestamp;
        start[msg.sender].amount += amount;
        start[msg.sender].calc += (amount * 100) / totalSupply;
        
    }

    modifier isEnoughDays() {
        //Checks if 7 days have passed since the deposit
        uint256 today = block.timestamp;
        require(
            today - start[msg.sender].time >= 7 days,
            "reward duration not finished"
        );
        _;
    }

    function withdraw() external isEnoughDays {
        uint calc = start[msg.sender].calc; 
        uint256 CountReward = calcReward(totalSupply, calc);     
        token.transferFrom(address(this), msg.sender, CountReward); 
        totalSupply -= CountReward;
    }

    function calcReward(uint totalSupply ,uint calc) public returns (uint256) {
       uint256 CountReward = (calc * totalSupply*1e18) / 100*1e18;
      return CountReward;
    }
}
