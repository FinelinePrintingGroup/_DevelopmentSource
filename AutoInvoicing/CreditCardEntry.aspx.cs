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
using System.Data.SqlTypes;
using System.Reflection;
using System.ComponentModel;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Text;

public partial class AutoInvoicing_CreditCardEntry : System.Web.UI.Page
{
    protected int ref1;
    protected string ref2;
    protected string ref3;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void insertRefRecord(int r1, string r2, string r3)
    {
        string q = @"INSERT INTO CT_Ref
                         VALUES ('" + r1 + "', EncryptByPassPhrase('F!neline25', '" + r2 + "'),'" + r3 + "')";
        try
        {
            using (SqlConnection conn = new SqlConnection("Data Source=SQL1; Initial Catalog=printable; User ID=FPGwebservice; Password=kissmygrits"))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    int rowsInserted = 0;
                    command.Connection.Open();
                    rowsInserted = command.ExecuteNonQuery();
                    command.Dispose();
                    command = null;
                    Console.WriteLine(rowsInserted + " rows inserted.");
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
    }

    public void getRefRecord(int r1)
    {
        string q = @"SELECT ref1, DecryptByPassPhrase('F!neline25',ref2), ref3
                     FROM CT_Ref
                     WHERE ref1 = " + r1;
        try
        {
            using (SqlConnection conn = new SqlConnection("Data Source=SQL1; Initial Catalog=printable; User ID=FPGwebservice; Password=kissmygrits"))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            this.ref1 = Convert.ToInt32(reader[0].ToString());
                            this.ref2 = Encoding.ASCII.GetString((byte[])reader[1]);
                            this.ref3 = reader[2].ToString();

                            Console.WriteLine("JobN: " + ref1);
                            Console.WriteLine("CC #: " + ref2);
                            Console.WriteLine("CV2 : " + ref3);
                        }
                    }

                }
                catch (Exception e)
                {
                    Console.WriteLine(e.ToString());
                }
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
    }
    
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        Int32.TryParse(txt_jobN.Text, out this.ref1);
        this.ref2 = txt_cc.Text;
        this.ref3 = txt_cv2.Text;

        try
        {
            insertRefRecord(this.ref1, this.ref2, this.ref3);
            lbl_status.ForeColor = System.Drawing.Color.Green;
            lbl_status.Text = "Success!";
            lbl_status0.Text = lbl_status.Text;
            txt_cc.Text = "";
            txt_cv2.Text = "";
            txt_jobN.Text = "";
        }
        catch (Exception ex)
        {
            lbl_status.ForeColor = System.Drawing.Color.Red;
            lbl_status.Text = "Error, contact Dev@Finelink.com";
            lbl_status0.Text = lbl_status.Text;
            Helpers help = new Helpers();
            help.sendEmail("ShawnH@Finelink.com", String.Format("JobN: {0}<br />CC#: {1}<br />CV@: {2}<br />Error: {3}", this.ref1, this.ref2, this.ref3, ex.ToString()));

        }

    }
}
