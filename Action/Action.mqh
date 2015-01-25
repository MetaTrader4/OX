
#include <Object.mqh>

/**
 * Action abstract class.
 */
class Action : public CObject
{
    public:
        bool on;
    public:
        Action(void): on(false) {}
        Action(bool i_on): on(i_on) {}
        ~Action(void) {}
        virtual bool cond(void) { return(on); }
        virtual int run(void) { return(0); }
};
