
#include "Task.mqh"
#include "TaskGV.mqh"
#include "..\System.mqh"
#include "..\Array\System.mqh"
#include "..\Data\GV.mqh"

// Manual, Knowledge, Experience.


// Type Registries.
// System: 0 ~ 
// Custom: Magic

class Worker : public CObject
{
    protected:
        int types[]; // Task types to work on.
    public:
        Worker(void) { ArrayResize(types, 0); }
        ~Worker(void) {}
        // Core
        int register(int i_task_type) { return ArrayAdd(types, i_task_type); }
        int unregister(int i_task_type) { ArrayRemove(types, i_task_type); return ArraySize(types); }
        // API
        virtual bool taskIsValid(Task &task);
        virtual void work(void);
        
        virtual int workTask(Task &task);
        
};

/**
 * Check if it's assigned task type.
 *
 * Allow override to use in special cases like apply sub types.
 */
bool Worker::taskIsValid(Task &task)
{
    return ArrayHas(types, task.type);
}

/**
 * Work.
 */
void Worker::work(void)
{
    string name;
    Task task;
    for (int i = 0; i < GlobalVariablesTotal(); i++) {
        name = GlobalVariableName(i);
        if (GVCheck(name)) {
            TaskGVParse(task, name);
        }
        workTask(task);
    }
}

/**
 * Work on a single task.
 */
int Worker::workTask(Task &task)
{
    switch (task.type) {
        case 0:
            break;
    }
    
    return 0;
}
