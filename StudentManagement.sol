// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentManagement {

    struct Student {
        uint id;
        string name;
        uint age;
        string department;
        bool exists;
    }

    // studentId => Student
    mapping(uint => Student) public students;

    // Add a new student
    function addStudent(
        uint _id,
        string memory _name,
        uint _age,
        string memory _department
    ) public {

        require(!students[_id].exists, "Student already exists!");

        students[_id] = Student({
            id: _id,
            name: _name,
            age: _age,
            department: _department,
            exists: true
        });
    }

    // Update student info
    function updateStudent(
        uint _id,
        string memory _name,
        uint _age,
        string memory _department
    ) public {

        require(students[_id].exists, "Student not found!");

        students[_id].name = _name;
        students[_id].age = _age;
        students[_id].department = _department;
    }

    // Retrieve student data
    function getStudent(uint _id)
        public
        view
        returns (uint, string memory, uint, string memory)
    {
        require(students[_id].exists, "Student not found!");

        Student memory s = students[_id];
        return (s.id, s.name, s.age, s.department);
    }
}
