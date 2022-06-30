// Flow allows you to redeploy contracts. 

access(all) contract HelloInconfido { // access(all) == pub 

    // Declare a public field of type String.
    // All fields must be initialized in the init() function.
    access(all) let greeting: String // constant, set once and never changed. Strictly typed, hence String

    // The init() function is required if the contract contains any fields.
    init() {
        self.greeting = "Hello, Inconfido is the best!" // run once, immutable
    }

    // public getter method returning the value
    access(all) fun hello(): String { // if function returns value, the expected type returned needs to be provided
        return self.greeting 
    }
}


