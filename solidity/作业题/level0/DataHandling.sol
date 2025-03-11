// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract DataHandling {
    uint[] public data;
    uint[] public dynamicArray;

    function updateData(uint[] memory newData) public {
        data = newData;
    }


    function getData() public view returns (uint[] memory) {
        return data;
    }

    function modifyStorageData(uint index, uint newValue) public {
        require(index < data.length, "index out of");
        data[index] = newValue;
    }

    function modifyMemoryData(uint index, uint[] memory memData) public pure returns (uint[] memory) {
        require(memData.length == 0, "memData is empty");
        memData[index] = 1;
        return memData;
    }


    function getArrayLength(uint[] memory memData) public pure returns (uint length) {
        length = memData.length;
        return length;
    }

    function popArray() public {
        require(data.length > 0, "data is empty");
        data.pop();
    }
}