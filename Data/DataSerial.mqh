
// Author: Kolier.Li

#include "..\System.mqh"
#include "..\Array\System.mqh"

/**
 * DataSerial Structure.
 */
struct DataSerial
{
    public:
        int data_size; // Default data size
        datetime data_time; // Data timestamp
    public:
        // Initiate data array
        void initiate(int &i_data[]);
        void initiate(double &i_data[]);
        // Add new data value
        void add(int &i_data[], int i_val);
        void add(double &i_data[], double i_val);
        // Check Cross
        ENUM_CROSSOVER crossStatus(int &i_data[], int i_val, int i_idx = 0); // Test if data serial crossed a being tested value
        ENUM_CROSSOVER crossStatus(double &i_data[], double i_val, int i_idx = 0);
        ENUM_CROSSOVER crossStatusStrict(int &i_data[], int i_val, int i_idx = 0); // >, < only, not all =
        ENUM_CROSSOVER crossStatusStrict(double &i_data[], double i_val, int i_idx = 0);
        int nextIndex(int &i_data[], int i_idx); // Get a nearest index with different value
        int nextIndex(double &i_data[], int i_idx);
};

/**
 * Initiate data serial.
 */
void DataSerial::initiate(int &i_data[])
{
    ArrayResize(i_data, data_size);
    ArrayInitialize(i_data, EMPTY_VALUE);
}

void DataSerial::initiate(double &i_data[])
{
    ArrayResize(i_data, data_size);
    ArrayInitialize(i_data, EMPTY_VALUE);
}

/**
 * Add new data to the front.
 */
void DataSerial::add(int &i_data[], int i_val)
{
    int arr[];
    int size = ArrayClone(arr, i_data);
    i_data[0] = i_val;
    for (int i = 1; i < size; i++) {
        i_data[i] = arr[i-1];
    }
}

void DataSerial::add(double &i_data[], double i_val)
{
    double arr[];
    int size = ArrayClone(arr, i_data);
    i_data[0] = i_val;
    for (int i = 1; i < size; i++) {
        i_data[i] = arr[i-1];
    }
}

/**
 * Test cross status.
 */
ENUM_CROSSOVER DataSerial::crossStatus(int &i_data[], int i_val, int i_idx = 0)
{
    int index_pre = nextIndex(i_data, i_idx);
    
    ENUM_CROSSOVER status = NULL;
    if (i_data[i_idx] >= i_val && i_data[index_pre] < i_val) {
        status = CROSS_ABOVE;
    }
    else if (i_data[i_idx] <= i_val && i_data[index_pre] > i_val) {
        status = CROSS_BELOW;
    }
    
    return status;
}

ENUM_CROSSOVER DataSerial::crossStatus(double &i_data[], double i_val, int i_idx = 0)
{
    int index_pre = nextIndex(i_data, i_idx);
    
    ENUM_CROSSOVER status = NULL;
    if (i_data[i_idx] >= i_val && i_data[index_pre] < i_val) {
        status = CROSS_ABOVE;
    }
    else if (i_data[i_idx] <= i_val && i_data[index_pre] > i_val) {
        status = CROSS_BELOW;
    }
    
    return status;
}

/**
 * Strict cross status.
 */
ENUM_CROSSOVER DataSerial::crossStatusStrict(int &i_data[], int i_val, int i_idx = 0)
{
    int index_pre = nextIndex(i_data, i_idx);
    
    ENUM_CROSSOVER status = NULL;
    if (i_data[i_idx] > i_val && i_data[index_pre] < i_val) {
        status = CROSS_ABOVE;
    }
    else if (i_data[i_idx] < i_val && i_data[index_pre] > i_val) {
        status = CROSS_BELOW;
    }
    
    return status;
}

ENUM_CROSSOVER DataSerial::crossStatusStrict(double &i_data[], double i_val, int i_idx = 0)
{
    int index_pre = nextIndex(i_data, i_idx);
    
    ENUM_CROSSOVER status = NULL;
    if (i_data[i_idx] > i_val && i_data[index_pre] < i_val) {
        status = CROSS_ABOVE;
    }
    else if (i_data[i_idx] < i_val && i_data[index_pre] > i_val) {
        status = CROSS_BELOW;
    }
    
    return status;
}

/**
 * Get a nearest index with different value.
 *
 * @issue Potential issue if run out of data, to the end, need solution for it.
 */
int DataSerial::nextIndex(int &i_data[], int i_idx)
{
    int size = ArraySize(i_data);
    int i;
    for (i = i_idx; i < size - 1; i++) {
        if (i_data[i] != i_data[i+1]) {
            break;
        }
    }

    return (i + 1);
}

int DataSerial::nextIndex(double &i_data[], int i_idx)
{
    int size = ArraySize(i_data);
    int i;
    for (i = i_idx; i < size - 1; i++) {
        if (i_data[i] != i_data[i+1]) {
            break;
        }
    }

    return (i + 1);
}
