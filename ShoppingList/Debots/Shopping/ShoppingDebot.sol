pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
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

}