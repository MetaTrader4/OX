
// Author: Kolier.Li

// -----------------------------------------------------------------------------
// Enumation, Constants
//
// Operators Reference: http://php.net/manual/en/language.operators.php

/**
 * Operators
 */
enum ENUM_OPERATOR_LOGICAL
{
    ENUM_OPERATOR_LOGICAL_NULL,
    AND,                   // &&
    OR,                    // ||
    XOR,                   // ^
    NOT                    // !
};

enum ENUM_OPERATOR_COMPARISON
{
    ENUM_OPERATOR_COMPARISON_NULL,
    EQUAL,                    // ==
    IDENTICAL,                // ===
    NOT_EQUAL,                // !=
    NOT_IDENTICAL,            // !==
    LESS_THAN,                // <
    GREATER_THAN,             // >
    LESS_THAN_OR_EQUAL_TO,    // <=
    GREATER_THAN_OR_EQUAL_TO  // >=
};

/**
 * Data
 */
enum ENUM_DATA_CONTROL
{
    ENUM_DATA_CONTROL_NULL,
    GET,
    SET,
    DEL
};

/**
 * Trade
 */
enum ENUM_TRADE_DIR
{
    ENUM_TRADE_DIR_NULL,
    LONG,
    SHORT
};

enum ENUM_TRADE_MODE
{
    ENUM_TRADE_MODE_NULL,
    MARKET,
    PEND
};

/**
 * Simple directional type.
 */
enum ENUM_DIR
{
    ENUM_DIR_NULL,
    UP,
    DOWN
};

/**
 * Market
 */
enum ENUM_MARKET_STATUS
{
    ENUM_MARKET_STATUS_NULL,
    NONE,
    BULL,
    BEAR,
    SWING
};

/**
 * Candle type
 */
enum ENUM_CANDLE_TYPE
{
    ENUM_CANDLE_TYPE_NULL,
    CANDLE_BULL,
    CANDLE_BEAR,
};

/**
 * Price type.
 */
enum ENUM_PRICE_TYPE
{
    ENUM_PRICE_TYPE_NULL, // NULL
    PRICE_PRICE,          // Normal price
    PRICE_POINTS,         // Integer format of Points
    PRICE_PIPS,           // Integer format of Pips
    PRICE_POINTS_VALUE,   // Price format of Points
    PRICE_PIPS_VALUE      // Price format of Pips
};

/**
 * Crossover status.
 */
enum ENUM_CROSSOVER
{
    ENUM_CROSSOVER_NULL,
    CROSS_ABOVE,
    CROSS_BELOW
};
