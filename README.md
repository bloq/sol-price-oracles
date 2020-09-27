# sol-price-oracles

A simple factory wrapper around price oracles from the Uniswap team.

## Summary example

A smart contract system wishes to manage price oracles, as described in
[Uniswap Core Concepts - Oracles](https://uniswap.org/docs/v2/core-concepts/oracles/).


This factory complex is [TO BE] independently deployed.  This adds a
convenience factor for developers wishing to sample Uniswap prices.

This factory also adds a trust element:  [NOTE:  NOT YET!]  When
deployed, this factory will produce oracles that may be trusted to be
audited, behave in a predictable, known fashion, and have not been
tampered with by potentially unscrupulous actors.

As such, use of oracles created by this factory removes an element of
trust from downstream projects - some trust is shifted to this system -
thus increasing the trustless factor of downstream projects.

## Public operations (APIs)

### Anyone:  Update price database

Update on-chain state with price data (if and only if the requisite
time period has elapsed).

### Anyone:  Query price database

Given an input ERC20 tokenA address and tokenA amount, return
the amount of tokenB that would be produced by a swap.

### Anyone:  Create new price oracle

Create a new price oracle automaton, given the inputs of:

1. tokenA:  1st of 2 tokens in a Uniswap pair, whose price shall be monitored.
2. tokenB:  2nd of 2 tokens in a Uniswap pair, whose price shall be monitored.
3. period:  price sampling time period, in seconds.

Returns the Ethereum address of the newly created price oracle contract.


## Setup.
1. Install packages
   ```
   npm i -g truffle
   npm i
   ```
2. Update provider url in config/default.json
3. Set DEPLOYMENT_ACCOUNT_KEY in env
   ```
   create a .env file in root
   DEPLOYMENT_ACCOUNT_KEY =  "my mnemonic phrase"
   ```
4. Deploy you own contracts if want to do arb- 
   ``` 
   truffle migrate --reset --network mainnet/ropsten
   ```
