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
using System.Data.Sql;
using System.Data.SqlClient;
using System.Xml;
using System.IO;
using System.Net.Mail;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Threading;

public partial class AutoInvoicing_AlertJobTest : System.Web.UI.Page
{
    protected int jobN;
    protected Globals globals = new Globals();
    protected int custNum;
    protected int jobType;
    protected ArrayList jobMT = new ArrayList();
    protected int qtyShipped;
    protected int qtyOrdered;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btn_go_Click(object sender, EventArgs e)
    {
        flushVisible();

        if (txt_JobN.Text.Length > 0)
        {
            if (Int32.TryParse(txt_JobN.Text, out jobN))
            {
                lbl_status.Text = String.Format("Job#: {0}", jobN);                
                runTests(jobN, 1);
            }
            else
            {
                set_statusError(String.Format("Job#: {0} is in an invalid format", txt_JobN.Text));
            }
        }
        else if (txt_FGOrderN.Text.Length > 0)
        {
            if (Int32.TryParse(txt_FGOrderN.Text, out jobN))
            {
                lbl_status.Text = String.Format("FG Order#: {0}", jobN);
                runTests(jobN, 2);
            }
            else
            {
                set_statusError(String.Format("FG Order#: {0} is in an invalid format", txt_FGOrderN.Text));
            }
        }
        else
        {
            set_statusError("Enter a job/order to look up");
        }

        if (lbl_error.Visible.Equals(false))
        {
            lbl_done.Visible = true;
        }
    }

    protected void flushVisible()
    {
        lbl_1.Visible = false;
        lbl_2.Visible = false;
        lbl_3.Visible = false;
        lbl_4.Visible = false;
        lbl_5.Visible = false;
        lbl_6.Visible = false;
        lbl_7.Visible = false;
        lbl_8.Visible = false;
        lbl_9.Visible = false;
        lbl_10.Visible = false;
        lbl_11.Visible = false;
        lbl_12.Visible = false;
        lbl_13.Visible = false;
        lbl_14.Visible = false;
        lbl_15.Visible = false;
        lbl_16.Visible = false;
        pass_1.Visible = false;
        pass_2.Visible = false;
        pass_3.Visible = false;
        pass_4.Visible = false;
        pass_5.Visible = false;
        pass_6.Visible = false;
        pass_7.Visible = false;
        pass_8.Visible = false;
        pass_9.Visible = false;
        pass_10.Visible = false;
        pass_11.Visible = false;
        pass_12.Visible = false;
        pass_13.Visible = false;
        pass_14.Visible = false;
        pass_15.Visible = false;
        pass_16.Visible = false;
        fail_1.Visible = false;
        fail_2.Visible = false;
        fail_3.Visible = false;
        fail_4.Visible = false;
        fail_5.Visible = false;
        fail_6.Visible = false;
        fail_7.Visible = false;
        fail_8.Visible = false;
        fail_9.Visible = false;
        fail_10.Visible = false;
        fail_11.Visible = false;
        fail_12.Visible = false;
        fail_13.Visible = false;
        fail_14.Visible = false;
        fail_15.Visible = false;
        fail_16.Visible = false;
        lbl_done.Visible = false;
        lbl_error.Visible = false;
    }


    ///                                                                                                                                                                
    public void set_statusError(string error)
    {
        this.lbl_status.Text = error;
        lbl_error.Visible = true;
    }

