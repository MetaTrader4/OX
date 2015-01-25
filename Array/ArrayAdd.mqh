
#include "ArrayHas.mqh"
#include "ArrayInsert.mqh"

/**
 * Unique insert to the end of array.
 */
int ArrayAdd(int &arr[], int value)
{
    if (!ArrayHas(arr, value)) {
        return ArrayInsert(arr, value);
    }
    return NULL;
}

int ArrayAdd(double &arr[], double value)
{
    if (!ArrayHas(arr, value)) {
        return ArrayInsert(arr, value);
    }
    return NULL;
}

int ArrayAdd(string &arr[], string value)
{
    if (!ArrayHas(arr, value)) {
        return ArrayInsert(arr, value);
    }
    return NULL;
}
