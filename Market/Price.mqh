
// Author: Kolier.Li

#include "..\System.mqh"

/**
 * Price struct.
 */
struct Price
{
    ENUM_PRICE_TYPE type;
    double value;
    public:
        Price(ENUM_PRICE_TYPE i_type, double i_value): type(i_type), value(i_value) {}
};

// =============================================================================
// Price "i" functions

// -----------------------------------------------------------------------------
// Core Overload

double iClose(int shift = 0)
{
    return iClose(_Symbol, _Period, shift);
}

double iHigh(int shift = 0)
{
    return iHigh(_Symbol, _Period, shift);
}

double iLow(int shift = 0)
{
    return iLow(_Symbol, _Period, shift);
}

double iOpen(int shift = 0)
{
    return iOpen(_Symbol, _Period, shift);
}

// -----------------------------------------------------------------------------
// Extend

/**
 * Median price: (high + low) / 2.
 */
double iMedian(string sym, int tf, int shift)
{
    return (iHigh(sym, tf, shift) + iLow(sym, tf, shift)) / 2;
}

double iMedian(int shift = 0)
{
    return iMedian(_Symbol, _Period, shift);
}

/**
 * Typical price: (high + low + close) / 3.
 */
double iTypical(string sym, int tf, int shift)
{
    return (iHigh(sym, tf, shift) + iLow(sym, tf, shift) + iClose(sym, tf, shift)) / 3;
}

double iTypical(int shift = 0)
{
    return iTypical(_Symbol, _Period, shift);
}

/**
 * Weighted price: (high + low + close + close) / 4.
 */
double iWeighted(string sym, int tf, int shift)
{
    return (iHigh(sym, tf, shift) + iLow(sym, tf, shift) + iClose(sym, tf, shift) + iClose(sym, tf, shift)) / 4;
}

double iWeighted(int shift = 0)
{
    return iWeighted(_Symbol, _Period, shift);
}

/**
 * Price.
 */
double iPrice(ENUM_APPLIED_PRICE type, int shift = 0)
{
    return iPrice(type, _Symbol, _Period, shift);
}

double iPrice(ENUM_APPLIED_PRICE type, string sym, int tf, int shift)
{
    switch (type) {
        case PRICE_CLOSE:
            return iClose(sym, tf, shift);
            break;
        case PRICE_OPEN:
            return iOpen(sym, tf, shift);
            break;
        case PRICE_HIGH:
            return iHigh(sym, tf, shift);
            break;
        case PRICE_LOW:
            return iLow(sym, tf, shift);
            break;
        case PRICE_MEDIAN:
            return iMedian(sym, tf, shift);
            break;
        case PRICE_TYPICAL:
            return iTypical(sym, tf, shift);
            break;
        case PRICE_WEIGHTED:
            return iWeighted(sym, tf, shift);
            break;
    }
    
    return NULL;
}
