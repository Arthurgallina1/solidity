pragma solidity >=0.7.0<0.9.0;


library Search {
    function indexOf(uint[] storage self, uint value) public view returns (uint) {
        for(uint i = 0; i<self.length ; i++) {
            if(self[i] == value) {
                return i;
            }
        }
    }
}

contract Test {
    uint[] data;
    constructor() {
        for(uint i = 0; i < 5 ; i++) {
            data.push(i);
        }
    }   
    
    function isValuePresent(uint val) external view returns (uint) {
        uint index = Search.indexOf(data, val);
        return index;
    }

}