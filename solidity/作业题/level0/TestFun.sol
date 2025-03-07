// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
   学习函数类型
*/
contract TestFun {

    // 状态变量，用于存储函数选择器
    bytes4 public storedSelector;

    // 函数：计算输入值的平方
    function square(uint x) public pure returns (uint) {
        return x * x;
    }

    // 函数：计算输入值的两倍
    function double(uint x) public pure returns (uint) {
        return 2 * x;
    }

    

    // 函数：根据传入的选择器动态调用 square 或 double 函数
    function executeFunction(bytes4 selector, uint x) public returns (uint) {
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
        require(success, "Function call failed");
        return abi.decode(data, (uint));
    }

    // 函数：存储选择器到状态变量 storedSelector 中
    function storeSelector(bytes4 selector) public {
        storedSelector = selector;
    }

    // 函数：调用存储在 storedSelector 中的函数，并返回结果
    function executeStoredFunction(uint x) public returns (uint) {
        require(storedSelector != bytes4(0), "Selector not set");
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(storedSelector, x));
        require(success, "Function call failed");
        return abi.decode(data, (uint));
    }

     function getSelectorSquare() external pure returns (bytes4) {
        return this.square.selector; // 返回函数square的选择器
    }

    function getSelectorDouble() external pure returns (bytes4) {
        return this.double.selector; // 返回函数double的选择器
    }
    

    function getStoredSelector() external returns (bytes4) {
        return storedSelector; // 返回存储在成员变量中的函数选择器
    }
    
}