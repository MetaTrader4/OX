
// Author: Kolier.Li

/**
 * Get fractional part of a number.
 *
 * Need to normalize in order to avoid garage value, EMPTY_VALUE(2147483647).
 */
double MathFraction(double value, int digits = 10)
{
    return NormalizeDouble(value - MathFloor(value), digits);
}

/**
 * Digits number after decimal point.
 *
 * @issue Garbage at the end.
 */
int MathDigits(double value, int digits = 10)
{
    double fraction = MathFraction(value, digits);
    if (fraction == 0) return(0);

    int i;
    for (i = 0; i < EMPTY_VALUE; i++) {
        fraction *= 10;
        if (fraction == 0) {
            break;
        }
        else {
            fraction = MathFraction(fraction, digits);
        }
    }
    
    return i;
}

/**
 * Ascend all the fractional part into integer.
 */
int MathAscend(double value)
{
    return (int)(value * MathPow(10, MathDigits(value)));
}
