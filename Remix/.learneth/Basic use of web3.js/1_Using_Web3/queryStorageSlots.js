(async () => {
  try {
    let addr = '0x75305ddC9927E9f02b8b4Bf372923415a8EC7d56'
    let blockNumber = await web3.eth.getBlockNumber()
    let storage0 = await web3.eth.getStorageAt(addr, 0)
    let storage1 = await web3.eth.getStorageAt(addr, 1)
    let storage2 = await web3.eth.getStorageAt(addr, 2)
    let storage3 = await web3.eth.getStorageAt(addr, 3)
    let storage4 = await web3.eth.getStorageAt(addr, 4)
    let storage5 = await web3.eth.getStorageAt(addr, 5)
    let storage6 = await web3.eth.getStorageAt(addr, 6)

    console.log('current block number : ', blockNumber)
    console.log('Storage 0: bool public $locked, checked!', storage0)
    console.log('Storage 1: uint256 public $ID, checked!', storage1)
    console.log('Storage 2: uint8 $flattening, uint8 $denomination, uint16', storage2)
    console.log('Storage 3: bytes32[] $data', storage3)
    console.log('Storage 4: bytes32[] $data', storage4)
    console.log('Storage 5: bytes32[] $data', storage5)
    console.log('Storage 6: bytes32[] $data', storage6)
  } catch (e) {
    console.log(e.message)
  }
})()