import HelloWorldResource from 0x02

// Scripts do not have a signer, therefore they can be run from any account
// Scripts act as a third-party, allowing the demonstration of the fact that the public Capability created for HelloAsset is inded publi and accessible

// A script is a special type of Cadence transaction that does not have access to any Account's storage
// Scripts cannot modify state, and any state changes that it would make are reverted after execution

// For this script to work, 0x02 must have previously run the "Create Capability" transaction

access(all) fun main() {

    // Cadence code can get an Account's public account object by using the getAccount() built-in function
    // "I want to know everything the public can access in this account"
    let helloAccount = getAccount(0x02)

    // Get the public Capability from the public path of the owner's account
    // Created from the "Create Link" Transaction
    let helloCapability = helloAccount.getCapability<&HelloWorldResource.HelloAsset>(/public/Hello)

    // Borrow a reference for the Capability
    let helloReference = helloCapability.borrow()
        ?? panic("Could not borrow a reference to the hello capability")

    // The log built-in function logs its arguments to stdout
    log(helloReference.hello())
}