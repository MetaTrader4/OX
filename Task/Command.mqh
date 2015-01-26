
// Author: Kolier.Li

#include "Task.mqh"
#include <Object.mqh>

// Way, method.

/**
 * Command abstract class.
 */
class Command : public CObject
{
    public:
        Task task;
    public:
        Command(void) {}
        Command(Task &i_task) {}
        ~Command(void) {}
        // API
        //virtual int Type(void);
        virtual bool parse(void) { return(FALSE); }
        virtual int run(void) { return(0); }        
};

class CommandOrderClose : public Command
{
    public:
        CommandOrderClose(void) {}
        ~CommandOrderClose(void) {}
        virtual double Type(void);
};
