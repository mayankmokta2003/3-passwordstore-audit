### [S-#] TITLE (Root Cause + Impact) The password in the contract is actually not private on-chain

**Description:** All the data stored on-chain is actually visible to anyone, in out contract `PasswordStore::s_password` is actually privated but on-chain anyone can access it but in our function `PasswordStore::getPassword` we only want this to be accesed by the owner but as i told you on-chain anyone can access it.

**Impact:** Anyone from outside can read the password, hence `PasswordStore::s_password` is not actually private hence breaking the functionality of the contract.

**Proof of Concept:** (Proof of Code):

The next shows how your `PasswordStore::s_password` can be accesed by anyone.

1. Create a locally running chain.

```anvil```

2. Deploy on local chain.

```make deploy```

3. Then we will run this command to get access to storage and `PasswordStore::s_password` is on index 1 so we used 1 below.

```cast storage <DEPLOYED ADDRESS> 1 --rpc-url http://127.0.0.1:8545```

4. Then we will get the hashed address of the index 1 in storage at output put that address in this below command.

```cast parse-bytes32-string <hashed address>```


**Recommended Mitigation:** 








### [S-#] TITLE (Root Cause + Impact) Anyone can change the password

**Description:** In the function `PasswordStore::setPassword` the function in actually not set to only owner can call which is actually not the thing contract should show because you want that only the owner can change the password.

**Impact:** Due to not making the function `PasswordStore::setPassword` only called by the user anyone from outside can call this function and anyone can set the password or create new password which is a big issue.

**Proof of Concept:** The next test shows that anyone from outside can set the password. Plus add this test in `PasswordStoreTest.t.sol`.

<details>

```javascript
function testAnyoneCanChangePassword(address randomuser) external {
        vm.assume(randomuser != owner);
        vm.prank(randomuser);
        string memory expectedPass = "mayank123";
        passwordStore.setPassword(expectedPass);
        vm.prank(owner);
        string memory pass = passwordStore.getPassword();
        assetEq(pass,expectedPass);
    }
```

</details>

**Recommended Mitigation:** Add an access control to the function `PasswordStore::setPassword` so only owner can call this function.

```javascript

if(msg.sender != s_owner){
    revert PasswordStore__NotOwner();
}

```







### [S-#] TITLE (Root Cause + Impact) the description of the function `PasswordStore::getPassword` is wrong.

**Description:** the line below says there should be a parameter ion the `PasswordStore::getPassword` but there is no parameter at all.

```javascript

/*
     * @notice This allows only the owner to retrieve the password.
@>     * @param newPassword The new password to set.
     */
    function getPassword() external view returns (string memory);
```
 
**Impact:** the line `@param newPassword The new password to set.` is incorrect.

**Recommended Mitigation:** Remove the incorrect natspec.

```diff

- * @param newPassword The new password to set.

```