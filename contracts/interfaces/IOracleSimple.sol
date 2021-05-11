// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.7.3;

interface IOracleSimple {
    function update() external;

    function consult(address token, uint256 amountIn) external view returns (uint256 amountOut);
}
