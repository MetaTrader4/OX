
// Author: Kolier.Li

#include "DataSerial.mqh"

struct DataSerialPriceTicks : public DataSerial
{
    public:
        string sym;
        double data_ask[];
        double data_bid[];
    public:
        DataSerialPriceTicks(string i_sym = NULL, int i_size = 100)
        {
            sym = i_sym;
            data_size = i_size;
            initiate(data_ask);
            initiate(data_bid);
        }
        
        /**
         * Update new data.
         */
        void update(void)
        {
            MqlTick tick;
            SymbolInfoTick(sym, tick);
            // Ignore same tick
            if (tick.time == data_time) return;
            
            add(data_ask, tick.ask);
            add(data_bid, tick.bid);
            
            // Update data time
            data_time = tick.time;
        }
        
        /**
         * Check cross.
         *
         * MODE_ASK, MODE_BID.
         */
        ENUM_CROSSOVER checkCross(int i_mode, double i_val)
        {
            if (i_mode == MODE_ASK) {
                return crossStatus(data_ask, i_val);
            }
            else if (i_mode == MODE_BID) {
                return crossStatus(data_bid, i_val);
            }
            
            return NULL;
        }
};
