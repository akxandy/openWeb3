// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
  映射类型
*/
contract TestMapping {

    mapping(string=> string) public idToNameMap;
    mapping(address => uint) public points;
    address[] users;



    function addUser(address _user) public {
        require(points[_user] == 0, "user exist");
        points[_user] = 100;
        users.push(_user);
    }

    function getAllUsers() public view returns (address[] memory) {
        return users;
    }

    function transferPoints(address _to, uint _amount) public {
        require(points[msg.sender] >= _amount, "Insufficient points.");
        points[msg.sender] -= _amount;
        points[_to] += _amount;
    }
    
}