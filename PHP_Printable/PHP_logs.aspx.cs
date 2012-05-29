using System;
using System.IO;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Reporting_PHP_logs : System.Web.UI.Page
{
    protected string filepath = "http://192.168.240.25:16000/~error_log/php-errors.txt";

    protected void Page_Load(object sender, EventArgs e)
    {        
        get_phpLog();       
    }

    protected void btn_refresh_Click(object sender, EventArgs e)
    {
        get_phpLog();
    }

    protected void get_phpLog()
    {
        HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(filepath);
        myRequest.Method = "GET";
        WebResponse myResponse = myRequest.GetResponse();
        StreamReader sr = new StreamReader(myResponse.GetResponseStream(), System.Text.Encoding.UTF8);
        TextBox1.Text = sr.ReadToEnd();
        sr.Close();
        myResponse.Close();

        TextBox1.Text += "End of log";

    }
}
