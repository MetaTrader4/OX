
// Author: Kolier.Li

/**
 * Clear objects with prefix or suffix.
 */
void DrawClear(string prefix = "", string suffix = "") 
{
    string name;
    int obj_total = ObjectsTotal();
    for (int i=obj_total-1; i>=0; i--) {
        name = ObjectName(i);
        if (StringFind(name, prefix) == 0) {
            ObjectDelete(name);
        }
        if (StringLen(name) == StringFind(name, suffix) + StringLen(suffix)) {
            ObjectDelete(name);
        }
    }
}

/**
 * Set Object Label, create if not exist yet.
 */
void fxDrawLabel(string name, string text, int corner, int x, int y, int window = 0, color clr = clrWhite, string font = "Arial", int font_size = 12)
{
    if(ObjectFind(name) == -1) {
        ObjectCreate(name, OBJ_LABEL, window, 0, 0);
    }
    ObjectSet(name, OBJPROP_CORNER, corner);
    ObjectSet(name, OBJPROP_XDISTANCE, x);
    ObjectSet(name, OBJPROP_YDISTANCE, y);
    ObjectSetText(name, text, font_size, font, clr);
}

/**
 * Set object Vertical line, create if not exist yet.
 */
void DrawHLine(string name, double price_1, int window = 0, color clr = clrBlue, bool draw_back = TRUE)
{
    if (ObjectFind(name) == -1) {
        ObjectCreate(name, OBJ_HLINE, window, 0, price_1);
    }
    ObjectSet(name, OBJPROP_PRICE1, price_1);
    ObjectSet(name, OBJPROP_COLOR, clr);
    ObjectSet(name, OBJPROP_BACK, draw_back);
}
