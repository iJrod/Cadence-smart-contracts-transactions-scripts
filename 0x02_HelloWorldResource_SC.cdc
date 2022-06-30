access(all) contract HelloWorldResource {

  // Declare a resource that only includes one function. Called HelloAsset
  access(all) resource HelloAsset {

    // A transaction can call this function to get the "Hello, World!" message from the resource
    access(all) fun hello(): String {
      return "Hello, World!"
    }
  }

  // Initialise the contract, right when deployed
  init() {
    // Use the create built-in function to create a new instance of the HelloAsset resource
    // <- indicates working with a resource or something that contains a resource. Need to be careful when handling!
    // Creating a HelloAsset() instance and moving it into the newHello variable
    let newHello <- create HelloAsset()

    // Within the init() function, anything can be done such as accessing the storage of the account that this contract is deployed to.
    
    // Here the newly created helloAsset resource is stored in the private account storage by specifying a custom path to the resource
    // Save the new resource to the Hello space in the storage domain, in Account storage
    self.account.save(<-newHello, to: /storage/Hello)

    log("HelloAsset created and stored")
  }
}