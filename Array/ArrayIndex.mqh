
// Author: Kolier.Li

int ArrayIndex(int &arr[], int value, int offset = 0)
{
    for (int i = offset; i < ArraySize(arr); i++) {
        if (arr[i] == value) {
            return i;
        }
    }
    return EMPTY_VALUE;
}

int ArrayIndex(string &arr[], string value, int offset = 0)
{
    for (int i = offset; i < ArraySize(arr); i++) {
        if (arr[i] == value) {
            return i;
        }
    }
    return EMPTY_VALUE;
}
