
// Author: Kolier.Li

#include "..\Order\System.mqh"
#include "..\Market\System.mqh"

// Normalize Symbol if needed.

/**
 * Normalize price value in order.
 */
double OrderNormalizePrice(string sym, double price)
{
    double ticksize = MarketInfo(sym, MODE_TICKSIZE);
    if (ticksize == 0) return(price);
    // Truncate the useless part.
    return MathRound(price / ticksize) * ticksize;
}

double OrderNormalizePrice(int ticket, double price)
{
    string sym = OrderSymbol(ticket);
    if (sym) {
        return OrderNormalizePrice(sym, price);
    }
    return price;
}

/**
 * Normalize lots value in order.
 */
double OrderNormalizeLots(string sym, double lots)
{
    double lotstep = MarketInfo(sym, MODE_LOTSTEP);
    if (lotstep == 0) return(lots); 
    double lots_now = MathRound(lots / lotstep) * lotstep;
    double lots_min = MarketInfo(Symbol(), MODE_MINLOT);
    double lots_max = MarketInfo(Symbol(), MODE_MAXLOT);
    if (lots_now < lots_min) {
        lots_now = lots_min;
    }
    if (lots_now > lots_max) {
        lots_now = lots_max;
    }
    
    return lots_now;
}

double OrderNormalizeLots(int ticket, double lots)
{
    string sym = OrderSymbol(ticket);
    if (sym) {
        return OrderNormalizeLots(sym, lots);
    }
    return lots;
}
