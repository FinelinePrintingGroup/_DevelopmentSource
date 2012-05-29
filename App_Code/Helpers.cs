using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;
using System.Net.Mail;

/// <summary>
/// Summary description for Helpers
/// </summary>
public class Helpers
{
	public Helpers()
    {

    }

    public void sendEmail(string recipID, string msgBody)
    {
        ArrayList msgList = new ArrayList();

        msgList.Clear();
        msgList.Add(recipID);

            foreach (string item in msgList)
            {
                try
                {
                    MailMessage message = new MailMessage();
                    message.To.Add(item);
                    message.Subject = "AutoInvoicing Notification";
                    message.From = new MailAddress("AutoInvoicing@Finelink.com");
                    message.Body = msgBody;
                    message.ReplyTo = new MailAddress("GVreeman@Finelink.com");
                    message.IsBodyHtml = true;
                    System.Net.Mail.SmtpClient smtp = new SmtpClient("192.168.240.27");
                    smtp.Send(message);
                    message.Dispose();
                }
                catch (Exception e)
                {
            }
        }
    }
}
