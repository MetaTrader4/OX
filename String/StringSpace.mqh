
// Author: Kolier.Li

/**
 * Fill string with empty space to the right.
 */
string StringSpace(string text, int size)
{
    string space;
    if (StringLen(text) < size) {
        StringInit(space, size - StringLen(text), ' ');
        text = StringConcatenate(text, space);
    }
    
    return text;
}
