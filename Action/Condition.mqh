
#include <Object.mqh>

/**
 * Condition abstract class.
 */
class Condition : public CObject
{
    public:
        bool on;
    public:
        Condition(void): on(false) {}
        Condition(bool i_on): on(i_on) {}
        ~Condition(void) {}
        virtual bool check(void) { return(on); }
};
