
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.6;

interface IOracleSimple {

    function update() external;
    function consult(address token, uint amountIn) external view returns (uint amountOut);

}
