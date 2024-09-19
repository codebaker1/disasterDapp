// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RegisterDisaster {
    address public owner;   // Owner of the contract

    // Struct to store personal information
    struct Person {
        string idCard;      // National ID
        string firstName;   // First name
        string lastName;    // Last name
        string addr;        // Address
    }

    Person[] private people; // Array to store people registered
    mapping(string => uint256) private idToIndex; // Map ID to index in the people array
    string[] private idList; // List to keep track of all IDs

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;  // Set the owner to the address deploying the contract
    }

    // Function to register a new person
    function registerPerson(
        string memory _idCard, 
        string memory _firstName, 
        string memory _lastName, 
        string memory _address
    ) public {
        // Add a new person to the array
        people.push(Person(_idCard, _firstName, _lastName, _address));

        // Store the index of the new person in the mapping
        idToIndex[_idCard] = people.length - 1;

        // Add the ID to the list of all IDs
        idList.push(_idCard);
    }

    // Function to get all registered people
    function getAll() public view returns (Person[] memory) {
    return people; // Return the array of registered people
}


    // Function to get a person by index
    function getPerson(uint256 index) public view returns (Person memory) {
        require(index < people.length, "Index out of bounds");
        return people[index];
    }

    // Function to get a person by their ID card
    function getID(string memory _idCard) public view returns (Person memory) {
    // Check if the person exists in the mapping
    require(idToIndex[_idCard] < people.length, "Person not found");

    uint256 index = idToIndex[_idCard];
    return people[index];
    }


}
