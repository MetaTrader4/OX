
/**
 * Task struct.
 */
struct Task
{
    string id;
    int type;
    string cmd;
    int status;
};

/**
 * Compare two tasks.
 */
bool TaskCompare(Task &task_a, Task &task_b)
{
    if (
        task_a.id == task_b.id
        && task_a.type == task_b.type
        && task_a.cmd == task_b.cmd
    ) {
        return TRUE;
    }
    return FALSE;
}
