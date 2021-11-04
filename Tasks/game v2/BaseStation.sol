pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObject.sol";
import "StationInterface.sol";

contract BaseStation is GameObject, StationInterface{

    mapping (address=>bool) militaryUnits;    
    constructor(uint _health, uint _protection) public {
        tvm.accept();
        setHealth(_health);
        setProtection(_protection);
    }

    function addMilitaryUnit(address _militaryUnit) virtual external override {
        tvm.accept();
        militaryUnits[_militaryUnit] = true;
    }

    function delMilitaryUnit(address _militaryUnit) virtual external override{
        require(militaryUnits.exists(_militaryUnit) == true, 103);
        tvm.accept();
        delete militaryUnits[_militaryUnit];
    }

    function selfDestruct(address dest) virtual external override {
            
    }



}