
// Author: Kolier.Li

#include "..\DataSerial.mqh"

struct DataSerialPriceTicks : public DataSerial
{
    public:
        double m_ask[];
        double m_bid[];
    public:
        DataSerialPriceTicks(void)
        {
            m_size = 100;
            m_time = 0;
            initiate(m_ask);
            initiate(m_bid);
        }
        
        /**
         * Update new data.
         */
        void update(void)
        {
            MqlTick tick;
            SymbolInfoTick(_Symbol, tick);
            // Ignore same tick
            if (tick.time == m_time) return;
            
            add(m_ask, tick.ask);
            add(m_bid, tick.bid);
            
            m_time = tick.time;
        }
        
        /**
         * Check cross.
         *
         * MODE_ASK, MODE_BID.
         */
        ENUM_CROSSOVER checkCross(int i_mode, double i_val)
        {
            if (i_mode == MODE_ASK) {
                return crossStatus(m_ask, i_val);
            }
            else if (i_mode == MODE_BID) {
                return crossStatus(m_bid, i_val);
            }
            
            return NULL;
        }
};
