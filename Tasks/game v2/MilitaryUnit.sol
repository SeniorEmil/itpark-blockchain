pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "StationInterface.sol";
import "GameObject.sol";

contract MilitaryUnit is GameObject{
    
    // uint private attackDamage;
    // uint private health;
    // uint private protection;

    // uint public msgPubkey;
    // address public msgAddress;

    function attack (GameInterface attackedAddress) virtual external{
        tvm.accept();
        attackedAddress.takeAttack(getAttackDamage());
    }

    function selfDestruct(address dest) virtual external override {
        
    }

}