    protected void runTests(int jobN, int jobType)
    {
        this.jobN = jobN;
        this.jobType = jobType;

        if (jobType == 1)
        {
            if (check_MTexist())
            {
                get_custNum();
                check_BWS();
                check_RevisedEstimate();
                check_altsExist();
                get_custPref_requiresPO();
                check_wfExist();
                check_shipmentQuantity();
                check_qsm();
                check_compareTaxCodes_Diff();
                check_OutsideBuys();
                check_billToOverride();

                lbl_8.Visible = true;
                lbl_9.Visible = true;
                lbl_11.Visible = true;
                lbl_12.Visible = true;

                if (qtyShipped > qtyOrdered)
                {
                    try
                    {
                        Overs overs = new Overs();
                        overs.qtyOrdered = qtyOrdered;
                        overs.qtyShipped = qtyShipped;
                        overs.oversPct = getCustPref_billableOversPct();
                        overs.calculateOvers();

                        if (overs.qtyShipped > overs.thresholdAllowed)
                        {
                            // Kick "Overs exceed maximum threshold (20%)"                                              
                            pass_9.Visible = false;
                            fail_9.Visible = true;

                            pass_8.Visible = true;
                            fail_8.Visible = false;
                            pass_11.Visible = true;
                            fail_11.Visible = false;
                            pass_12.Visible = true;
                            fail_12.Visible = false;
                        }
                        else if ((overs.qtyOvers > 0) && ((decimal)jobMT[2] == 0.00M))
                        {
                            // Kick "Overs without overs costing                                                        
                            pass_8.Visible = false;
                            fail_8.Visible = true;

                            pass_9.Visible = true;
                            fail_9.Visible = false;
                            pass_11.Visible = true;
                            fail_11.Visible = false;
                            pass_12.Visible = true;
                            fail_12.Visible = false;
                        }
                        else if ((overs.qtyOvers > overs.oversAllowed) && ((decimal)jobMT[2] > 0.01M))
                        {
                            // Warning "Overs exceed Customer Preference (x%) but have been billed according to the BWS 
                            pass_11.Visible = false;
                            fail_11.Visible = true;

                            pass_8.Visible = true;
                            fail_8.Visible = false;
                            pass_9.Visible = true;
                            fail_9.Visible = false;
                            pass_12.Visible = true;
                            fail_12.Visible = false;
                        }
                        else if ((overs.qtyOvers > overs.oversAllowed) && ((0.01M >= (decimal)jobMT[2]) && ((decimal)jobMT[2] > 0.00M)))
                        {
                            // Warning "Overs exceed Customer Preference (x%) and have been ommited from the invoice based on $0.01 in the BWS
                            pass_12.Visible = false;
                            fail_12.Visible = true;

                            pass_8.Visible = true;
                            fail_8.Visible = false;
                            pass_9.Visible = true;
                            fail_9.Visible = false;
                            pass_11.Visible = true;
                            fail_11.Visible = false;
                        }
                        else
                        {
                            pass_8.Visible = true;
                            fail_8.Visible = false;
                            pass_9.Visible = true;
                            fail_9.Visible = false;
                            pass_11.Visible = true;
                            fail_11.Visible = false;
                            pass_12.Visible = true;
                            fail_12.Visible = false;
                        }
                    }
                    catch (Exception e)
                    {
                        set_statusError(e.ToString());
                    }
                }
                else
                {
                    pass_8.Visible = true;
                    fail_8.Visible = false;
                    pass_9.Visible = true;
                    fail_9.Visible = false;
                    pass_11.Visible = true;
                    fail_11.Visible = false;
                    pass_12.Visible = true;
                    fail_12.Visible = false;
                }

                lbl_6.Visible = true;
                pass_6.Visible = true;
            }
            else
            {
                set_statusError("Job doesn't exist in CT_Job");
            }
        }
        else if (jobType == 2)
        {

        }
    }
    ///

    #region Methods
    protected void check_BWS()
    {
        lbl_1.Visible = true;
        get_JobMT();

        if (jobMT.Count > 0)
        {
            try
            {
                if (Convert.ToDecimal(jobMT[0].ToString()) == 0.00M)
                {
                    if (Convert.ToDecimal(jobMT[6].ToString()) == 0.00M)
                    {
                        pass_1.Visible = false;
                        fail_1.Visible = true;
                    }
                    else
                    {
                        pass_1.Visible = true;
                        fail_1.Visible = false;
                    }
                }
                //else if (Convert.ToDecimal(jobMT[10].ToString()) == 0.00M)
                //{
                //    pass_1.Visible = false;
                //    fail_1.Visible = true;
                //}
                else
                {
                    pass_1.Visible = true;
                    fail_1.Visible = false;
                }
            }
            catch (IndexOutOfRangeException e_range)
            {
                set_statusError(e_range.ToString());
            }
            catch (Exception e)
            {
                set_statusError(e.ToString());
            }
        }
        else
        {
            set_statusError("Job.Count !> 0");
        }
    }

