
#include <Object.mqh>

/**
 * Prepare an array in some situation, to avoid memory issue.
 *
 * It's a temporary soultion for the MQL4 garbage collection lagging.
 */
void ArrayPrepare(int &arr[])
{
    ArrayResize(arr, 0);
}

void ArrayPrepare(double &arr[])
{
    ArrayResize(arr, 0);
}

void ArrayPrepare(string &arr[])
{
    ArrayResize(arr, 0);
}

void ArrayPrepare(CObject &arr[])
{
    ArrayResize(arr, 0);
}
