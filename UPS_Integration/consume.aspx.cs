using System;
using System.Collections;
using System.Collections.Generic;
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
using System.IO;
using System.Text;
using System.Xml;
using System.Data.Sql;
using System.Data.SqlClient;


public partial class UPS_Integration_consume : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_status.Text = "";
        lbl_found.Text = "";
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        saveFile();
    }

    protected void saveFile()
    {
        if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
        {
            string fn = DateTime.Today.ToString("yyyy-MM-dd") + "_" + System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            string saveLocation = Server.MapPath("~\\App_Data") + "\\" + fn;
            string extension = Path.GetExtension(FileUpload1.FileName);
            if (extension == ".xml")
            {
                try
                {
                    FileUpload1.PostedFile.SaveAs(saveLocation);
                    XmlDocument xml = new XmlDocument();
                    xml.Load(FileUpload1.FileContent);
                    parseXML(xml);
                    status_green("Success - Your file was saved as " + fn);
                }
                catch (Exception err)
                {
                    status_red("Error: " + err.Message);
                }
            }
            else
            {
                status_red("Please specify a valid XML file for upload.");
            }
        }
        else
          status_red("Please specify a valid XML file for upload.");
    }

    protected void parseXML(XmlDocument xml)
    {
        string track = "";
        string logic = "";
        string ex = "";
        string excost = "";

        XmlNodeList details = xml.GetElementsByTagName("TransactionDetails");

        foreach (XmlNode node in details)
        {
            if (node["ChargeCategoryDetailCode"].InnerText == "ADC ")
            {
                string flip = node.OuterXml;
                XmlDocument newxml = new XmlDocument();
                newxml.LoadXml(flip);

                XmlNodeList shipments = newxml.GetElementsByTagName("Shipment");

                if (shipments.Count > 0)
                {
                    try
                    {
                        for (int i = 0; i < shipments.Count; i++)
                        {
                            for (int ii = 0; ii < shipments[i].ChildNodes.Count; ii++)
                            {
                                string temp = shipments[i].ChildNodes[ii].InnerText;
                                string name = shipments[i].ChildNodes[ii].Name;

                                switch (name)
                                {
                                    case "LeadShipmentNumber":
                                        track = temp;
                                        lbl_found.Text += "TrackingNumber: " + track + "<br />";
                                        break;
                                    case "Package":
                                        excost = shipments[i].ChildNodes[ii]["ChargeDetails"]["Charge"]["ChargeInformation"]["NetAmount"].InnerXml;
                                        lbl_found.Text += "ExceptionCost: $" + excost + "<br />";
                                        ex = shipments[i].ChildNodes[ii]["ChargeDetails"]["Charge"]["ChargeInformation"]["DescriptionOfCharges"].InnerXml;
                                        lbl_found.Text += "ExceptionDetail: " + ex + "<br />";
                                        break;
                                    case "ShipmentReferences":
                                        if (Convert.ToInt32(shipments[i].ChildNodes[ii]["Reference"]["Sequence"].InnerXml.ToString()) == 2)
                                        {
                                            logic = shipments[i].ChildNodes[ii]["Reference"]["ReferenceNumber"].InnerXml;
                                            lbl_found.Text += "Logic JobN: " + logic + "<br />";
                                        }
                                        break;
                                }
                            }
                            lbl_found.Text += "<br />";

                            int result = 0;

                            if ((track != null) && (track.Length > 0))
                            {
                                result = updateException_track(Convert.ToDecimal(excost), track);
                            }

                            if (result == 0)
                            {
                                result = updateException_ship(Convert.ToDecimal(excost), getShipmentFromTrackingNumber(track));
                            }

                            if (result == 0)
                            {
                                Helpers help = new Helpers();
                                help.sendEmail("ShawnH@Finelink.com", "<h1>UPS File Processer</h1><h3>Tracking#: " + track + "</h3><h3>Cost: $" + excost + "</h3><h3>Desc#: " + ex + "</h3><h3>Logic#: " + logic + "</h3>");
                                lbl_found.Text += "Email sent to ShawnH@Finelink.com for outlier handling.<br />";
                            }

                            lbl_found.Text += result + " rows updated in ExceptionLog<br /><br />";

                        }
                    }

                    catch (Exception err)
                    {
                        status_red("Error: " + err.Message);
                    }
                }
            }
        }
    }

    public int updateException_ship(decimal exceptionCost, int shipmentNumber)
    {
        int rowsInserted = 0;

        string q_error = @"UPDATE CT_UPS_ExceptionLog 
                           SET exceptionCost = '" + exceptionCost + @"'
                           WHERE shipmentNumber = '" + shipmentNumber + "'";

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_printableConnString))
            {
                SqlCommand command = new SqlCommand(q_error, conn);
                try
                {
                    command.Connection.Open();
                    rowsInserted = command.ExecuteNonQuery();
                    command.Dispose();
                    command = null;
                }
                catch (Exception e)
                {
                    lbl_status.ForeColor = System.Drawing.Color.Red;
                    lbl_status.Text = e.ToString();
                }
            }
        }
        catch (Exception e)
        {
            lbl_status.ForeColor = System.Drawing.Color.Red;
            lbl_status.Text = e.ToString();
        }

        return rowsInserted;
    }

    public int updateException_track(decimal exceptionCost, string trackingNumber)
    {
        int rowsInserted = 0;

        string q_error = @"UPDATE CT_UPS_ExceptionLog 
                           SET exceptionCost = '" + exceptionCost + @"'
                           WHERE trackingNumber = '" + trackingNumber + "'";

	    try
	    {
		    using (SqlConnection conn = new SqlConnection(Globals.get_printableConnString))
		    {
			    SqlCommand command = new SqlCommand(q_error, conn);
			    try
			    {
				    command.Connection.Open();
				    rowsInserted = command.ExecuteNonQuery();
				    command.Dispose();
				    command = null;
			    }
			    catch (Exception e)
                {
                    lbl_status.ForeColor = System.Drawing.Color.Red;
                    lbl_status.Text = e.ToString();
			    }
		    }
	    }
	    catch (Exception e)
        {
            lbl_status.ForeColor = System.Drawing.Color.Red;
            lbl_status.Text = e.ToString();
	    }

        return rowsInserted;
    }

    public int getShipmentFromTrackingNumber(string tracking)
    {
        int shipmentNumber = 0;

        string q = @"SELECT TOP 1 shipmentNum
                     FROM printable.dbo.CT_UPS_EODexport
                     WHERE trackingNum = '" + tracking + "'";

        try
        {
            using (SqlConnection conn = new SqlConnection(Globals.get_logicConnString))
            {
                SqlCommand command = new SqlCommand(q, conn);
                try
                {
                    command.Connection.Open();
                    shipmentNumber = Convert.ToInt32(command.ExecuteScalar() ?? 0);
                    conn.Close();
                }
                catch (Exception err)
                {
                    status_red("Error: " + err.Message);
                }
            }
        }
        catch (TimeoutException t)
        {
            status_red("Error: " + t.Message);
        }
        catch (Exception err)
        {
            status_red("Error: " + err.Message);
        }

        return shipmentNumber;
    }

    protected void status_red(string text)
    {
        lbl_status.ForeColor = System.Drawing.Color.Red;
        lbl_status.Text = text;
    }
    protected void status_green(string text)
    {
        lbl_status.ForeColor = System.Drawing.Color.Green;
        lbl_status.Text = text;
    }
}