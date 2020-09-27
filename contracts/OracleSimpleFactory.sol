
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.6;

import './interfaces/IOracleSimpleFactory.sol';
import './OracleSimple.sol';

contract OracleSimpleFactory is IOracleSimpleFactory {
    address[] private allOracles;

    constructor() public {
    }

    function oracleCount() external override view returns (uint) {
        return allOracles.length;
    }

    function oracleAt(uint idx) external override view returns (address) {
        require(idx < allOracles.length);
	return allOracles[idx];
    }

    function createOracle(address factory, address tokenA, address tokenB, uint _period) external override returns (address oracleaddr) {
        oracleaddr = address(new OracleSimple(factory, tokenA, tokenB, _period));
	allOracles.push(oracleaddr);
	emit OracleCreated(msg.sender, oracleaddr);
    }
}
