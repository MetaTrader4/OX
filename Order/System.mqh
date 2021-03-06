
// Author: Kolier.Li

#include "..\System.mqh"

// =============================================================================
// System Overload

/**
 * Overload for OrderSelect() is forbidden.
 *
 * @wait Wait to see if the overload situation would change.
 */
bool OrderSelectA(int ticket)
{
    return OrderSelect(ticket, SELECT_BY_TICKET);
}

/**
 * Overload: OrderTicket().
 *
 * Get order ticket directly by input position information.
 */
int OrderTicket(int pos, int pool = MODE_TRADES)
{
    if (OrderSelect(pos, SELECT_BY_POS, pool)) {
        return OrderTicket();
    }
    return NULL;
}

/**
 * Overload: OrderSymbol().
 */
string OrderSymbol(int ticket)
{
    if (OrderSelectA(ticket)) {
        return OrderSymbol();
    }
    return NULL;
}

/**
 * Overload: OrderLots().
 */
double OrderLots(int ticket)
{
    if (OrderSelectA(ticket)) {
        return OrderLots();
    }
    return NULL;
}

/**
 * Overload: OrderCloseTime().
 */
datetime OrderCloseTime(int ticket)
{
    if (OrderSelectA(ticket)) {
        return OrderCloseTime();
    }
    return NULL;
}

// =============================================================================
// Extend

/**
 * Get corresponding trade dir.
 */
ENUM_TRADE_DIR OrderTradeDir(int value, bool is_ticket = TRUE)
{
    ENUM_TRADE_DIR dir = NULL;
    if (is_ticket) {
        if (OrderSelectA(value)) {
            value = OrderType();
        }
    }
    switch (value) {
        case OP_BUY:
        case OP_BUYLIMIT:
        case OP_BUYSTOP:
            dir = LONG;
            break;
        case OP_SELL:
        case OP_SELLLIMIT:
        case OP_SELLSTOP:
            dir = SHORT;
            break;
    }
    
    return dir;
}

/**
 * Get the trade mode of order.
 */
ENUM_TRADE_MODE OrderTradeMode(int value, bool is_ticket = TRUE)
{
    ENUM_TRADE_MODE mode = NULL;
    if (is_ticket) {
        if (OrderSelectA(value)) {
            value = OrderType();
        }
    }
    switch (value) {
        case OP_BUY:
        case OP_SELL:
            mode = MARKET;
            break;
        case OP_BUYLIMIT:
        case OP_BUYSTOP:
        case OP_SELLLIMIT:
        case OP_SELLSTOP:
            mode = PEND;
            break;
    }
    
    return mode;
}

/**
 * Get Order open cmd from dir.
 */
int OrderCmd(string sym, ENUM_TRADE_DIR dir, double po)
{
    int cmd = -1;
    double price = OrderPrice(sym, dir, 1);
    double spread = MarketInfo(sym, MODE_SPREAD) * MarketInfo(sym, MODE_TICKSIZE);
    if (dir == LONG) {
        if (MathAbs(po - price) <= spread) {
            cmd = OP_BUY;
        }
        else {
            if (po > price) {
                cmd = OP_BUYSTOP;
            }
            else {
                cmd = OP_BUYLIMIT;
            }
        }
    }
    else if (dir == SHORT) {
        if (MathAbs(po - price) <= spread) {
            cmd = OP_SELL;
        }
        else {
            if (po < price) {
                cmd = OP_SELLSTOP;
            }
            else {
                cmd = OP_SELLLIMIT;
            }
        }
    }
    
    return cmd;
}

/**
 * Get the corresponding price.
 *
 * @param mode -1 = price to close, 1 = price to open.
 */
double OrderPrice(string sym, ENUM_TRADE_DIR dir, int mode = -1)
{
    double price = NULL;
    double pask = MarketInfo(sym, MODE_ASK);
    double pbid = MarketInfo(sym, MODE_BID);
    if (dir == LONG) {
        price = (mode == -1) ? pbid : pask;
    }
    else if (dir == SHORT) {
        price = (mode == -1) ? pask : pbid;
    }
    
    return price;
}

double OrderPrice(int ticket, int mode = -1)
{
    double price = NULL;
    if (OrderSelectA(ticket)) {
        price = OrderPrice(OrderSymbol(), OrderTradeDir(ticket), mode);
    }
    
    return price;
}

/**
 * Allowed lots digits for order.
 */
int OrderLotsDigits(string sym)
{
    double lots_step = MarketInfo(sym, MODE_LOTSTEP);
    int lots_digits = 0;
    
    for (int i = 1; i <= 10; i++) {
        if (lots_step * MathPow(10, i) >= 1.0) {
            lots_digits = i;
            break;
        }
    }

    return lots_digits;
}
