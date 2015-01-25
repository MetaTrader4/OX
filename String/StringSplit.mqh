
/**
 * StringSplit overloads.
 */
int StringSplit(const string string_value, const ushort separator, int &result[])
{
    string result_tmp[];
    int size = StringSplit(string_value, separator, result_tmp);
    ArrayConvert(result_tmp, result);
    
    return size;
}

int StringSplit(const string string_value, const ushort separator, double &result[])
{
    string result_tmp[];
    int size = StringSplit(string_value, separator, result_tmp);
    ArrayConvert(result_tmp, result);
    
    return size;
}
