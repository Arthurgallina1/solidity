pragma solidity >=0.7.0 <0.9.0;


contract MyContract {
    // Mappings
    mapping(uint => string) public names;
    mapping(uint => Book) public books;

    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Carl";
    }

    function addBook(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }
    
    
    //nested mapping
    //Creating ownership (via address) to a Book
    mapping(address => mapping(uint => Book)) public myBooks;
    
     function addMyBook(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
    
}