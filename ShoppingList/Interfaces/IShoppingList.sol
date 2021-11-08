pragma ton-solidity >=0.40.0;

struct Purchase {
        uint32 id;
        string text;
        uint32 quantity;
        uint64 createdAt;
        bool isDone;
        uint32 cost;
}

struct ShoppingSammari {
    uint32 completeCount;
    uint32 incompleteCount;
    uint32 paymentAmount;
}

interface IShoppingList {
   function addPurchase(string text, uint32 quantity) external;
   function buy(uint32 id, uint32 cost) external;
   function deletePurchase(uint32 id) external;
   function getPurchases() external returns (Purchase[] purchase);
   function getShoppingSammari() external returns (ShoppingSammari);
}

interface IMsig {
   function sendTransaction(address dest, uint128 value, bool bounce, uint8 flags, TvmCell payload  ) external;
}