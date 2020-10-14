
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.6;

interface IOracleSimpleFactory {
    event OracleCreated(address indexed _sender, address indexed _newOracle);

    function ours(address a) external view returns (bool);
    function oracleCount() external view returns (uint);
    function oracleAt(uint idx) external view returns (address);
    function getOracle(address tokenA, address tokenB, uint _period) external view returns (address);
    function createOracle(address factory, address tokenA, address tokenB, uint _period) external returns (address oracleaddr);
}
