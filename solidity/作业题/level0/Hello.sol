// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
学习合约类型
*/
contract Hello {
    
    function sayHi() public {
        // 合约中的成员函数
    }

    // 可支付回退函数
    receive() external payable {
    }


    /**
        this 关键字与地址转换:
        说明: 在合约内部可以使用 this 关键字表示当前合约，并可以将其显式转换为 address 类型。
    */
    function getAddress() public view returns (address) {
        return address(this);
    }

    /**
      使用 selfdestruct 函数销毁合约，同时将合约中的以太币发送到指定地址
    */
    function destroyContract(address payable recipient) public {
        selfdestruct(recipient);  // 销毁合约并发送以太币
    }

    /**
    type(Hello).name: 获取合约的名字。
    type(Hello).creationCode: 获取创建合约的字节码。
    type(Hello).runtimeCode: 获取合约运行时的字节码。
    */
    // function getContractInfo() public pure returns (string memory, bytes memory, bytes memory) {
    //     return (type(Hello).name, type(Hello).creationCode, type(Hello).runtimeCode);
    // }

    /*
     通过 extcodesize 操作码判断一个地址是否为合约地址。
    */
    function isContract(address addr) internal view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(addr) }  // 获取地址的代码大小
        return size > 0;  // 大于 0 说明是合约地址
    }

}