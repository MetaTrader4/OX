
#include <Object.mqh>
#include "..\Order\Order.mqh"
#include "..\Array\System.mqh"

/**
 * Order jar class.
 */
class OrderJar : public CObject
{
    protected:
        int tickets[];
        Order* orders[];
        int total;
        int info[3]; // 0 = OrdersTotal(), 1 = First Ticket, 2 = Last Ticket. For judging the status.
        bool is_built; // Flag to detect if orders[] was built.
    public:
        OrderJar(void) {
            total = 0;
            ArrayInitialize(info, 0);
            is_built = false;
        }
        ~OrderJar(void) { destroy(); }
        // Core
        virtual bool isValid(int i_ticket) { return(true); } // Test if the order belongs to this OrderJar.
        virtual int collect(void); // Collect order tickets.
        virtual bool needUpdate(void); // Check if need re-collect.
        virtual void build(void); // Build Order objects.
        virtual void destroy(void); // Destroy Order objects.
        int fetchOrders(Order* &o_orders[]); // Overload to fetch the wanted orders object array.
        virtual Order* fetchOrder(int i_idx); // Simple override is OK because when need use, the external will address the correct class.
        // Value
        int getTotal(void) { return(total); }
        double totalProfit(void);
        // State
        // Action
        int closeAll(void);
};

/**
 * Default method: collect(), collect all opening orders.
 */
int OrderJar::collect(void)
{
    ArrayResize(tickets, 0);
    ArrayInitialize(info, 0);
    total = 0;
    
    info[0] = OrdersTotal();
    for (int i = 0; i < OrdersTotal(); i++) {
        if (OrderSelect(i, SELECT_BY_POS) == false) continue;
        if (info[1] == 0) {
            info[1] = OrderTicket();
        }
        info[2] = OrderTicket();
        if (!isValid(OrderTicket())) continue; 
        
        if (!ArrayHas(tickets, OrderTicket())) {
            total = ArrayInsert(tickets, OrderTicket());
        }
    }
    // Always mark it not built after collection.
    is_built = false;
    
    return total;
}

/**
 * Default method: needUpdate(), check if need re-collect.
 */
bool OrderJar::needUpdate(void)
{
    if (
        info[0] == OrdersTotal()
        && info[1] == OrderTicket(0)
        && info[2] == OrderTicket(OrdersTotal() - 1)
    ) {
        return false;
    }
    return true;
}

/**
 * Default method: build(), build orders object.
 */
void OrderJar::build(void)
{
    if (is_built) return;
    
    int size = ArrayConvert(tickets, orders);
    // Successfully built.
    if (size == total) {
        is_built = true;
    }
}

/**
 * Default method: destroy(), delete orders object.
 */
void OrderJar::destroy(void)
{
    ArrayDestroy(orders);
}

/**
 * Fetch orders object array.
 */
int OrderJar::fetchOrders(Order* &o_orders[])
{
    build();
    return ArrayClone(o_orders, orders); 
}

/**
 * Fetch a single order object.
 */
Order* OrderJar::fetchOrder(int i_idx)
{
    build();
    return(GetPointer(orders[i_idx]));
}

/**
 * Calculate the total profit.
 */
double OrderJar::totalProfit(void)
{
    if (total == 0) return(0);
    build();
    
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
    build();
    
    int closed_amount = 0;
    for (int i = 0; i < total; i++) {
        if (orders[i].close()) {
            closed_amount++;
        }
    }
    
    return closed_amount;
}
