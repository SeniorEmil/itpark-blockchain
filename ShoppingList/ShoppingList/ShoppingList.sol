pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "../Interfaces/IShoppingList.sol";

contract ShoppingList is IShoppingList{
    /*
     * ERROR CODES
     * 100 - Unauthorized
     * 102 - task not found
     */

    modifier onlyOwner() {
        require(msg.pubkey() == m_ownerPubkey, 101);
        _;
    }

    uint32 m_count;

    mapping(uint32 => Purchase) m_purchases;

    uint256 m_ownerPubkey;

    constructor( uint256 pubkey) public {
        require(pubkey != 0, 120);
        tvm.accept();
        m_ownerPubkey = pubkey;
    }

    function addPurchase(string text, uint32 quantity) public override onlyOwner {
        tvm.accept();
        m_count++;
        m_purchases[m_count] = Purchase(m_count, text, quantity, now, false, 0);
    }

    function buy(uint32 id, uint32 cost) public override onlyOwner {
        optional(Purchase) purchase = m_purchases.fetch(id);
        require(purchase.hasValue(), 102);
        tvm.accept();
        Purchase thisPurchase = purchase.get();
        thisPurchase.isDone = true;
        thisPurchase.cost = cost;
        m_purchases[id] = thisPurchase;
    }

    function deletePurchase(uint32 id) public override onlyOwner {
        require(m_purchases.exists(id), 102);
        tvm.accept();
        delete m_purchases[id];
    }

    //
    // Get methods
    //

    function getPurchases() public override returns (Purchase[] purchases) {
        string text;
        uint32 quantity;
        uint64 createdAt;
        bool isDone;
        uint32 cost;

        for((uint32 id, Purchase purchase) : m_purchases) {
            text = purchase.text;
            quantity = purchase.quantity;
            isDone = purchase.isDone;
            createdAt = purchase.createdAt;
            cost = purchase.cost;
            purchases.push(Purchase(id, text, quantity, createdAt, isDone, cost));
       }
    }

    function getShoppingSammari() public override returns (ShoppingSammari shoppingSammari) {
        uint32 paidCount;
        uint32 unpaidCount;
        uint32 paymentAmount;

        for((, Purchase purchase) : m_purchases) {
            if  (purchase.isDone) {
                paidCount += purchase.quantity;
                paymentAmount += purchase.cost;
            } else {
                unpaidCount += purchase.quantity;
            }
        }
        shoppingSammari = ShoppingSammari( paidCount, unpaidCount, paymentAmount);
    }
}

