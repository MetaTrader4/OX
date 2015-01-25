
/**
 * Overload for OrderClose().
 */
bool OrderClose(int ticket)
{
    bool order_closed = FALSE;
    if (OrderSelect(ticket)) {
        switch (OrderType()) {
            case OP_BUY:
            case OP_SELL:
                order_closed = OrderClose(ticket, OrderLots(), OrderPrice(ticket), Input_Order_Slippage, clrWhite);
                break;
            case OP_BUYLIMIT:
            case OP_SELLLIMIT:
            case OP_BUYSTOP:
            case OP_SELLSTOP:
                order_closed = OrderDelete(ticket, clrWhite);
                break;
        }
    }
    
    return order_closed;
}
