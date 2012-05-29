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

public partial class Reporting_AutoInvoicing_logs : System.Web.UI.Page
{
    string search;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_searchBatch_Click(object sender, EventArgs e)
    {
        if (txt_batch.Text == "")
            search = "%";
        else
            search = txt_batch.Text;

        BatchSchedule.SelectCommand = "SELECT * FROM [CT_AUTO_BatchSchedule] WHERE [" + DropDownList1.SelectedValue + "] LIKE '%" + search.ToUpper() + "%' ORDER BY [BatchNum] DESC";
    }
    protected void btn_searchInvoice_Click(object sender, EventArgs e)
    {
        if (txt_invoice.Text == "")
            search = "%";
        else
            search = txt_invoice.Text;

        InvoiceLog.SelectCommand = "SELECT * FROM [CT_AUTO_InvoiceLog] WHERE [" + DropDownList2.SelectedValue + "] LIKE '%" + search.ToUpper() + "%' ORDER BY [InvoiceN] DESC";
    }
    protected void btn_searchAlert_Click(object sender, EventArgs e)
    {
        if (txt_alert.Text == "")
            search = "%";
        else
            search = txt_alert.Text;

        AlertJobLog.SelectCommand = "SELECT * FROM [CT_AUTO_AlertJobLog] WHERE [" + DropDownList3.SelectedValue + "] LIKE '%" + search.ToUpper() + "%' ORDER BY [id] DESC";
    }
    protected void btn_searchInvoice0_Click(object sender, EventArgs e)
    {
        if (txt_invoice0.Text == "")
            search = "%";
        else
            search = txt_invoice0.Text;

        InvoiceLogDeleted.SelectCommand = "SELECT * FROM [CT_AUTO_InvoiceLog_Deleted] WHERE [" + DropDownList4.SelectedValue + "] LIKE '%" + search.ToUpper() + "%' ORDER BY [InvoiceN] DESC";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txt_holdTable.Text == "")
            search = "%";
        else
            search = txt_holdTable.Text;

        HoldTables.SelectCommand = "SELECT * FROM [CT_AUTO_HoldTable] WHERE [" + drop_holdTable.SelectedValue + "] LIKE '%" + search.ToUpper() + "%' ORDER BY [CreateDate] DESC, [JobN] DESC";
    }
}