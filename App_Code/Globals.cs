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

/// <summary>
/// Summary description for Globals
/// </summary>
public class Globals
{
    private static string logicConnString = "Data Source=SQL1;Initial Catalog=pLogic;User ID=FPGwebservice;Password=kissmygrits;Connect Timeout=160";
    private static string printableConnString = "Data Source=SQL1;Initial Catalog=Printable;User ID=FPGwebservice;Password=kissmygrits;Connect Timeout=160";
    private static string CRMConnString = "Data Source=CRM1;Initial Catalog=FinelinePrintingGroup_MSCRM;Persist Security Info=True;User ID=invoicereader;Password=kissmygrits;Connect Timeout=160";
    public static string get_CRMConnString
    {
        get { return Globals.CRMConnString; }
    }
    public static string get_logicConnString
    {
        get { return Globals.logicConnString; }
    }
    public static string get_printableConnString
    {
        get { return Globals.printableConnString; }
    }


	public Globals()
	{

	}
}
