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
                "You have {}/{}/{} (todo/done/total) purchases",
                    m_shoppingSammari.incompleteCount,
                    m_shoppingSammari.completeCount,
                    m_shoppingSammari.completeCount + m_shoppingSammari.incompleteCount
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