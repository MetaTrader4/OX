

/**
 * Run actions.
 */
void ActionsetExecute(Action* &actions[])
{
    int size = ArraySize(actions);
    for (int i = 0; i < size; i++) {
        if (actions[i].cond()) {
            actions[i].run();
        }
    }
}

/**
 * Check conditions.
 */
bool ConditionsetCheck(Condition* &conditions[], ENUM_OPERATOR_LOGICAL mode)
{
    bool ret = TRUE;
    switch (mode) {
        case AND:
            ret = TRUE;
            break;
        case OR:
            ret = FALSE;
            break;
    }
    int size = ArraySize(conditions);
    for (int i = 0; i < size; i++) {
        switch (mode) {
            case AND:
                if (!conditions[i].check()) {
                    return FALSE;
                }
                break;
            case OR:
                if (conditions[i].check()) {
                    return TRUE;
                }
                break;
        }
        
    }
    
    return ret;
}
