// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {
    // uint256 public funds = 1000;
    receive() external payable {}

    function addFunds() external payable {}

    function justTest() external pure returns (uint256) {
        return 2 + 2;
    }
}
