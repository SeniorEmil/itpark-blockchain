pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

interface StationInterface {
    function addMilitaryUnit(address _militaryUnit) virtual external;
    function delMilitaryUnit(address _militaryUnit) virtual external;
}