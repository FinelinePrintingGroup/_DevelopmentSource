using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Reporting_EOD_logs : System.Web.UI.Page
{
    string search = "";

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_searchItems_Click(object sender, EventArgs e)
    {
        if (txt_searchItems.Text == "")
            search = "%";
        else
            search = txt_searchItems.Text;

        GridView2.AllowPaging = false;        
        EODitems.SelectCommand = "SELECT * FROM [CT_UPS_EODitems] WHERE [" + DropDownList1.SelectedValue + "] LIKE '%" + search.ToUpper() + "%' ORDER BY [id] DESC";

    }
    protected void btn_searchExport_Click(object sender, EventArgs e)
    {
        if (txt_searchExport.Text == "")
            search = "%";
        else
            search = txt_searchExport.Text;

        GridView1.AllowPaging = false;
        EODexport.SelectCommand = "SELECT * FROM [CT_UPS_EODexport] WHERE [" + drop_export.SelectedValue + "] LIKE '%" + search.ToUpper() + "%' ORDER BY [id] DESC";
    }
   
}
