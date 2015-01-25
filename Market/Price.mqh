
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
