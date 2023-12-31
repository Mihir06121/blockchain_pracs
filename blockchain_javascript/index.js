const SHA256 = require('crypto-js/sha256');
 
class Block {
    constructor(index, timestamp, data, previousHash = '') {
        this.index = index;
        this.timestamp = timestamp;
        this.data = data;
        this.previousHash = previousHash;
        this.hash = this.calculateHash();
    }
 
    calculateHash() {
        return SHA256(this.index + this.timestamp + this.data + this.previousHash).toString();
    }
}
 
class Blockchain {
    constructor() {
        this.chain = [this.createGenesisBlock()];
    }
 
    createGenesisBlock() {
        return new Block(0, '01/01/2021', 'Genesis Block', '0');
    }
 
    getLatestBlock() {
        return this.chain[this.chain.length - 1];
    }
 
    addBlock(newBlock) {
        newBlock.previousHash = this.getLatestBlock().hash;
        newBlock.hash = newBlock.calculateHash();
        this.chain.push(newBlock);
    }
 
    isChainValid() {
        for (let i = 1; i < this.chain.length; i++) {
            const currentBlock = this.chain[i];
            const previousBlock = this.chain[i - 1];
 
            if (currentBlock.hash !== currentBlock.calculateHash() || currentBlock.previousHash !== previousBlock.hash) {
                return false;
            }
        }
        return true;
    }
}
 
// Usage
let myBlockchain = new Blockchain();
myBlockchain.addBlock(new Block(1, '02/01/2021', 'Transaction 1'));
myBlockchain.addBlock(new Block(2, '03/01/2021', 'Transaction 2'));
 
console.log('Blockchain is valid? ' + myBlockchain.isChainValid());
 
// Tampering with the blockchain
myBlockchain.chain[1].data = 'Modified Transaction';
console.log('Blockchain is valid? ' + myBlockchain.isChainValid());
