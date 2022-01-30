// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Owned.sol";

interface IFaucet {
    function addFunds() external payable;

    function withdraw(uint256 withdrawAmount) external;
}