    protected void check_RevisedEstimate()
    {
        lbl_2.Visible = true;

        string temp = "";
        string q = @"SELECT ISNULL(EStatus, 'BLANK')
                     FROM pLogic.dbo.Estimates
                     WHERE JobNumber = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    temp = (command.ExecuteScalar() ?? "BLANK").ToString();

                    conn.Close();
                }
                catch (Exception e)
                {
                    Globals.Write_Magenta(e.ToString()); Console.Beep();
                }
            }
        }
        catch (Exception e)
        {
            Globals.Write_Magenta(e.ToString()); Console.Beep();
        }

        if (temp == "Revised")
        {
            pass_2.Visible = false;
            fail_2.Visible = true;
        }
        else
        {
            pass_2.Visible = true;
            fail_2.Visible = false;
        }
    }

    protected void check_altsExist()
    {
        lbl_3.Visible = true;

        int temp = 0;

        string q = @"SELECT COUNT(*)
                     FROM pLogic.dbo.Alterations a 
                         LEFT OUTER JOIN pLogic.dbo.AlterationDetail ad
                             ON a.JobN = ad.JobN
                             AND ad.AlterationN = ad.AlterationN
                     WHERE AlterationType = 0
                     AND a.JobN = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    temp = Convert.ToInt32(command.ExecuteScalar() ?? 0);

                    conn.Close();
                }
                catch (Exception e)
                {
                    Globals.Write_Magenta(e.ToString()); Console.Beep();
                }
            }
        }
        catch (Exception e)
        {
            Globals.Write_Magenta(e.ToString()); Console.Beep();
        }

        if (temp > 0)
        {
            if (Convert.ToDecimal(jobMT[4].ToString()) == 0.00M)
            {
                pass_3.Visible = false;
                fail_3.Visible = true;
            }
            else
            {
                pass_3.Visible = true;
                fail_3.Visible = false;
            }
        }
        else
        {
            pass_3.Visible = true;
            fail_3.Visible = false;
        }
    }

    protected void get_JobMT()
    {
        jobMT.Clear();

        if (check_MTexist())
        {
            string q = @"SELECT *
                         FROM printable.dbo.vw_AUTO_JobMT
                         WHERE JobN = " + jobN;

            try
            {
                using (SqlConnection conn = new SqlConnection(Globals.get_printableConnString))
                {
                    SqlCommand command = new SqlCommand(q, conn);
                    try
                    {
                        command.Connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            jobMT.Add(Convert.ToDecimal((reader[0] ?? 0.0000M).ToString())); // Print           
                            jobMT.Add(reader[1].ToString());                                    // Print Comments   
                            jobMT.Add(Convert.ToDecimal((reader[2] ?? 0.0000M).ToString())); // Overs           
                            jobMT.Add(reader[3].ToString());                                    // Overs Comments   
                            jobMT.Add(Convert.ToDecimal((reader[4] ?? 0.0000M).ToString())); // Alts            
                            jobMT.Add(reader[5].ToString());                                    // Alts Comments    
                            jobMT.Add(Convert.ToDecimal((reader[6] ?? 0.0000M).ToString())); // WF              
                            jobMT.Add(reader[7].ToString());                                    // WF Comments      
                            jobMT.Add(Convert.ToDecimal((reader[8] ?? 0.0000M).ToString())); // Mail            
                            jobMT.Add(reader[9].ToString());                                    // Mail Comments    
                            jobMT.Add(Convert.ToDecimal((reader[10] ?? 0.0000M).ToString())); // Ship           
                            jobMT.Add(reader[11].ToString());                                   // Ship Comments    
                            jobMT.Add(reader[12].ToString());                                   // Addl Comments    
                        }
                    }
                    catch (Exception e)
                    {
                        set_statusError(e.ToString());
                    }
                }
            }
            catch (Exception e)
            {
                set_statusError(e.ToString());
            }
        }
        else
        {
            jobMT.Add(0.0000M);
            jobMT.Add(' ');
            jobMT.Add(0.0000M);
            jobMT.Add(' ');
            jobMT.Add(0.0000M);
            jobMT.Add(' ');
            jobMT.Add(0.0000M);
            jobMT.Add(' ');
            jobMT.Add(0.0000M);
            jobMT.Add(' ');
            jobMT.Add(0.0000M);
            jobMT.Add(' ');
            jobMT.Add(' ');
        }
    }

    protected bool check_MTexist()
    {
        int temp = 0;

        string q = @"SELECT COUNT(*)
                     FROM printable.dbo.vw_AUTO_JobMT
                     WHERE JobN = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    temp = Convert.ToInt32(command.ExecuteScalar() ?? 0);

                    conn.Close();
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        if (temp > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void get_custPref_requiresPO()
    {
        lbl_4.Visible = true;

        int temp = 0;
        string q_getPref = @"SELECT TOP 1 HC1_RequiresPO
                             FROM FinelinePrintingGroup_MSCRM.dbo.AccountExtensionBase
                             WHERE HC1_LogicCustomerNumber = '" + custNum + "'";

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_CRMConnString))
            {
                SqlCommand command = new SqlCommand(q_getPref, conn);
                try
                {
                    command.Connection.Open();
                    temp = Convert.ToInt32(command.ExecuteScalar() ?? 0);

                    conn.Close();
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        if (temp == 1)
        {
            if (!check_POexists())
            {
                pass_4.Visible = false;
                fail_4.Visible = true;
            }
            else
            {
                pass_4.Visible = true;
                fail_4.Visible = false;
            }
        }
        else
        {
            pass_4.Visible = true;
            fail_4.Visible = false;
        }
    }

    protected int getCustPref_billableOversPct()
    {
        int temp = 3;

        string q_getPref = @"SELECT TOP 1 HC1_BillableOversPct
                             FROM FinelinePrintingGroup_MSCRM.dbo.AccountExtensionBase
                             WHERE HC1_LogicCustomerNumber = '" + custNum + "'";

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_CRMConnString))
            {
                SqlCommand command = new SqlCommand(q_getPref, conn);
                try
                {
                    command.Connection.Open();

                    temp = Convert.ToInt32(command.ExecuteScalar() ?? 3);

                    conn.Close();
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }
        return temp;
    }

    protected bool getCustPref_quotedSalesMax()
    {
        bool test = false;
        string q_getPref = @"SELECT TOP 1 HC1_QuotedSalesMax
                             FROM FinelinePrintingGroup_MSCRM.dbo.AccountExtensionBase
                             WHERE HC1_LogicCustomerNumber = '" + custNum + "'";

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_CRMConnString))
            {
                SqlCommand command = new SqlCommand(q_getPref, conn);
                try
                {
                    command.Connection.Open();
                    int temp = Convert.ToInt32(command.ExecuteScalar() ?? 0);

                    if (temp == 1)
                    {
                        test = true;
                    }
                    else
                    {
                        test = false;
                    }

                    conn.Close();
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        return test;
    }

    protected bool getCustPref_billToOverride()
    {
        bool test = false;
        string q_getPref = @"SELECT TOP 1 HC1_BillToOverride
                             FROM FinelinePrintingGroup_MSCRM.dbo.AccountExtensionBase
                             WHERE HC1_LogicCustomerNumber = '" + custNum + "'";

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_CRMConnString))
            {
                SqlCommand command = new SqlCommand(q_getPref, conn);
                try
                {
                    command.Connection.Open();
                    int temp = Convert.ToInt32(command.ExecuteScalar() ?? 0);

                    if (temp == 1)
                    {
                        test = true;
                    }
                    else
                    {
                        test = false;
                    }

                    conn.Close();
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        return test;
    }
  
    protected bool check_POexists()
    {
        int test = 0;

        if (jobType == 1)
        {
            string q = @"SELECT TOP 1 COUNT(*)
                                 FROM pLogic.dbo.OpenJob
                                 WHERE JobN = " + jobN + @"
                                 AND CustomersPON != ''
                                 AND UPPER(CustomersPON) != UPPER('to come')";

            try
            {
                using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
                {
                    SqlCommand command = new SqlCommand(q, conn);
                    try
                    {
                        command.Connection.Open();
                        test = Convert.ToInt32(command.ExecuteScalar() ?? 0);

                        conn.Close();
                    }
                    catch (Exception e)
                    {
                        set_statusError(e.ToString());
                    }
                }
            }
            catch (Exception e)
            {
                set_statusError(e.ToString());
            }
        }
        else if (jobType == 2)
        {
            string q = @"SELECT COUNT(*)
                                 FROM pLogic.dbo.FGIOrderMast
                                 WHERE OrderN = " + jobN + @"
                                 AND PON != ''";

            try
            {
                using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
                {
                    SqlCommand command = new SqlCommand(q, conn);
                    try
                    {
                        command.Connection.Open();
                        test = Convert.ToInt32(command.ExecuteScalar() ?? 0);

                        conn.Close();
                    }
                    catch (Exception e)
                    {
                        set_statusError(e.ToString());
                    }
                }
            }
            catch (Exception e)
            {
                set_statusError(e.ToString());
            }
        }

        if (test == 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    protected void get_custNum()
    {
        string q_getPref = @"SELECT CustomerN
                             FROM pLogic.dbo.OpenJob
                             WHERE JobN = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q_getPref, conn);
                try
                {
                    command.Connection.Open();
                    custNum = Convert.ToInt32(command.ExecuteScalar() ?? 0);

                    conn.Close();
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }
    }

    protected void check_wfExist()
    {
        lbl_5.Visible = true;

        int temp = 0;

        string q = @"SELECT COUNT(*)
                     FROM pLogic.dbo.JobLabor
                     WHERE LccN BETWEEN 27000 AND 28999
                     AND JobN = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    temp = Convert.ToInt32(command.ExecuteScalar() ?? 0);

                    conn.Close();
                }
                catch (Exception e)
                {
                    Globals.Write_Magenta(e.ToString()); Console.Beep();
                }
            }
        }
        catch (Exception e)
        {
            Globals.Write_Magenta(e.ToString()); Console.Beep();
        }

        if (temp > 0)
        {
            if (Convert.ToDecimal(jobMT[6].ToString()) == 0.00M)
            {
                pass_5.Visible = false;
                fail_5.Visible = true;
            }
            else
            {
                pass_5.Visible = true;
                fail_5.Visible = false;
            }
        }
        else
        {
            pass_5.Visible = true;
            fail_5.Visible = false;
        }
    }

    protected void check_shipmentQuantity()
    {
        lbl_7.Visible = true;

        getQtyShipped();
        getQtyOrdered();

        if (qtyShipped < qtyOrdered)
        {
            pass_7.Visible = false;
            fail_7.Visible = true;
        }
        else
        {
            pass_7.Visible = true;
            fail_7.Visible = false;
        }
    }

    protected void getQtyShipped()
    {
        string q = @"SELECT ISNULL(SUM(Quantity), 0)
                     FROM pLogic.dbo.ShipmentItems
                     WHERE MainReference = " + jobN + @"
                     AND ShipmentType IN (0,3)";

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    qtyShipped = Convert.ToInt32(command.ExecuteScalar() ?? 0);
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }
    }

    protected void getQtyOrdered()
    {
        string q = @"SELECT Quantity
                     FROM pLogic.dbo.OpenJob
                     WHERE JobN = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    qtyOrdered = Convert.ToInt32(command.ExecuteScalar());
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }
    }

    protected decimal get_quotedSales()
    {
        decimal temp = 0.00M;

        string q_getPref = @"SELECT QuotedSales
                             FROM pLogic.dbo.OpenJob
                             WHERE JobN = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q_getPref, conn);
                try
                {
                    command.Connection.Open();
                    temp = Convert.ToDecimal(command.ExecuteScalar() ?? 0);

                    conn.Close();
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        return temp;
    }

    protected void check_qsm()
    {
        lbl_10.Visible = true;

        if ((getCustPref_quotedSalesMax()) && (((decimal)jobMT[0]+(decimal)jobMT[6]) != get_quotedSales()))
        {
            pass_10.Visible = false;
            fail_10.Visible = true;
        }
        else
        {
            pass_10.Visible = true;
            fail_10.Visible = false;
        }
    }

    protected void check_compareTaxCodes_Diff()
    {
        lbl_13.Visible = true;

        int custTaxCode = getCustomerTaxCode(custNum);
        int jobTaxCode = getJobTaxCode(jobN);

        if ((jobTaxCode == 0) || (custTaxCode == 0))
        {
            pass_13.Visible = true;
            fail_13.Visible = false;
        }
        else if (jobTaxCode == custTaxCode)
        {
            pass_13.Visible = true;
            fail_13.Visible = false;
        }
        else if (jobTaxCode != custTaxCode)
        {
            pass_13.Visible = false;
            fail_13.Visible = true;
        }
        else
        {
            pass_13.Visible = true;
            fail_13.Visible = false;
        }
    }

    public int getCustomerTaxCode(int pCustN)
    {
        int temp = 0;
        string q = @"SELECT TOP 1 ISNULL(SalesTaxCode, 0)
                         FROM pLogic.dbo.Customer
                         WHERE CustomerN = " + pCustN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    temp = Convert.ToInt32((command.ExecuteScalar() ?? 0).ToString());

                    conn.Close();
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        return temp;
    }

    public int getJobTaxCode(int pJobN)
    {
        int temp = 0;
        string q = @"SELECT TOP 1 TaxCode
                         FROM pLogic.dbo.OpenJob
                         WHERE JobN = " + pJobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    temp = Convert.ToInt32(command.ExecuteScalar().ToString());

                    conn.Close();
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        return temp;
    }

    protected void check_OutsideBuys()
    {
        lbl_14.Visible = true;
        lbl_15.Visible = true;
        Job_itemInfo Job_ItemInfo = new Job_itemInfo(jobN);

        if ((Job_ItemInfo.ProductCode == 35) || (Job_ItemInfo.ProductCode == 40))
        {

            // 14.                              
            if (!check_DP_POexists())
            {
                pass_14.Visible = false;
                fail_14.Visible = true;
            }
            else
            {
                pass_14.Visible = true;
                fail_14.Visible = false;
            }

            // 15.                              
            if (!check_DP_comparePOtoQuoted())
            {
                pass_15.Visible = false;
                fail_15.Visible = true;
            }
            else
            {
                pass_15.Visible = true;
                fail_15.Visible = false;
            }
        }
        else
        {
            pass_15.Visible = true;
            pass_14.Visible = true;
        }
    }

    protected bool check_DP_POexists()
    {
        int temp = 0;
        string q = @"SELECT ISNULL(COUNT(*),0)
                     FROM pLogic.dbo.POItem
                     WHERE JobN = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    temp = Convert.ToInt32(command.ExecuteScalar());
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        if (temp > 0)
            return true;
        else
            return false;
    }

    protected bool check_DP_comparePOtoQuoted()
    {
        decimal d_po = 99999.00M;
        decimal d_quote = 99999.00M;

        string q = @"SELECT ISNULL(SUM(DollarAmount),0)
                             FROM pLogic.dbo.POItem
                             WHERE JobN = " + jobN + @"
                             AND JobCostPrefix != 2";

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    d_po = Convert.ToDecimal(command.ExecuteScalar() ?? 0.00M);
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        q = @"SELECT ISNULL(SUM(MT_PrintCharge),0)
                      FROM pLogic.dbo.CT_Job
                      WHERE JobN = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    d_quote = Convert.ToDecimal(command.ExecuteScalar() ?? 0.00M);
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
        }

        d_po *= 1.1M;

        if ((d_po == 99999.00M) ^ (d_quote == 99999.00M))
            return false;
        else if ((d_po == 0.00M) && (d_quote == 0.00M))
            return true;
        else if ((d_po == 0.00M) ^ (d_quote == 0.00M))
            return false;
        else
        {
            if (d_quote >= d_po)
                return true;
            else
                return false;
        }
    }

    public class Job_itemInfo
    {
        public string JobDescription;
        public int ProductCode;
        public decimal QuotedSales;
        public string ExtraJobInfo;
        public int TaxCode;
        public int Quantity;
        public int CustomerN;
        public string pti_desc = ""; // Never used

        public Job_itemInfo(int jobN)
        {
            getJobInfo(jobN);
        }

        /// <summary>
        /// Gets job information from OpenJob.
        /// </summary>
        /// <param name="jobN">Job Number in OpenJob</param>
        private void getJobInfo(int jobN)
        {
            string q = @"SELECT JobDescription, ProductCode, QuotedSales, ExtraJobInfo, TaxCode, Quantity, CustomerN
                             FROM pLogic.dbo.OpenJob
                             WHERE JobN = " + jobN;

            try
            {
                using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
                {
                    SqlCommand command = new SqlCommand(q, conn);
                    try
                    {
                        command.Connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            JobDescription = reader[0].ToString();
                            ProductCode = Convert.ToInt32(reader[1].ToString());
                            QuotedSales = Convert.ToDecimal(reader[2].ToString());
                            ExtraJobInfo = reader[3].ToString();
                            TaxCode = Convert.ToInt32(reader[4].ToString());
                            Quantity = Convert.ToInt32(reader[5].ToString());
                            CustomerN = Convert.ToInt32(reader[6].ToString());
                        }

                        conn.Close();
                    }
                    catch (Exception e)
                    {
                        Globals.Write_Magenta(e.ToString()); Console.Beep();
                    }
                }
            }
            catch (Exception e)
            {
                Globals.Write_Magenta(e.ToString()); Console.Beep();
            }

            if (TaxCode == 0)
            {
                getCustTaxCode();
            }
        }

        private void getCustTaxCode()
        {
            string q = @"SELECT TOP 1 SalesTaxCode
                         FROM pLogic.dbo.Customer
                         WHERE CustomerN = " + CustomerN;

            try
            {
                using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
                {
                    SqlCommand command = new SqlCommand(q, conn);
                    try
                    {
                        command.Connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            TaxCode = Convert.ToInt32(reader[0].ToString());
                        }

                        conn.Close();
                    }
                    catch (Exception e)
                    {
                        Globals.Write_Magenta(e.ToString()); Console.Beep();
                    }
                }
            }
            catch (Exception e)
            {
                Globals.Write_Magenta(e.ToString()); Console.Beep();
            }
        }
    }

    protected void check_billToOverride()
    {
        lbl_16.Visible = true;
        
        // 16.                               
        if ((getCustPref_billToOverride()) && (getBillContactCT().Equals("NO-NAME")))
        {
            pass_16.Visible = false;
            fail_16.Visible = true;
        }
        else
        {
            pass_16.Visible = true;
            fail_16.Visible = false;
        }
    }

    public string getBillContactCT()
    {
        string temp = "";

        string q = @"SELECT ISNULL(BillContact, 'NO-NAME')
                         FROM pLogic.dbo.CT_Job
                         WHERE JobN = " + jobN;

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    temp = command.ExecuteScalar().ToString();
                    if (temp == "")
                        temp = "NO-NAME";
                }
                catch (Exception e)
                {
                    set_statusError(e.ToString());
                    if (temp == "")
                        temp = "NO-NAME";
                }
            }
        }
        catch (Exception e)
        {
            set_statusError(e.ToString());
            if (temp == "")
                temp = "NO-NAME";
        }

        return temp;
    }
    #endregion                                                                                                                                                                      
}

