pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "../AShoppingListDebot/AShoppingListDebot.sol";
import "../../ShoppingList/ShoppingList.sol";

contract FillingShoppingListDebot is AShoppingListDebot {
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
                MenuItem("Add new purchase","",tvm.functionId(addPurchase)),
                MenuItem("Show purchase list","",tvm.functionId(showPurchases)),
                MenuItem("Delete purchase","",tvm.functionId(deletePurchase))
            ]
        );
    }
}