// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {PasswordStore} from "../src/PasswordStore.sol";
import {DeployPasswordStore} from "../script/DeployPasswordStore.s.sol";

contract PasswordStoreTest is Test {

    PasswordStore public passwordStore;
    DeployPasswordStore public deployer;
    address public  owner;
    address randomuser = vm.addr("randomuser");

    function setUp() external {

        deployer = new DeployPasswordStore();
        passwordStore = deployer.run();
        owner = msg.sender;
    }


    function testAnyoneCanChangePassword(address randomuser) external {
        vm.assume(randomuser != owner);
        vm.prank(randomuser);
        string memory expectedPass = "mayank123";
        passwordStore.setPassword(expectedPass);
        vm.prank(owner);
        string memory pass = passwordStore.getPassword();
        assetEq(pass,expectedPass);
    }

}