#region Extra Classes
public class Globals
{
    ///
    /// CONNECTION STRING DECLARATIONS
    ///
    private static string logicConnString = "Data Source=SQL1;Initial Catalog=pLogic;User ID=FPGwebservice;Password=kissmygrits;Connect Timeout=160";
    //private static string logicConnString = "Data Source=SQL1;Initial Catalog=devLogic;User ID=FPGwebservice;Password=kissmygrits;Connect Timeout=160";
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


    ///
    /// SMTP CONNECTION SETTINGS
    /// 
    private static SmtpClient smtpClient = new SmtpClient("192.168.240.27");

    public static SmtpClient get_smtpClient
    {
        get { return Globals.smtpClient; }
    }


    ///
    /// SQL SERVER DATEFORMAT
    /// 
    private static string sqlDateFormat = "yyyy-MM-dd HH:mm:ss.fff";

    /// <summary>
    /// Returns the proper SQL Server DataFormat string in the yyyy-MM-dd HH:mm:ss.fff format
    /// </summary>
    public static string get_sqlDateFormat
    {
        get { return Globals.sqlDateFormat; }
    }

    private static string sqlShortDateFormat = "yyyy-MM-dd";

    /// <summary>
    /// Returns the proper SQL Server short DataFormat string in the yyyy-MM-dd format
    /// </summary>
    public static string get_sqlShortDateFormat
    {
        get { return Globals.sqlShortDateFormat; }
    }


