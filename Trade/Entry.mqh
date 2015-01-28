
// Author: Kolier.Li

#include "..\System.mqh"
#include "..\Order\OrderNormalize.mqh"

/**
 * Entry struct, it's used to send order.
 */
struct Entry
{
    public:
        int ticket; // Product
        string sym;
        int cmd;
        double lots;
        int magic;
        string cmt;
        double po;
        double ptp;
        double psl;
        int slippage;
        datetime expire;
        color clr;
        //
        ENUM_TRADE_DIR dir;
    public:
        /**
         * Raw initiate, without data.
         */
        Entry(void)
        {
            reset();
        }
        
        /**
         * Reset.
         */
        void reset(void)
        {
            ticket = -1;
            sym = NULL;
            cmd = -1;
            lots = NULL;
            magic = NULL;
            cmt = NULL;
            po = NULL;
            ptp = NULL;
            psl = NULL;
            slippage = NULL;
            expire = 0;
            clr = clrNONE;
            dir = NULL;
        }
        
        /**
         * Send order.
         */
        int sendOrder(void)
        {
            if (!IsTradeAllowed()) {
                Print("Trade is not allowed.");
                ticket = -1;
                return(-1);
            }
            
            // Normalize parameters
            po = OrderNormalizePrice(sym, po);
            ptp = OrderNormalizePrice(sym, ptp);
            psl = OrderNormalizePrice(sym, psl);
            lots = OrderNormalizeLots(sym, lots);
            
            
            // Try 10 times if Context Busy.
            int try = 0;
            while (IsTradeContextBusy() && try < 10) {
                Sleep(100);
                if (RefreshRates()) {
                    try++;
                }
            }
            
            ticket = OrderSend(sym, cmd, lots, po, slippage, 0, 0, cmt, magic, expire, clr);
            
            if (ticket > 0) {
                if (ptp > 0 || psl > 0) {
                    if (!OrderModify(ticket, po, psl, ptp, expire, clr)) {
                        if (GetLastError() > 1) Print("OrderOpen(" + IntegerToString(GetLastError()) + "): Fail to modify order after opened.");
                    }
                }
            }
            else {
                Print("OrderOpen(" + IntegerToString(GetLastError()) + "): Fail to open new order.");
                Print(sym, " ", cmd, " ", lots, " ", po, " ", slippage, " ", psl, " ", ptp, " ", cmt, " ", magic, " ", expire);
            }
            
            return ticket;
        }
};
