// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStorage {
    struct DataObject {
        string city;
        string country;
        string reason;
        uint256 voteCount;
    }

    DataObject[] public dataObjects;

    event DataObjectAdded(
        string city,
        string country,
        string reason,
        uint256 voteCount
    );

    function addDataObject(
        string memory _city,
        string memory _country,
        string memory _reason
    ) public {
        DataObject memory newObject = DataObject({
            city: _city,
            country: _country,
            reason: _reason,
            voteCount: 0
        });
        dataObjects.push(newObject);
        emit DataObjectAdded(_city, _country, _reason, 0);
    }

    function vote(uint256 index) public {
        require(index < dataObjects.length, "Invalid index");
        dataObjects[index].voteCount++;
    }
}
