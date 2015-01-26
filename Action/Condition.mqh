
// Author: Kolier.Li

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

// =============================================================================
// Helper

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
