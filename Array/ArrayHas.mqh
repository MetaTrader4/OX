
// Author: Kolier.Li

/**
 * Check if array has the specific value.
 */
bool ArrayHas(int &arr[], int value)
{
    for (int i = 0; i < ArraySize(arr); i++) {
        if (arr[i] == value) {
            return true;
        }
    }
    return false;
}

bool ArrayHas(double &arr[], double value)
{
    for (int i = 0; i < ArraySize(arr); i++) {
        if (arr[i] == value) {
            return true;
        }
    }
    return false;
}

bool ArrayHas(string &arr[], string value)
{
    for (int i = 0; i < ArraySize(arr); i++) {
        if (arr[i] == value) {
            return true;
        }
    }
    return false;
}
