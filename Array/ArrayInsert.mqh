
// Author: Kolier.Li

#include <Object.mqh>
#include "ArrayClone.mqh"


/**
 * Array Insert.
 *
 * @param index -1 for the end, normal index value.
 * @param mode 1 to after, -1 to before
 * @return Size of the result array.
 */
int ArrayInsert(int &arr[], int value, int index = -1, int mode = 1)
{
    int arr_tmp[];
    ArrayClone(arr_tmp, arr);
    int size = ArraySize(arr);
    int size_new = size + 1;
    // Negative index.
    if (index < 0) {
        index = size + index;
    }
    // Different modes.
    int size_pre = 0;
    if (mode == 1 && size > 0) {
        size_pre = index + 1;
    }
    else if (mode == -1 && size > 0) {
        size_pre = index;
    }
    ArrayResize(arr, size_new);
    for (int i = 0, j = 0; i < size_new; i++) {
        if (i != size_pre) {
            arr[i] = arr_tmp[j];
            j++;
        }
        else {
            arr[i] = value;
        }
    }
    
    return ArraySize(arr);
}

int ArrayInsert(double &arr[], double value, int index = -1, int mode = 1)
{
    double arr_tmp[];
    ArrayClone(arr_tmp, arr);
    int size = ArraySize(arr);
    int size_new = size + 1;
    // Negative index.
    if (index < 0) {
        index = size + index;
    }
    // Different modes.
    int size_pre = 0;
    if (mode == 1 && size > 0) {
        size_pre = index + 1;
    }
    else if (mode == -1 && size > 0) {
        size_pre = index;
    }
    ArrayResize(arr, size_new);
    for (int i = 0, j = 0; i < size_new; i++) {
        if (i != size_pre) {
            arr[i] = arr_tmp[j];
            j++;
        }
        else {
            arr[i] = value;
        }
    }
    
    return ArraySize(arr);
}

int ArrayInsert(string &arr[], string value, int index = -1, int mode = 1)
{
    string arr_tmp[];
    ArrayClone(arr_tmp, arr);
    int size = ArraySize(arr);
    int size_new = size + 1;
    // Negative index.
    if (index < 0) {
        index = size + index;
    }
    // Different modes.
    int size_pre = 0;
    if (mode == 1 && size > 0) {
        size_pre = index + 1;
    }
    else if (mode == -1 && size > 0) {
        size_pre = index;
    }
    ArrayResize(arr, size_new);
    for (int i = 0, j = 0; i < size_new; i++) {
        if (i != size_pre) {
            arr[i] = arr_tmp[j];
            j++;
        }
        else {
            arr[i] = value;
        }
    }
    
    return ArraySize(arr);
}

int ArrayInsert(CObject* &arr[], CObject* &value, int index = -1, int mode = 1)
{
    CObject* arr_tmp[];
    ArrayClone(arr_tmp, arr);
    int size = ArraySize(arr);
    int size_new = size + 1;
    // Negative index.
    if (index < 0) {
        index = size + index;
    }
    // Different modes.
    int size_pre = 0;
    if (mode == 1 && size > 0) {
        size_pre = index + 1;
    }
    else if (mode == -1 && size > 0) {
        size_pre = index;
    }
    ArrayResize(arr, size_new);
    for (int i = 0, j = 0; i < size_new; i++) {
        if (i != size_pre) {
            arr[i] = arr_tmp[j];
            j++;
        }
        else {
            arr[i] = value;
        }
    }
    
    return ArraySize(arr);
}