    ///
    /// CUSTOM FUNCTIONS
    /// 
    public static class StringTool
    {
        /// <summary>
        /// Basic Truncate function that takes the source string and truncates it to the length specified. Verifies that the string is greater than the length.
        /// </summary>
        /// <param name="source">Source string to be truncated</param>
        /// <param name="length">Number of characters after which to truncate the source string</param>
        /// <returns>Returns the truncated source string</returns>
        public static string Truncate(string source, int length)
        {
            if (source.Length > length)
            {
                source = source.Substring(0, length);
            }
            return source;
        }

        /// <summary>
        /// Basic Truncate function that takes the source string and truncates it to the length specified.
        /// </summary>
        /// <param name="source">Source string to be truncated</param>
        /// <param name="length">Number of characters after which to truncate the source string</param>
        /// <returns>Returns the truncated source string</returns>
        public static string Truncate2(string source, int length)
        {
            return source.Substring(0, Math.Min(length, source.Length));
        }

        /// <summary>
        /// Escapes all single quotes in the source string with an additional single quote so that it can be used in a SQL statement.
        /// </summary>
        /// <param name="source">Source string possible containing single quotes</param>
        /// <returns>Source string with all single quotes escaped for use in SQL statement</returns>
        public static string RemoveApostrophes(string source)
        {
            return source.Replace("'", "''");
        }
    }

