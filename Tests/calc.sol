pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

// This is class that describes you smart contract.
contract Calc {

    uint public result;

    constructor() public {
        require(tvm.pubkey() != 0, 101);

        require(msg.pubkey() == tvm.pubkey(), 102);

        tvm.accept();
    }

    function sum(uint a, uint b) public {

        tvm.accept();
        result = a + b;
    }

}