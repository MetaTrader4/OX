
#include "..\System.mqh"

/**
 * A relative trade price formula.
 */
double TradePrice(double base, ENUM_TRADE_DIR dir, double modifier)
{
    double price = NULL;
    if (dir == LONG) {
        price = base + modifier;
    }
    else if (dir == SHORT) {
        price = base - modifier;
    }
    
    return price;
}
