// pragma ton-solidity >= 0.35.0;
// pragma AbiHeader expire;

// import "GameInterface.sol";

// contract GameObject is GameInterface {
//     uint static public protection;
//     uint public msgPubkey;

//     address msgAddress;

//     function takeAttack (GameInterface atackerAddress) public{
//         tvm.accept();
//         atackerAddress.takeAttack(this);
//         msgAddress = msg.sender;
//     }

//     constructor(uint _protection) public {
//         tvm.accept();
//         protection = _protection;

//     }
// }