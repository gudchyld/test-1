/*Actual Code*/


// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract TokenSwap {


    struct Order{
        address _firstToken,      
        uint _amount1,
        address _secondToken,        
        uint _amount2
    }

    mapping (uint => Order) swapOrder;

    mapping (address => mapping (address => uint256)) userTokenBalance;


}