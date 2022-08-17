// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KingsToken is ERC20, Ownable {
    uint public constant maxTotalSupply = 10000000 * 10 ** 18;

    constructor() ERC20("Kings Token", "KT") {}

    function mint(uint _amount) internal {
        _mint(msg.sender, _amount);
    }
}