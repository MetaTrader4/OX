
// Author: Kolier.Li

/**
 * Array Clone.
 */
int ArrayClone(int &arr_dest[], int &arr_src[])
{
    int size = ArraySize(arr_src);
    // No item in source array.
    if (size == 0) return(0);
    
    ArrayResize(arr_dest, size);
    return ArrayCopy(arr_dest, arr_src);
}

int ArrayClone(double &arr_dest[], double &arr_src[])
{
    int size = ArraySize(arr_src);
    // No item in source array.
    if (size == 0) return(0);
    
    ArrayResize(arr_dest, size);
    return ArrayCopy(arr_dest, arr_src);
}

int ArrayClone(string &arr_dest[], string &arr_src[])
{
    int size = ArraySize(arr_src);
    // No item in source array.
    if (size == 0) return(0);
    
    ArrayResize(arr_dest, size);
    return ArrayCopy(arr_dest, arr_src);
}

int ArrayClone(CObject* &arr_dest[], CObject* &arr_src[])
{
    int size = ArraySize(arr_src);
    // No item in source array.
    if (size == 0) return(0);
    
    ArrayResize(arr_dest, size);
    return ArrayCopy(arr_dest, arr_src);
}
