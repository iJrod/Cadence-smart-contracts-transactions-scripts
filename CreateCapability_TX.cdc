import HelloWorldResource from 0x02

// This transaction creates a new Capability for the HelloAsset resource in storage and adds it to the accounts public storage

// Other accounts and scripts can use this Capability to create a reference to the private object to be able to access its fields and call its methods

// This transaction will only run under 0x02 as that Account stores the Resource 
// Running under 0x01 causes a panic Error "panic: Could not borrow a reference to the hello capability
// This demonstrates that just because a Resource exists and there's a pubic method on it, you still have to intentionally give the public access to the Resource in order for them to work / read datafrom it

transaction {
    prepare(account: AuthAccount) {

        // Create a public Capability by linking the Capability to a 'target' object in account storage
        // The Capability allows access to the object through an interface defined by the owner.
        // This does not check if the link is valid or if the 'target' exists, it just created the Capability
        // The Capability is created and stored at /public/Hello and is also returned from the function
        // Linking to a reference, identifying the type of reference we're trying to borrow - represented by the & operator
        // HelloAsset type from the HelloWorldResource contract
        let capability = account.link<&HelloWorldResource.HelloAsset>(/public/Hello, target: /storage/Hello)

        
        // Use the Capability's borrow method to create a new reference to the object that the Capability links to
        // Optional chaining (?? operator) used to get the value. If it is Nil, then a panic is caused
        let helloReference = capability!.borrow()
            ?? panic("Could not borrow a reference to the hello capability")

            // Call the hello() function using the reference to the HelloAsset resource
            log(helloReference.hello())
    }
}
