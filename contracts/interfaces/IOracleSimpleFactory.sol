// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.7.3;

interface IOracleSimpleFactory {
    event OracleCreated(address indexed _sender, address indexed _newOracle);

    function ours(address a) external view returns (bool);

    function oracleCount() external view returns (uint256);

    function oracleAt(uint256 idx) external view returns (address);

    function getOracle(
        address tokenA,
        address tokenB,
        uint256 _period
    ) external view returns (address);

    function createOracle(
        address factory,
        address tokenA,
        address tokenB,
        uint256 _period
    ) external returns (address oracleaddr);
}
