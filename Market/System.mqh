
// Author: Kolier.Li

/**
 * Get the ticksize.
 */
int MarketDigits(string sym)
{
    return (int)MarketInfo(sym, MODE_DIGITS);
}

int MarketDigits(void)
{
    return (int)MarketInfo(_Symbol, MODE_DIGITS);
}

/**
 * Market Pips to Points.
 */
double MarketPipsToPoints(string sym, double pips)
{
    return MarketPipsFactor(sym) * pips;
}

double MarketPipsToPoints(double pips)
{
    return MarketPipsToPoints(_Symbol, pips);
}

/**
 * Get the pip factor of symbol.
 */
int MarketPipsFactor(string sym)
{
    int factor;
    int digits = MarketDigits(sym);
    double price = MarketInfo(sym, MODE_BID);
    
    if (price < 10) {
        factor = (int)MathPow(10, digits - 4);
    }
    else if (price > 10) {
        factor = (int)MathPow(10, digits - 2);  
    }
    
    return factor;
}

int MarketPipsFactor(void)
{
    return MarketPipsFactor(_Symbol);
}

/**
 * Get a Pip Value.
 */
double MarketPipValue(string sym, int pips = 1, double lots = 1)
{
    return MarketInfo(sym, MODE_TICKVALUE) * MarketPipsFactor(sym) * pips * lots;
}
