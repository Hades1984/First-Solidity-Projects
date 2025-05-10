// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
contract demographic {
    uint internal age;
    uint internal social_security;
    string internal name;
    //Function to set age
    function setage(uint _age) public returns (uint) {
        return age = _age;
    }
    //Function to set social security number
    function setsocial(uint _social) public returns (uint) {
        return social_security = _social;
    }
    //Function to set social security number
    function setname(string memory _name) public returns (string memory) {
        return name = _name;
    }
//function to show output
    function showoutput() public view returns(uint,uint,string memory){
        return(age,social_security,name);
    }
}
