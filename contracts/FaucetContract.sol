// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {
    uint256 public numberOfFounders;
    mapping(address => bool) private funders;
    mapping(uint256 => address) private lutfunders;

    receive() external payable {}

    function addFunds() external payable {
        // uint256 index = numberOfFounders++;
        address funder = msg.sender;

        if (!funders[funder]) {
            uint256 index = numberOfFounders++;
            funders[funder] = true;
            lutfunders[index] = funder;
        }
    }

    function withdraw(uint256 withdrawAmount) external {
        require(
            withdrawAmount <= 100000000000000000,
            "Can not withdraw more than 0.1 eather "
        );
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
