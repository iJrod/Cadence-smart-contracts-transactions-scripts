# Practising and taking notes of Flow's Cadence Smart Contracts, Transactions, Scripts
Practise of Flow's Cadence smart contracts, transactions, and scripts. I was running these in https://play.onflow.org/

Flow: "Cadence is a resource-oriented programming language that introduces new features to smart contract programming that help developers ensure that their code is safe, secure, clear, and approachable. Some of these features are: Type safety and a strong static type system."

---

**0x01_HelloInconfido_SC.cdc** is just a Smart Contract that will return a String [Account 0x01]

**0x02_HelloWorldResource_SC.cdc** is Smart Contract that makes use of Resources for two transactions and the script [Account 0x02]

---

**SayHello_TX.cdc** is the simple Transaction that returns the String from the hello() method in 0x01_HelloInconfido.cdc

**LoadHello_TX.cdc** is a Transaction that creates a loads the resource from 0x02_HelloWorldResource.cdc, calls the hello() method on it, and then returns the resorce back to storage.

**CreateCapability_TX.cdc** is a Transaction that creates a Capability for the HelloAsset resource in storage and adds it to the Public storage area

---

**PublicInteract_SCRPT.cdc** is a script that allows any Account to access the hello() method within the public Capability made by CreateCapability_TX.cdc, as long as 0x02 has executed the CreateCapability_TX.cdc Transaction.

---

All code is heavily commented for explanation
