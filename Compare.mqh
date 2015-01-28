
// Author: Kolier.Li

#include "System.mqh"
#include "Math\System.mqh"

/**
 * Variable comparison.
 */
bool Compare(double val1, double val2, int digits, ENUM_OPERATOR_COMPARISON op = EQUAL)
{
    val1 = NormalizeDouble(val1, digits);
    val2 = NormalizeDouble(val2, digits);
    
    switch (op) {
        case EQUAL:
            if (val1 == val2) return(true);
            break;
        //case IDENTICAL:
        //    if (val1 === val2) return(true);
        //    break;
        case NOT_EQUAL:
            if (val1 != val2) return(true);
            break;
        //case NOT_IDENTICAL:
        //    if (val1 !== val2) return(true);
        //    break;
        case LESS_THAN:
            if (val1 < val2) return(true);
            break;
        case GREATER_THAN:
            if (val1 > val2) return(true);
            break;
        case LESS_THAN_OR_EQUAL_TO:
            if (val1 <= val2) return(true);
            break;
        case GREATER_THAN_OR_EQUAL_TO:
            if (val1 >= val2) return(true);
            break;
    }
    
    return false;
}
