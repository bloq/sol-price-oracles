// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.7.3;

import "./interfaces/IOracleSimpleFactory.sol";
import "./OracleSimple.sol";

contract OracleSimpleFactory is IOracleSimpleFactory {
    address[] private allOracles;
    mapping(address => bool) public isOurs;
    mapping(address => mapping(address => mapping(uint256 => address))) private oracleIdx;

    function ours(address a) external view override returns (bool) {
        return isOurs[a];
    }

    function oracleCount() external view override returns (uint256) {
        return allOracles.length;
    }

    function oracleAt(uint256 idx) external view override returns (address) {
        require(idx < allOracles.length, "Index exceeds list length");
        return allOracles[idx];
    }

    function getOracle(
        address tokenA,
        address tokenB,
        uint256 _period
    ) external view override returns (address) {
        return oracleIdx[tokenA][tokenB][_period];
    }

    function createOracle(
        address factory,
        address tokenA,
        address tokenB,
        uint256 _period
    ) external override returns (address oracleaddr) {
        require(oracleIdx[tokenA][tokenB][_period] == address(0), "Oracle already exists");

        // create new oracle contract
        oracleaddr = address(new OracleSimple(factory, tokenA, tokenB, _period));

        // remember oracle
        allOracles.push(oracleaddr);
        isOurs[oracleaddr] = true;
        oracleIdx[tokenA][tokenB][_period] = oracleaddr;
        oracleIdx[tokenB][tokenA][_period] = oracleaddr;

        // log creation
        emit OracleCreated(msg.sender, oracleaddr);
    }
}
