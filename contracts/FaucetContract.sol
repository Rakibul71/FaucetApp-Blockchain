// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Owned.sol";
import "./Logger.sol";
import "./IFaucet.sol";

contract Faucet is Owned, Logger, IFaucet {
    uint256 public numberOfFounders;

    mapping(address => bool) private funders;
    mapping(uint256 => address) private lutfunders;

    modifier limitWithdraw(uint256 withdrawAmount) {
        require(
            withdrawAmount <= 100000000000000000,
            "Can not withdraw more than 0.1 eather "
        );
        _;
    }

    receive() external payable {}

    function emitLog() public pure override returns (bytes32) {
        return "hello world";
    }

    function addFunds() external payable override {
        address funder = msg.sender;
        test3();

        if (!funders[funder]) {
            uint256 index = numberOfFounders++;
            funders[funder] = true;
            lutfunders[index] = funder;
        }
    }

    function test1() external onlyOwner {}

    function test2() external onlyOwner {}

    function withdraw(uint256 withdrawAmount)
        external
        override
        limitWithdraw(withdrawAmount)
    {
        payable(msg.sender).transfer(withdrawAmount);
    }

    function getAllFunders() external view returns (address[] memory) {
        address[] memory _funders = new address[](numberOfFounders);

        for (uint256 i = 0; i < numberOfFounders; i++) {
            _funders[i] = lutfunders[i];
        }
        return _funders;
    }

    function getFunderAtIndex(uint8 index) external view returns (address) {
        return lutfunders[index];
    }
}

// const instance = await Faucet.deployed()
// instance.addFunds({from:accounts[0],value:"2000000000000000000"})
// instance.addFunds({from:accounts[1],value:"2000000000000000000"})
//instance.getFunderAtIndex(0)
//instance.getAllFunders()

// instance.withdraw("5000000000000000000", {from:accounts[1]})
