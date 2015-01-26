
// Author: Kolier.Li

/**
 * Condition abstract class.
 */
struct Cond
{
    public:
        bool on;
    public:
        Cond(void): on(false) {} // Default off
        Cond(bool i_on): on(i_on) {}
        ~Cond(void) {}
        //
        bool isOn(void) { return(on); } // Check if this condition is On.
        bool check(void) { return(isOn()); } // Simple wrap isOn().
};
