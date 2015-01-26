
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
    return MathRound(lots / lotstep) * lotstep;
}

double OrderNormalizeLots(int ticket, double lots)
{
    string sym = OrderSymbol(ticket);
    if (sym) {
        return OrderNormalizeLots(sym, lots);
    }
    return lots;
}
