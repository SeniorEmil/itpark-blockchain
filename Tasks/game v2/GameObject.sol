pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameInterface.sol";

contract GameObject is GameInterface{
    
    uint private attackDamage;
    uint private health;
    uint private protection;

    uint public msgPubkey;
    address public msgAddress;

    function takeAttack (uint _attackDamage) virtual external override{
        // require(health x> 0, 103);
        tvm.accept();
        msgAddress = msg.sender;
        if(_attackDamage < protection){
            setProtection(protection -= _attackDamage);
        }else{
            setHealth(health + (protection - _attackDamage));
            this.selfDestruct(msg.sender);
        }
    }
    
    function isLive() private returns (bool){
        tvm.accept();
        if(health > 0){
            return false;
        }else{
            return true;
        }
    }

    function selfDestruct(address dest) virtual external {
        tvm.accept();
        if (isLive()){
            dest.transfer(0, true, 160);
        }
    }

    function setAttackDamage(uint _attackDamage) virtual internal {
        tvm.accept();
        attackDamage = _attackDamage;
    }

    function setHealth(uint _health) virtual internal {
        tvm.accept();
        health = _health;
    }

    function setProtection(uint _protection) virtual internal {
        tvm.accept();
        protection = _protection;
    }

    function getAttackDamage() virtual internal view returns(uint){
        return attackDamage;
    }

    function getHealth() virtual external view returns(uint){
        return health;
    }

    function getProtection() virtual external view returns(uint){
        return protection;
    }

}