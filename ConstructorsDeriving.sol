// SPDX-License-Identifier: GPL-3.0
/* O construtor é executado apenas uma vez e inicializa
 as variaveis de estado do contrato → */

pragma solidity >= 0.7.1 < 0.9.0;

contract Member {
    string name;
    
    constructor(string memory _name) {
        name = _name;
    }
}

contract Teacher is Member {
    
    // Passando pro construtor de Member
    constructor(string memory _n) Member(_n) public {}
    
    function getName() public view returns(string memory) {
        return name;
    }
    
}

// // Deriving the contract
// contract Teacher is Member ('Rachel') {
    
//     function getName() public view returns(string memory) {
//         return name;
//     }
    
// }