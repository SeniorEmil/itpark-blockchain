pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract StoreQueue {

    string[] public queue = ["Emil", "Petr"];

    constructor() public {
        require(msg.pubkey() == tvm.pubkey(), 102);

        tvm.accept();
    }

    function addToQueue(string name) public {
		tvm.accept();
        queue.push(name);
	}

    function callTheNext() public {
		tvm.accept();
        delete queue[0];
	}

}
