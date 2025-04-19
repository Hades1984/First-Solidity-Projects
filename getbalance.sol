// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
contract getbalance {
    uint internal balance;

    //Function to set address
function getBalance(address a) public view returns(uint){
    return a.balance;
}
}
