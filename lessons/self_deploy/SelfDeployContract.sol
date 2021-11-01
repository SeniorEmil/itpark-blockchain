pragma ton-solidity >=0.32.0;
pragma AbiHeader expire;

// This sample shows how the contract can deploy another contract of the same type

contract SelfDeployer {

    uint static public m_value;
    address static public m_parent;

    uint public m_depth;
    mapping(address => bool) public m_chilred;

    constructor(uint _depth) public {
        require(
            (tvm.pubkey() != 0 && tvm.pubkey() == msg.pubkey()) ||
            (msg.sender == m_parent)
        );
        tvm.accept();
        m_depth = _depth;
    }

    modifier onlyOwner {
        require(tvm.pubkey() != 0 && tvm.pubkey() == msg.pubkey());
        tvm.accept();
        _;
    }

    function changeValue(uint _value) onlyOwner public{
        m_value = _value;
    }

    function deploy(uint _value) onlyOwner public returns (address addr) {
        TvmCell code = tvm.code();
        addr = new SelfDeployer{
            value: 2 ton,
            code: code,
            varInit: {
                m_value: _value,
                m_parent: address(this)
            }
        }(m_depth + 1);
        m_chilred[addr] = true;
    }
}