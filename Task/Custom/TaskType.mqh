
// Expert must implement a proper function by its own need.

enum ENUM_TASK_TYPE
{
    TASK_ORDER_CLOSE
};

/**
 * A callback function to return the Task type.
 */
string TaskType(int type)
{
    switch (type) {
        case 0:
            return "";
    }
    
    return NULL;
}

int TaskType(string type)
{
    if (type == "") return(0);
    
    return NULL;
}
