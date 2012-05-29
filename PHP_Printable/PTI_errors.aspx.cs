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

public partial class ErrorLogs_PTI_errors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_viewAll_Click(object sender, EventArgs e)
    {
        Printable.SelectCommand = @"SELECT * FROM [CT_PTI_ErrorLog] WHERE [errNum] LIKE '%' ORDER BY [errID] DESC";
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string temp = DropDownList1.SelectedValue;

        if (temp == "")
            temp = "%";

        Printable.SelectCommand = @"SELECT * FROM [CT_PTI_ErrorLog] WHERE [errNum] LIKE '" + temp + "' ORDER BY [errID] DESC";
    }
    
    protected void btn_search_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Length > 0)
        {
            Printable.SelectCommand = @"SELECT * 
                                        FROM [CT_PTI_ErrorLog] 
                                        WHERE [errDesc] LIKE '%" + TextBox1.Text + @"%' 
                                        OR [errMsg] LIKE '%" + TextBox1.Text + @"%'
                                        ORDER BY [errID] DESC";
        }
    }
}