
// Author: Kolier.Li

#include <Object.mqh>

/**
 * Used to destroy array of objects.
 */
int ArrayDestroy(CObject* &arr[])
{
    int cnt = 0;
    int size = ArraySize(arr);
    for (int i = 0; i < size; i++) {
        if (CheckPointer(arr[i]) == POINTER_DYNAMIC) {
            delete arr[i];
            cnt++;
        }
    }
    
    return cnt;
}
