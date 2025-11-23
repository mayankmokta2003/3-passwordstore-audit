### [S-#] TITLE (Root Cause + Impact) The password in the contract is actually not private on-chain

**Description:** All the data stored on-chain is actually visible to anyone, in out contract `PasswordStore::s_password` is actually privated but on-chain anyone can access it but in our function `PasswordStore::getPassword` we only want this to be accesed by the owner but as i told you on-chain anyone can access it.

**Impact:** Anyone from outside can read the password, hence `PasswordStore::s_password` is not actually private hence breaking the functionality of the contract.

**Proof of Concept:** (Proof of Code):

The next shows how your `PasswordStore::s_password` can be accesed by anyone.

1. Create a locally running chain

```anvil```

2. Deploy on local chain

```make deploy```

3. 

```cast storage <DEPLOYED ADDRESS> 1 --rpc-url http://127.0.0.1:8545```


**Recommended Mitigation:**