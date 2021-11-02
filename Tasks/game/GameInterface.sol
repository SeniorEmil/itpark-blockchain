pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

interface GameInterface {
    
    function takeAttack (uint attackDamage) external;
}