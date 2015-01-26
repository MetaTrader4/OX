
// Author: Kolier.Li

/**
 * Array conversion.
 */
int ArrayConvert(string &arr_in[], int &arr_out[])
{
    int size = ArraySize(arr_in);
    ArrayResize(arr_out, size);
    for (int i = 0; i < size; i++) {
        arr_out[i] = (int)StringToInteger(arr_in[i]);
    }
    
    return size;
}

int ArrayConvert(string &arr_in[], double &arr_out[])
{
    int size = ArraySize(arr_in);
    ArrayResize(arr_out, size);
    for (int i = 0; i < size; i++) {
        arr_out[i] = StringToDouble(arr_in[i]);
    }
    
    return size;
}
