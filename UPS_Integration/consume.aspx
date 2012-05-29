<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="consume.aspx.cs" Inherits="UPS_Integration_consume" Title="UPS Billing - File Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <p><a href="<%= Page.ResolveUrl("~")%>UPS_Integration/UPS_dashboard.aspx">Back</a></p>
	<h2>UPS Billing - File Processor </h2>
	<hr />
	<h3>Use the form below to upload the billing file received from UPS. If you have questions please contact <a href="mailto:shawnh@Finelink.com,%20keenan@finelink.com">dev@Finelink.com</a>. </h3>
	<asp:FileUpload id="FileUpload1" runat="server" Font-Bold="True"></asp:FileUpload>
            
       <br /><br />
       
       <asp:Button id="btnUpload" Text="Upload File" OnClick="UploadButton_Click" runat="server" BackColor="#66CCFF" Font-Bold="True" Font-Size="X-Large" Height="40px" Width="223px"></asp:Button>	
             
       <br /><br />
       
       <asp:Label id="lbl_status" runat="server"></asp:Label>  
       
       <br />
             
       <hr />
       
       <p><asp:Label ID="lbl_found" runat="server"></asp:Label></p>
	<p><img alt="" src="../Resources/LOGO_L.gif" style="width: 81px; height: 93px; position: absolute; top: 310px; left: 300px;" /></p>
       </asp:Content>

