'use strict'
/* eslint-disable */
const {config} = require('dotenv')
config()

require('@nomiclabs/hardhat-ethers')
require('@nomiclabs/hardhat-waffle')
require('@nomiclabs/hardhat-etherscan')
require('@openzeppelin/hardhat-upgrades')
require('hardhat-contract-sizer')
require('solidity-coverage')

const NODE_URL = process.env.NODE_URL || ''
const ROPSTEN_PRIVATE_KEY = process.env.ROPSTEN_PRIVATE_KEY || ''
const MAINNET_PRIVATE_KEY = process.env.MAINNET_PRIVATE_KEY || ''
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || ''
const LOCAL_PRIVATE_KEY = process.env.LOCAL_PRIVATE_KEY || ''

module.exports = {
  defaultNetwork: 'hardhat',
  solidity: '0.7.3',
  networks: {
    hardhat: {
      forking: {
        url: NODE_URL,
        blocknumber: 12222222,
      },
      timeout: 50000
    },
    coverage: {
      url: 'http://127.0.0.1:8555', // Coverage launches its own ganache-cli client
    },
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: ETHERSCAN_API_KEY,
  },
  contractSizer: {
    alphaSort: true,
    runOnCompile: true,
    disambiguatePaths: false,
  }
}
