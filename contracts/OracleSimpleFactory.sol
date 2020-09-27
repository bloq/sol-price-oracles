
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.6;

import './interfaces/IOracleSimpleFactory.sol';
import './OracleSimple.sol';

contract OracleSimpleFactory is IOracleSimpleFactory {
    address[] private allOracles;
    mapping(address => mapping(address => mapping(uint => address))) private oracleIdx;

    constructor() public {
    }

    function oracleCount() external override view returns (uint) {
        return allOracles.length;
    }

    function oracleAt(uint idx) external override view returns (address) {
        require(idx < allOracles.length);
        return allOracles[idx];
    }

    function getOracle(address tokenA, address tokenB, uint _period) external override view returns (address) {
        return oracleIdx[tokenA][tokenB][_period];
    }

    function createOracle(address factory, address tokenA, address tokenB, uint _period) external override returns (address oracleaddr) {
        require(oracleIdx[tokenA][tokenB][_period] == address(0), "Oracle already exists for token pair");

        // create new oracle contract
        oracleaddr = address(new OracleSimple(factory, tokenA, tokenB, _period));

        // remember oracle
        allOracles.push(oracleaddr);
        oracleIdx[tokenA][tokenB][_period] = oracleaddr;
        oracleIdx[tokenB][tokenA][_period] = oracleaddr;

        // log creation
        emit OracleCreated(msg.sender, oracleaddr);
    }
}
