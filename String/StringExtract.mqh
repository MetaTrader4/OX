
// Author: Kolier.Li

/**
 * Extract string part by prefix and suffix match.
 */
string StringExtract(string str, string prefix, string suffix)
{
    int pos_start = StringFind(str, prefix) + StringLen(prefix);
    int pos_end = StringFind(str, suffix) - pos_start;
    string result = StringSubstr(str, pos_start, pos_end);

    return result;
}
