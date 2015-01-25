
#include "..\System.mqh"

/**
 * Global Variable name.
 */
string GVName(string name)
{
    string name_real = name;
    if (IsTesting()) {
        name_real = "(Test)" + name_real;
    }
    
    return name_real;
}

/**
 * Global Variable operation.
 */
double GV(string name, ENUM_DATA_CONTROL op = GET, double value = NULL)
{
    switch (op) {
        case GET:
            return GlobalVariableGet(name);
            break;
        case SET:
            GlobalVariableSet(name, value);
            return value;
            break;
        case DEL:
            GlobalVariableDel(name);
            break;
    }

    return value;
}

/**
 * Wrapper of GlobalVariableCheck(). 
 */
bool GVCheck(string name)
{
    return GlobalVariableCheck(name);
}

/**
 * Find GlobalVariable by partial name match, and return the first match.
 *
 * @todo More possibility.
 */
string GVFind(string match, int pos_start = 0, int pos_expected = 0)
{
    string name;
    for (int i = 0; i < GlobalVariablesTotal(); i++) {
        name = GlobalVariableName(i);
        if (StringFind(name, match, pos_start) == pos_expected) {
            return name;
        }
    }
    
    return NULL;
}
