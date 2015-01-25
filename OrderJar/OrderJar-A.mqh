
/**
 * Order jar class.
 */
class OrderJar : public CObject
{
    protected:
        int tickets[];
        Order* orders[];
        int total;
    public:
        OrderJar(void) { total = 0; }
        OrderJar(int &i_tickets[]) {
            total = ArrayClone(tickets, i_tickets);
            fillOrders();
        }
        OrderJar(Order* &i_orders[]) {
            total = ArrayClone(orders, i_orders);
            fillTickets();
        }
        ~OrderJar(void) {}
        // Value
        int getTotal(void) { return(total); };
        double totalProfit(void);
        // State
        // Action
        void fillTickets(void) { ArrayConvert(orders, tickets); };
        void fillOrders(void) { ArrayConvert(tickets, orders); };       
        int fetchTickets(int &o_tickets[]) { return ArrayClone(o_tickets, tickets); }
        int fetchOrders(Order* &o_orders[]) { return ArrayClone(o_orders, orders); }
        virtual int collect(void) { return(total); };
        int closeAll(void);
};

/**
 * Calculate the total profit.
 */
double OrderJar::totalProfit(void)
{
    if (total == 0) return(0);
    
    double profit = 0;
    for (int i = 0; i < total; i++) {
        profit += orders[i].vProfit();
    }
    
    return profit;
}

/**
 * Return closed orders number.
 */
int OrderJar::closeAll(void)
{
    if (total == 0) return(0);
    
    int closed_amount = 0;
    for (int i = 0; i < total; i++) {
        if (orders[i].close()) {
            closed_amount++;
        }
    }
    
    return closed_amount;
}
