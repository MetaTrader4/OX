
// =============================================================================
// Library Overload

int ArrayClone(Order* &arr_dest[], Order* &arr_src[])
{
    int size = ArraySize(arr_src);
    ArrayResize(arr_dest, size);
    return ArrayCopy(arr_dest, arr_src);
}

int ArrayConvert(int &arr_in[], Order* &arr_out[])
{
    int size = ArraySize(arr_in);
    ArrayResize(arr_out, size);
    for (int i = 0; i < size; i++) {
        arr_out[i] = new Order(arr_in[i]);
    }
    
    return size;
}

int ArrayConvert(Order* &arr_in[], int &arr_out[])
{
    int size = ArraySize(arr_in);
    ArrayResize(arr_out, size);
    for (int i = 0; i < size; i++) {
        if (CheckPointer(arr_in[i]) == POINTER_DYNAMIC) {
            arr_out[i] = arr_in[i].vTicket();
        }
    }
    
    return size;
}

int ArrayDestroy(Order* &arr[])
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

int ArrayInsert(Order* &arr[], Order* &value, int index = -1, int mode = 1)
{
    Order* arr_tmp[];
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
