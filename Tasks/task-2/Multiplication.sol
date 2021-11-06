pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract Multiplication {

	// State variable storing the sum of arguments that were passed to function 'add',
	uint public multiply = 1;

	constructor() public {
		// check that contract's public key is set
		require(tvm.pubkey() != 0, 101);
		// Check that message has signature (msg.pubkey() is not zero) and message is signed with the owner's private key
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
	}

	// Modifier that allows to accept some external messages
	modifier checkOwnerAndAccept {
		// Check that message was signed with contracts key.
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
		_;
	}

	function sendValue(address dest, uint128 amount, bool bounce) public view {
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        // It allows to make a transfer with arbitrary settings
        dest.transfer(amount, bounce, 0);
    }

	// Function that adds its argument to the state variable.
	function add(uint value) public checkOwnerAndAccept {
		tvm.accept();
		if ( value>=1 && value<=10 ){
			multiply *= value;
		}else{
			require;
		}
	}
}