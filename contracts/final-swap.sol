pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Token-Swap {
    address tokenAddress1;
    address tokenAddress2;

    constructor(address _tokenAddress1, address _tokenAddress2) {
        tokenAddress1 = _tokenAddress1;
        tokenAddress2 = _tokenAddress2;
    }
     
    // userAddress => tokenAddress => token amount
    mapping (address => mapping (address => uint256)) userTokenBalance;

    //event tokenDepositComplete(address tokenAddress, uint256 amount);

    function depositToken( uint256 amount) public  {
        require(IERC20(tokenAddress).balanceOf(msg.sender) >= amount, "Your token amount must be greater then you are trying to deposit");
        require(IERC20(tokenAddress).approve(address(this), amount));
        require(IERC20(tokenAddress).transferFrom(msg.sender, address(this), amount));

        userTokenBalance[msg.sender][tokenAddress] += amount;
       // emit tokenDepositComplete(tokenAddress, amount);
    }

    //event tokenWithdrawalComplete(address tokenAddress, uint256 amount);

    function withDrawAll() public {
        require(userTokenBalance[msg.sender][tokenAddress] > 0, "User doesnt has funds on this vault");
        uint256 amount = userTokenBalance[msg.sender][tokenAddress];
        require(IERC20(tokenAddress).transfer(msg.sender, amount), "the transfer failed");
        userTokenBalance[msg.sender][tokenAddress] = 0;
        emit tokenWithdrawalComplete(tokenAddress, amount);
    }

    function withDrawAmount(uint256 amount) public {
        require(userTokenBalance[msg.sender][tokenAddress] >= amount);
        require(IERC20(tokenAddress).transfer(msg.sender, amount), "the transfer failed");
        userTokenBalance[msg.sender][tokenAddress] -= amount;
        emit tokenWithdrawalComplete(tokenAddress, amount);
    }

}