
// Author: Kolier.Li

/**
 * Print the whole array.
 */
void ArrayPrint(int &arr[])
{
    string output = "";
    for (int i = 0; i < ArraySize(arr); i++) {
        if (i == 0) {
            output = (string)arr[i];
        }
        else {
            output = StringConcatenate(output, ", ", IntegerToString(arr[i]));
        }
    }
    
    Print(output);
}
