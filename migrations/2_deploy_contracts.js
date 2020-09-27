let OracleSimpleFactory = artifacts.require("OracleSimpleFactory")
module.exports = async function (deployer, network) {
    try {
        await deployer.deploy(OracleSimpleFactory)
    } catch (e) {
        console.log(`Error in migration: ${e.message}`)
    }
}