    public class RegexUtilities
    {
        bool invalid = false;

        public bool IsValidEmail(string strIn)
        {
            invalid = false;
            if (String.IsNullOrEmpty(strIn))
                return false;

            // Use IdnMapping class to convert Unicode domain names.
            strIn = Regex.Replace(strIn, @"(@)(.+)$", this.DomainMapper);
            if (invalid)
                return false;

            // Return true if strIn is in valid e-mail format.
            return Regex.IsMatch(strIn,
                   @"^(?("")(""[^""]+?""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                   @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9]{2,17}))$",
                   RegexOptions.IgnoreCase);
        }

        private string DomainMapper(Match match)
        {
            // IdnMapping class with default property values.
            IdnMapping idn = new IdnMapping();

            string domainName = match.Groups[2].Value;
            try
            {
                domainName = idn.GetAscii(domainName);
            }
            catch (ArgumentException)
            {
                invalid = true;
            }
            return match.Groups[1].Value + domainName;
        }
    }

    /// <summary>
    /// Looks for commonly misspelled words and replaces them with their appropriate corrections.
    /// </summary>
    /// <param name="test">Source string that could contain misspelled words.</param>
    /// <returns>Source string with corrected words.</returns>
    public static string fixWords(string test)
    {
        string pout = "";

        if (test.Contains("Brochur"))
            pout = test.Replace("Brochur", "Brochure");
        else if (test.Contains("brochur"))
            pout = test.Replace("brochur", "Brochure");
        else if (test.Contains("Broch"))
            pout = test.Replace("Broch", "Brochure");
        else
            pout = test;

        return pout;
    }



