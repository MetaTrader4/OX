
// Author: Kolier.Li

#include "..\System.mqh"
#include "..\Trade\System.mqh"
#include <Object.mqh>
#include "System.mqh"
#include "OrderNormalize.mqh"

/**
 * Order class.
 */
class Order : public CObject
{
    protected:
        int ticket;
    public:
        // Value
        int      cmd;    // OP_* OrderType()
        int      magic;  // Magic Number
        double   lots;   // Lots
        double   profit; // Profit in currency
        double   commn;  // Commission
        double   swap;   // Swap
        double   po;     // Open Price
        double   psl;    // StopLoss Price
        double   ptp;    // TakeProfit Price
        double   pc;     // Open Price
        datetime dte;    // Expiration, 0
        datetime dto;    // Open time
        datetime dtc;    // Close time, 0 if opening, > 0 for closed
        string   sym;    // Symbol()
        string   cmt;    // NULL/""
        // Value Extend
        ENUM_TRADE_DIR  tdir;       // Trade direction
        ENUM_TRADE_MODE tmode;      // Trade mode
        double          pto;        // Price to Open
        double          ptc;        // Price to Close
        double          profit_pts; // Profit in points
        // Info
        datetime dt_update; // Last update datetime.
        // Settings
        color clr_mod;   // Color for modify.
        color clr_close; // Color for close.
        int   slippage;  // Order operation slippage.        
    public:
        // Core
        Order(void): ticket(NULL) {}
        Order(const int i_ticket, bool i_init = FALSE): ticket(i_ticket) {
            clr_mod = clrNONE;
            clr_close = clrWhite;
            slippage = 3;
            if (i_init) update();
        }
        ~Order(void) {}
        // Value
        int vTicket(void) { return ticket; }
        int vType(void) { select(); return cmd = OrderType(); }
        int vMagicNumber(void) { return magic; }
        datetime vExpiration(void) { select(); return dte = OrderExpiration(); }
        datetime vOpenTime(void) { select(); return dto = OrderOpenTime(); }
        datetime vCloseTime(void) { select(); return dtc = OrderCloseTime(); }
        double vLots(void) { select(); return lots = OrderLots(); }
        double vProfit(void) { select(); return profit = OrderProfit(); }
        double vCommission(void) { select(); return commn = OrderCommission(); }
        double vSwap(void) { select(); return swap = OrderSwap(); }
        double vOpenPrice(void) { select(); return po = OrderOpenPrice(); }
        double vTakeProfit(void) { select(); return ptp = OrderTakeProfit(); }
        double vStopLoss(void) { select(); return psl = OrderStopLoss(); }
        double vClosePrice(void) { select(); return pc = OrderClosePrice(); }
        string vSymbol(void) { return sym; }
        string vComment(void) { select(); return cmt = OrderComment(); }
        // Value Extend
        ENUM_TRADE_DIR vTradeDir(void) { return tdir = OrderTradeDir(ticket); }
        ENUM_TRADE_MODE vTradeMode(void) { return tmode = OrderTradeMode(ticket); }
        double vPriceToClose(void) { return ptc = OrderPrice(ticket); }
        double vPriceToOpen(void) { return pto = OrderPrice(ticket, 1); }
        double vProfitInPoints(void);
        double vTradePrice(double i_base, double i_modifier);
        // Check
        
        // Action
        bool select(void) { return OrderSelect(ticket, SELECT_BY_TICKET); }
        bool update(void);
        bool close(void);
        bool modify(double i_ptp, double i_psl);
        bool modifyTP(double i_ptp);
        bool modifySL(double i_psl);
};

/**
 * Profit in points.
 */
double Order::vProfitInPoints(void)
{
    if (vProfit() == 0) {
        profit_pts = 0;
    }
    else {
        switch (vType()) {
            case OP_BUY:
                profit_pts = vPriceToClose() - vOpenPrice();
                break;
            case OP_SELL:
                profit_pts = vOpenPrice() - vPriceToClose();
                break;
        }
    }
    
    return profit_pts;
}

/**
 * Trade price.
 */
double Order::vTradePrice(double i_base, double i_modifier)
{
    vTradeDir();

    return TradePrice(i_base, tdir, i_modifier);
}

/**
 * Update order values.
 */
bool Order::update(void)
{
    bool order_select = select();
    if (order_select == FALSE) return(FALSE);

    // Value
    cmd = OrderType();
    magic = OrderMagicNumber();
    lots = OrderLots();
    profit = OrderProfit();
    commn = OrderCommission();
    swap = OrderSwap();
    po = OrderOpenPrice();
    psl = OrderStopLoss();
    ptp = OrderTakeProfit();
    pc = OrderClosePrice();
    dte = OrderExpiration();
    dto = OrderOpenTime();
    dtc = OrderCloseTime();
    sym = OrderSymbol();
    cmt = OrderComment();
    
    // Value Extend
    vTradeDir();
    vTradeMode();
    vPriceToClose();
    vPriceToOpen();
    vProfitInPoints();

    return order_select;
}

/**
 * Close the whole order.
 */
bool Order::close(void)
{
    bool order_closed = FALSE;
    switch (vType()) {
        case OP_BUY:
        case OP_SELL:
            order_closed = OrderClose(ticket, vLots(), vPriceToClose(), slippage, clr_close);
            break;
        case OP_BUYLIMIT:
        case OP_SELLLIMIT:
        case OP_BUYSTOP:
        case OP_SELLSTOP:
            order_closed = OrderDelete(ticket, clr_close);
            break;
    }
    if (order_closed) {
        vClosePrice();
        vCloseTime();
    }

    return order_closed;
}

/**
 * Modify order properties.
 */
bool Order::modify(double i_ptp, double i_psl)
{
    update();
    ptp = OrderNormalizePrice(ticket, i_ptp);
    psl = OrderNormalizePrice(ticket, i_psl);
    
    return OrderModify(ticket, po, psl, ptp, dte, clr_mod);
}

bool Order::modifyTP(double i_ptp)
{
    update();
    ptp = OrderNormalizePrice(ticket, i_ptp);
    
    return OrderModify(ticket, po, psl, ptp, dte, clr_mod);
}

bool Order::modifySL(double i_psl)
{
    update();
    psl = OrderNormalizePrice(ticket, i_psl);
    
    return OrderModify(ticket, po, psl, ptp, dte, clr_mod);
}

// =============================================================================
// OX Integration

#include "Order_Library.mqh"
