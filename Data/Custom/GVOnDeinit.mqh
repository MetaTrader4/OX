
/**
 * Clear useless global variables.
 */
void GVOnDeinit(void)
{
    // Clear all Tester GVs.
    GlobalVariablesDeleteAll("(Test)");
}

