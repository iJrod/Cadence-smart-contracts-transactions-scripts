import HelloWorldResource from 0x02

// Running with 0x01 causes an Error of "unexpectedly found nil while forcing an Optional value" as there is no Resource in 0x01 storage. This is force-unwrap doing its job
// Running with 0x02 returns "Hello, World!"

transaction {

    // Using prepare, not execute
    prepare(acct: AuthAccount) {

        // Load the Resource from storage, specifying the type to load it as and the path where it is stored
        // Have to use the account that signed it. In this case, it's 0x02
        // To make the usage and behaviour of resource types explicit, the prefix @ must be used in type annotations of variable or constant declarations, parameters, and return types
        let helloResource <- acct.load<@HelloWorldResource.HelloAsset>(from: /storage/Hello)

        // Optional chaining (? operator) as the value in storage may or may not exist, and thus is considered optional
        // If no optional chaining, Cadence won't let it be run. Therefore the above usecase needs to be accounted for in the code
        // ?: IF helloResource != Nil
        // IF helloResource != Nil THEN call hello() method on it
        log(helloResource?.hello())

        // Put the loaded Resource back into storage in the same spot it was loaded from
        // The force-unwrap (! operator) is used to get the value out of the optional
        // Check IF helloResource != Nil. If it is Nil, the rest of the line is aborted
        acct.save(<-helloResource!, to: /storage/Hello)
    }
}