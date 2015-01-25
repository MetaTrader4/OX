
/**
 * Orders belond to this Expert
 */
class OrderJarExpert : public OrderJar
{
    public:
        OrderJarExpert(void) {}
        ~OrderJarExpert(void) {}
        int collect(void) {
            total = 0;
            ArrayResize(tickets, 0);
            ArrayResize(orders, 0); // @question If need to delete the object pionter first?
            for (int i = 0; i < OrdersTotal(); i++) {
                if (OrderSelect(i, SELECT_BY_POS) == FALSE) continue;
                if (OrderSymbol() != _Symbol) continue;
                if (OrderMagicNumber() != Input_Order_Magic) continue;
                
                total = ArrayInsert(tickets, OrderTicket());
            }
            if (total > 0) {
                fillOrders();
            }
            
            return total;
        }
};
