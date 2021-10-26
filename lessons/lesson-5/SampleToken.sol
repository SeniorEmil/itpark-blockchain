pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract SampleToken {

    modifier checkOwnerAndAccept(uint tokenId) {
		// Check that message was signed with contracts key.
		require(msg.pubkey() == tokenToOwner[tokenId], 101);
		tvm.accept();
		_;
	}

    struct Token {
        string name;
        uint power;
    }

    Token [] tokensArr;
    mapping (uint=>uint) tokenToOwner;
    mapping (uint=>uint) tokenToPrice;

    function createToken(string name, uint power, uint price) public {
        tvm.accept();
        for(uint i=0; i < tokensArr.length; i++){
            if (tokensArr[i].name == name) {
                require;
            }
        }
        tokensArr.push(Token(name, power));
        uint keyAsLastNum = tokensArr.length - 1;
        tokenToOwner[keyAsLastNum] = msg.pubkey();
        tokenToPrice[keyAsLastNum] = price;
    }

    function getTokenOwner(uint tokenId) public view returns(uint) {
        return tokenToOwner[tokenId];
    }

    function getTokenInfo(uint tokenId) public view returns (string tokenName, uint tokenPower){
        tokenName = tokensArr[tokenId].name;
        tokenPower = tokensArr[tokenId].power;
    }

    function changePrice(uint tokenId, uint price) public checkOwnerAndAccept(tokenId) {
        tokenToPrice[tokenId] = price;     
    }

    function changePower(uint tokenId, uint power) public checkOwnerAndAccept(tokenId) {
        tokensArr[tokenId].power = power;     
    }

    constructor() public {
        
        require(tvm.pubkey() != 0, 101);

        require(msg.pubkey() == tvm.pubkey(), 102);

        tvm.accept();

    }

}
