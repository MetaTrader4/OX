
#include <Object.mqh>
#include "ArrayClone.mqh"

/**
 * Array Delete.
 *
 * @return The deleted value.
 */
int ArrayDelete(int &arr[], int index)
{
    int arr_tmp[];
    ArrayClone(arr_tmp, arr);
    int size = ArraySize(arr);
    // Error
    if (size < 1) return(NULL);
    
    // Negative index.
    if (index < 0) {
        index = size + index;
    }
    int size_new = size - 1;
    ArrayResize(arr, size_new);
    for (int i = 0, j = 0; i < size; i++) {
        if (i != index) {
            arr[j] = arr_tmp[i];
            j++;
        }
    }
    
    return arr_tmp[index];
}

double ArrayDelete(double &arr[], int index)
{
    double arr_tmp[];
    ArrayClone(arr_tmp, arr);
    int size = ArraySize(arr);
    // Error
    if (size < 1) return(NULL);
    
    // Negative index.
    if (index < 0) {
        index = size + index;
    }
    int size_new = size - 1;
    ArrayResize(arr, size_new);
    for (int i = 0, j = 0; i < size; i++) {
        if (i != index) {
            arr[j] = arr_tmp[i];
            j++;
        }
    }
    
    return arr_tmp[index];
}

string ArrayDelete(string &arr[], int index)
{
    string arr_tmp[];
    ArrayClone(arr_tmp, arr);
    int size = ArraySize(arr);
    // Error
    if (size < 1) return(NULL);
    
    // Negative index.
    if (index < 0) {
        index = size + index;
    }
    int size_new = size - 1;
    ArrayResize(arr, size_new);
    for (int i = 0, j = 0; i < size; i++) {
        if (i != index) {
            arr[j] = arr_tmp[i];
            j++;
        }
    }
    
    return arr_tmp[index];
}

CObject* ArrayDelete(CObject* &arr[], int index)
{
    CObject* arr_tmp[];
    ArrayClone(arr_tmp, arr);
    int size = ArraySize(arr);
    // Error
    if (size < 1) return(NULL);
    
    // Negative index.
    if (index < 0) {
        index = size + index;
    }
    int size_new = size - 1;
    ArrayResize(arr, size_new);
    for (int i = 0, j = 0; i < size; i++) {
        if (i != index) {
            arr[j] = arr_tmp[i];
            j++;
        }
    }
    
    return arr_tmp[index];
}
