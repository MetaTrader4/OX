
/**
 * Validate if the order is belong to the realm.
 */
bool OrderIsValid(int ticket)
{
    if (OrderSelectA(ticket) == FALSE) return(FALSE);
    
    return TRUE;
}
