pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "MilitaryUnit.sol";

contract Archer is MilitaryUnit{
    
    uint static public warriorNumber;

    constructor(uint _attackDamage, uint _protection,  uint _health) public {
        tvm.accept();
        
        setAttackDamage(_attackDamage);
        setProtection(_protection);
        setHealth(_health);
    }

}