
/**
 * Combine an array into string.
 */
string StringCombine(string &arr[], string glue)
{
    string output = NULL;
    for (int i = 0; i < ArraySize(arr); i++) {
        if (i == 0) {
            output = arr[i];
        }
        else {
            output = StringConcatenate(output, glue, arr[i]);
        }
    }
    
    return output;
}
