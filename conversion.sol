// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Conversion {

    //uint = uint256 (0 - 2^256-1)
    uint number = 2;
    
    //Converter 32 bits pra 16 bits
    //Conversão para numeros menores perde os bits de maior ordem.
    uint32 a = 0x12345678;
    uint16 b = uint16(a); // b = 0x5678
    
    //16 pra 32
    //Conversão para ordem maior adiciona paddings bit a esquerda.
    uint16 c = 0x1234;
    uint32 d = uint32(c); // d = 0x0001234

    // What is cost?
    // conversar para bytes menores custa 
    bytes2 e = 0x1234;
    bytes1 f = bytes1(e); //f = 0x12
    
    bytes2 g = 0x1234;
    bytes4 h = bytes4(g); // h = 0x1234000


    //Conver Ether Units
    //Wei is the smallest denomination of ether

    function test() public {
        assert(10000000000000 wei == 1 ether);
        assert(1 wei == 1);
        assert(1 ether == 1e18);
        // 1 ether = 1e18 
    }

    function timeExercise() public {
        assert(1 minutes == 60 seconds);
        assert(60 minutes == 1 hours);
        assert(24 hours == 1440 minutes);
        assert(1 weeks == 7 days);

    }
    

}