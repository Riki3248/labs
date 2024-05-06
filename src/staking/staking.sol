// SPDX-License-Identifier: MIT
// https://solidity-by-example.org/defi/staking-rewards/
pragma solidity ^0.8.20;
import "../../new-project/src/MyToken.sol";
import "../../new-project/lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

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
    uint public totalSupply = 100000;

    constructor(address _token) {
        user = msg.sender;
        token = MyToken(_token);
        reward = 100000 * WAD;
        token.mint(address(this), totalSupply * WAD);
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

    // function amount() external view returns (uint) {
    //     return start[msg.sender].amount;
    // }
    function calc() external view returns (uint) {
        return start[msg.sender].calc;
    }

    function withdraw() external isEnoughDays {
        uint calc = start[msg.sender].calc;
        uint256 CountReward = calcReward(totalSupply, calc);
        token.transferFrom(address(this), msg.sender, CountReward);
        totalSupply -= CountReward;
    }

    function calcReward(uint total, uint calc) public returns (uint256) {
        uint256 CountReward = ((calc * 100) / total) / 1e18;
        return CountReward;
    }
}
