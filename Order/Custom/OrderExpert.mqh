
#include "..\Order.mqh"

class OrderExpert : public Order
{
    public:
        OrderExpert(void): Order() {}
        OrderExpert(int i_ticket, int i_init): Order(i_ticket, i_init) {}
        ~OrderExpert() {}
        // Action
        void breakEven(double i_start, double i_add = 0);
        void trailStop(double i_start, double i_away, double i_move = 0);
};

/**
 * Stoploss BreakEven.
 *
 * @param i_start A profit value in points.
 */
void OrderExpert::breakEven(double i_start, double i_add)
{
    if (!select()) return;
    update();
    if (tmode == PEND) return;
    if (dtc > 0) return;
    if (profit_pts < i_start) return;
    
    // New Stoploss
    double psl_new = vTradePrice(po, i_add);
    if (psl_new > psl) {
        modifySL(psl_new);
    }
}

/**
 * Tailing Stoploss.
 */
void OrderExpert::trailStop(double i_start, double i_away, double i_move = 0)
{
    if (!select()) return;
    update();
    if (tmode == PEND) return;
    if (dtc > 0) return;
    if (profit_pts < i_start) return;

    // New Stoploss
    double psl_new = vTradePrice(ptc, i_away * (-1));
    if (
        psl == 0
        || (psl > 0 && psl_new - psl > i_move)
    ) {
        modifySL(psl_new);
    }
}
