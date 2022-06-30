import HelloWorld from 0x01

// Scripts are used to read data from the chain. Transaction is for read/write - they have fees
// This example of a Transaction should really be a script

transaction {

    prepare(acct: AuthAccount) {} // Usually account who signs the transaction will be able to modify/access the object

    execute {
        log(HelloWorld.hello()) // Run the hello() function from HelloWorld contract
    }
}
