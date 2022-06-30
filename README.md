# Cadence-smart-contracts-transactions-scripts
Practise of Cadence smart contracts, transactions, and scripts. I was running these in https://play.onflow.org/local-project

---

**0x01_HelloInconfido.cdc** is just a Smart Contract that will return a String

**0x02_HelloWorldResource.cdc** is Smart Contract that makes use of Resources for two transactions and the script

---

**SayHello_TX.cdc** is the simple Transaction that returns the String from the hello() method in 0x01_HelloInconfido.cdc

**LoadHello_TX.cdc** is a Transaction that creates a loads the resource from 0x02_HelloWorldResource.cdc, calls the hello() method on it, and then returns the resorce back to storage.

**CreateCapability_TX.cdc** is a Transaction that creates a Capability for the HelloAsset resource in storage and adds it to the Public storage area

---

**PublicInteract_SCRPT.cdc** is a script that allows any Account to access the hello() method within the public Capability made by CreateCapability_TX.cdc, as long as 0x02 has executed the CreateCapability_TX.cdc Transaction.

---

All code is heavily commented for explanation
