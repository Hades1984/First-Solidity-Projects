// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
contract etherprice {


    //Function to calculate value of ETH
function setamount(uint _Amount, uint _Price) public pure returns(uint){
    return _Amount*_Price;
}
}
