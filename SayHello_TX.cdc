import HelloWorld from 0x01

// script is used to read data from the chain. Transaction is for read/write - they have fees

transaction {

    prepare(acct: AuthAccount) {} // Usually account who signs the transaction will be able to modify/access the object

    execute {
        log(HelloWorld.hello()) // Run the hello() function from HelloWorld contract
    }
}