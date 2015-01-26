
// Author: Kolier.Li

#include "ArrayDelete.mqh"

// Difference from ArrayDelete(): Remove the value by 'value' instead of 'index'.

/**
 * Remove all items contain the same value.
 */
void ArrayRemove(int &arr[], int value)
{
    int size = ArraySize(arr);
    for (int i = 0; i < size; i++) {
        if (arr[i] == value) {
            ArrayDelete(arr, i);
            // Loop once more to see.
            ArrayRemove(arr, value);
            break;
        }
    }
}
