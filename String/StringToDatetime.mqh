
// Author: Kolier.Li

/**
 * Convert string into datetime, a wrapper for StringToTime().
 */
datetime StringToDatetime(string value)
{
    // yyyy.mm.dd [hh:mi[:ss]]
    if (StringLen(value) < 10) {
        value = StringConcatenate(TimeToStr(TimeCurrent(), TIME_DATE), " ", value);
    }
    
    return StringToTime(value);
}
