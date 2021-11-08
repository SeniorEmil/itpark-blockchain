pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "../AShoppingListDebot/AShoppingListDebot.sol";

contract ShoppingDebot is AShoppingListDebot {
    function _menu() internal override {
        string sep = '----------------------------------------';
        Menu.select(
            format(
                "You have {}/{}/{} (unpaid/paid/total) purchases",
                    m_shoppingSammari.unpaidCount,
                    m_shoppingSammari.paidCount,
                    m_shoppingSammari.paidCount + m_shoppingSammari.unpaidCount
            ),
            sep,
            [
                MenuItem("Show purchase list","",tvm.functionId(showPurchases)),
                MenuItem("Delete purchase","",tvm.functionId(deletePurchase)),
                MenuItem("Buy","",tvm.functionId(buy))
            ]
        );
    }

    /// @notice Returns Metadata about DeBot.
    function getDebotInfo() public functionID(0xDEB) override view returns(
        string name, string version, string publisher, string key, string author,
        address support, string hello, string language, string dabi, bytes icon
    ) {
        name = "Shopping DeBot";
        version = "1.0.0";
        publisher = "Emil Ibraimov";
        key = "Shopping list manager";
        author = "Emil Ibraimov";
        support = address(0);
        hello = "Hi, i'm a ShoppingList DeBot.";
        language = "en";
        dabi = m_debotAbi.get();
        icon = m_icon;
    }

}