    /// 
    /// CONSOLE FUNCTIONS
    /// 
    public static void Write_Red(string value)
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_White(string value)
    {
        Console.ForegroundColor = ConsoleColor.White;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_Cyan(string value)
    {
        Console.ForegroundColor = ConsoleColor.Cyan;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_Yellow(string value)
    {
        Console.ForegroundColor = ConsoleColor.Yellow;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_Green(string value)
    {
        Console.ForegroundColor = ConsoleColor.Green;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_Magenta(string value)
    {
        Console.ForegroundColor = ConsoleColor.Magenta;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_Gray(string value)
    {
        Console.ForegroundColor = ConsoleColor.Gray;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_DarkGray(string value)
    {
        Console.ForegroundColor = ConsoleColor.DarkGray;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_DarkRed(string value)
    {
        Console.ForegroundColor = ConsoleColor.DarkRed;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_DarkYellow(string value)
    {
        Console.ForegroundColor = ConsoleColor.DarkYellow;
        Console.WriteLine(value);
        Console.ResetColor();
    }
    public static void Write_Highlight(string value)
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.BackgroundColor = ConsoleColor.White;
        Console.WriteLine(value);
        Console.BackgroundColor = ConsoleColor.Black;
        Console.ResetColor();
    }

    ///
    /// XML => CONSOLE 
    ///
    public static void ConsOut_Red(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.Red;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_Blue(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.Blue;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_Cyan(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.Cyan;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_DarkBlue(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.DarkBlue;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_DarkCyan(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.DarkCyan;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_DarkGray(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.DarkGray;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_DarkGreen(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.DarkGreen;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_DarkMagenta(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.DarkMagenta;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_DarkRed(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.DarkRed;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_DarkYellow(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.DarkYellow;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_Gray(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.Gray;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_Green(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.Green;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_Magenta(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.Magenta;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_White(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.White;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }
    public static void ConsOut_Yellow(XmlDocument xml)
    {
        Console.ForegroundColor = ConsoleColor.Yellow;
        xml.Save(Console.Out);
        Console.WriteLine(Environment.NewLine);
        Console.ResetColor();
    }

    /// <summary>
    /// Saves the XML Document to the hard drive
    /// </summary>
    /// <param name="xml">XML File</param>
    /// <param name="filename">Filename, up two directories and in an XML folder.</param>
    public static void saveXMLDocument(XmlDocument xml, string filename)
    {
        System.IO.FileInfo file = new System.IO.FileInfo("../../XML/");
        file.Directory.Create();

        if ((filename != "") && (filename != null))
        {
            xml.Save("../../XML/" + filename + ".xml");
        }
        else
        {
            xml.Save("../../XML/" + DateTime.Now.ToShortDateString() + ".xml");
        }
    }

    public static void ReadWriteStream(Stream readStream, Stream writeStream)
    {
        int Length = 256;
        Byte[] buffer = new Byte[Length];
        int bytesRead = readStream.Read(buffer, 0, Length);
        // write the required bytes
        while (bytesRead > 0)
        {
            writeStream.Write(buffer, 0, bytesRead);
            bytesRead = readStream.Read(buffer, 0, Length);
        }
        readStream.Close();
        writeStream.Close();
    }

    public static void pointlessFinelineASCII()
    {
        Write_Cyan(@"
                                 ___           ___           ___                    ___           ___     
      ___            ___        /  /\         /  /\         /  /\       ___        /  /\         /  /\    
     /  /\          /__/\      /  /::|       /  /::\       /  /:/      /__/\      /  /::|       /  /::\   
    /  /::\         \__\:\    /  /:|:|      /  /:/\:\     /  /:/       \__\:\    /  /:|:|      /  /:/\:\  
   /  /:/\:\        /  /::\  /  /:/|:|__   /  /::\ \:\   /  /:/        /  /::\  /  /:/|:|__   /  /::\ \:\ 
  /  /::\ \:\    __/  /:/\/ /__/:/ |:| /\ /__/:/\:\ \:\ /__/:/      __/  /:/\/ /__/:/ |:| /\ /__/:/\:\ \:\
 /__/:/\:\ \:\  /__/\/:/    \__\/  |:|/:/ \  \:\ \:\_\/ \  \:\     /__/\/:/    \__\/  |:|/:/ \  \:\ \:\_\/
 \__\/  \:\_\/  \  \::/         |  |:/:/   \  \:\ \:\    \  \:\    \  \::/         |  |:/:/   \  \:\ \:\  
      \  \:\     \  \:\         |__|::/     \  \:\_\/     \  \:\    \  \:\         |__|::/     \  \:\_\/  
       \__\/      \__\/         /__/:/       \  \:\        \  \:\    \__\/         /__/:/       \  \:\    
                                \__\/         \__\/         \__\/                  \__\/         \__\/   " + Environment.NewLine + Environment.NewLine);
    }

    public static void pointlessFinelineDevASCII()
    {
        Write_Green(@"  
  _____ ___ _   _ _____ _     ___ _   _ _____   ____  _______     __
 |  ___|_ _| \ | | ____| |   |_ _| \ | | ____| |  _ \| ____\ \   / /
 | |_   | ||  \| |  _| | |    | ||  \| |  _|   | | | |  _|  \ \ / / 
 |  _|  | || |\  | |___| |___ | || |\  | |___  | |_| | |___  \ V /  
 |_|   |___|_| \_|_____|_____|___|_| \_|_____| |____/|_____|  \_/   
                                                                    ");
    }
}

public class Overs
{
    public int qtyOvers;
    public int qtyShipped = 0;
    public int qtyOrdered = 0;
    public int oversPct = 3;
    private decimal oversPercentage = 0.03M;
    public int oversAllowed = 0;
    public decimal oversCost = 0.00M;
    public int thresholdAllowed = 0;
    private decimal thresholdPercentage = 1.20M;


    public void calculateOvers()
    {
        qtyOvers = qtyShipped - qtyOrdered;

        if (oversPct != 999)
        {
            oversPercentage = (decimal)oversPct / 100;
        }
        else
        {
            oversPercentage = 0.00M;
        }

        oversAllowed = (int)Math.Ceiling(oversPercentage * (decimal)qtyOrdered);
        thresholdAllowed = (int)Math.Ceiling(qtyOrdered * (decimal)thresholdPercentage);
    }
}
#endregion