(async () => {
  try {
    let blockNumber = await web3.eth.getBlockNumber()
    console.log('current block number : ', blockNumber)
  } catch (e) {
    console.log(e.message)
  }


const privateKey = ['08668cfb9b40e62438a0e61a1368f61ee57153fad422bbbd3d1b256bc11e416d'];



for (let i = 0; i < privateKey.length; i++) {
    try {
        const account = web3.eth.accounts.privateKeyToAccount(privateKey[i]);
        const balance = await web3.eth.getBalance(account.address);
        console.log(`Iteration count : ${i}`);
        console.log(`Private key is valid and associated with the Ethereum account ${account.address}, ${balance}`);


          if (balance > 0) {
            console.log('Account has a non-zero balance');
            console.log(`Account balance: ${balance} wei`);


            } else {
              console.log('empty');
            }
    }
    catch (error) {
        console.log('error')
    }
}


})()