// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract TokenSwap {


    struct Order{
        address _firstToken,
        address _owner1,
        uint _amount1,
        address _secondToken,
        address _owner2,
        uint _amount2
    }

    mapping (uint => Order) swapOrder;

    mapping (address => mapping (address => uint256)) userTokenBalance;


}