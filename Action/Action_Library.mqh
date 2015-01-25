
int ArrayClone(Action* &arr_dest[], Action* &arr_src[])
{
    int size = ArraySize(arr_src);
    ArrayResize(arr_dest, size);
    return ArrayCopy(arr_dest, arr_src);
}

int ArrayDestroy(Action* &arr[])
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

int ArrayInsert(Action* &arr[], Action* &value, int index = -1, int mode = 1)
{
    Action* arr_tmp[];
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
        if (i < size_pre) {
            arr[i] = arr_tmp[j];
            j++;
        }
        else if (i > size_pre) {
            arr[i] = arr_tmp[j];
            j++;
        }
        else {
            arr[i] = value;
        }
    }
    
    return ArraySize(arr);
}
