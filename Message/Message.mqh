
// Author: Kolier.Li

/**
 * Message struct.
 */
struct Message
{
    public:
        string title;
        string body;
    public:
        /**
         * Constructor.
         */
        Message(void)
        {
            title = "";
            body = "";
        }
        Message(string i_title, string i_body)
        {
            title = i_title;
            body = i_body;
        }
        ~Message(void) {}
        
        /**
         * Send
         */
        bool send(void)
        {
            return sendMail() && sendNotification();
        }
        
        bool sendMail(void)
        {
            return SendMail(title, body);
        }
        
        bool sendNotification(void)
        {
            return SendNotification(body);
        }
};
