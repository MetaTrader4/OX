
// Author: Kolier.Li

#include "Task.mqh"
#include "Custom\TaskType.mqh"
#include "..\Data\GV.mqh"
#include "..\String\StringCombine.mqh"

// A Task Database system using MT4 GlobalVariable system.

/**
 * Helper function to generate GV name prefix.
 */
string TaskGVPrefix(int type, string id)
{
    string prefix = "CMD|" + TaskType(type) + "|" + id + "|";
    return GVName(prefix);
}

string TaskGVPrefix(int type)
{
    string prefix = "CMD|" + TaskType(type) + "|";
    return GVName(prefix);
}

/**
 * Parse task by name.
 */
bool TaskGVParse(Task &task, string name)
{
    if (GVCheck(name)) {
        string info[];
        StringSplit(name, '|', info);
        task.type = TaskType(info[1]);
        task.id = info[2];
        task.cmd = info[3];
        task.status = (int)GV(name);
    }
    
    return FALSE;
}

/**
 * Fetch a task by type and id.
 */
bool TaskGVFetch(Task &task, int type, string id)
{
    task.id = id;
    task.type = type;
    string name = GVFind(TaskGVPrefix(type, id));
   
    if (GVCheck(name)) {
        string info[];
        StringSplit(name, '|', info);
        task.cmd = info[3];
        task.status = (int)GV(name);
        return TRUE;
    }
    return FALSE;
}

/**
 * Fetch all tasks by type.
 */
bool TaskGVFetch(Task &tasks[], int type)
{
    return FALSE;
}

/**
 *  Add a new task.
 */
bool TaskGVAdd(int type, string id, string cmd, int status)
{
    string name = GVName(StringConcatenate("CMD|", TaskType(type), "|", id, "|", cmd));
    if (GV(name, SET, status) != NULL) {
        return TRUE;
    }
    
    return FALSE;
}

bool TaskGVAdd(Task &task)
{
    return TaskGVAdd(task.type, task.id, task.cmd, task.status);
}

/**
 * Delete the task.
 */
bool TaskGVRemove(int type, string id)
{
    string name = GVFind(TaskGVPrefix(type, id));
    if (GVCheck(name)) {
        return GV(name, DEL);
    }
    return FALSE;
}

bool TaskGVRemove(Task &task)
{
    return TaskGVRemove(task.type, task.id);
}

/**
 * Change cmd or status.
 */
bool TaskGVUpdate(int type, string id, string cmd, int status)
{
    string name = GVFind(TaskGVPrefix(type, id));
    if (GVCheck(name)) {
        Task task;
        TaskGVParse(task, name);
        // Check if cmd changes
        if (task.cmd != cmd) {
            GV(name, DEL);
            string name_new = GVName(StringConcatenate("CMD|", TaskType(type), "|", id, "|", cmd));
            if (GV(name_new, SET, status) != NULL) {
                return TRUE;
            }
        }
        else {
            if (task.status != (int)GV(name)) {
                GV(name, SET, status);
            }
        }
    }
    
    return FALSE;
}

bool TaskGVUpdate(Task &task)
{
    return TaskGVUpdate(task.type, task.id, task.cmd, task.status);
}
