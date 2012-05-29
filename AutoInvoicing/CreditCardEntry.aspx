<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreditCardEntry.aspx.cs" Inherits="AutoInvoicing_CreditCardEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Secure Credit Card Entry Page</title>
</head>
<body style="font-family: Calibri, Arial, Arial Black;">
	<form id="form1" runat="server" style="text-align: center;">
	<div style="background-color: White; height: 375px; width: 600px; margin-left: auto; margin-right: auto; margin-top: 100px; border: solid 8px gray;">
		<h1>Fineline Secure Credit Card Entry</h1>
		<p><b>Please insert the credit card number in the ####-####-####-#### format along with its respective job number.</b></p>
		<div style="text-align: left;">
			<p>
				<asp:Label ID="lbl_jobN" runat="server" Text="Job Number: " Width="150px" Style="text-align: right; margin-right: 10px; margin-left: 50px;"></asp:Label>
				<asp:TextBox ID="txt_jobN" runat="server" Width="200px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_jobN" ErrorMessage="Job Number Required">*</asp:RequiredFieldValidator>
				<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txt_jobN" ErrorMessage="Job Number must be numeric." MaximumValue="9999999" MinimumValue="1000" Type="Integer">*</asp:RangeValidator>
			</p>
			<p>
				<asp:Label ID="lbl_cc" runat="server" Text="Credit Card Number: " Width="150px" Style="text-align: right; margin-right: 10px; margin-left: 50px;"></asp:Label>
				<asp:TextBox ID="txt_cc" runat="server" Width="300px"></asp:TextBox>
				<asp:RegularExpressionValidator ID="valid_ccFormat" runat="server" ControlToValidate="txt_cc" ErrorMessage="Invalid credit card number. Please verify." SetFocusOnError="True" ValidationExpression="^((4\d{3})|(5[1-5]\d{2})|(6011)|(34\d{1})|(37\d{1}))-?\d{4}-?\d{4}-?\d{4}|3[4,7][\d\s-]{15}$">*</asp:RegularExpressionValidator>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_cc" ErrorMessage="Credit Card Number Required.">*</asp:RequiredFieldValidator>
			</p>
			
			<p>
				<asp:Label ID="lbl_cv2" runat="server" Text="Security Code: " Width="150px" Style="text-align: right; margin-right: 10px; margin-left: 50px;"></asp:Label>
				<asp:TextBox ID="txt_cv2" runat="server" Width="100px"></asp:TextBox>				
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_cv2" ErrorMessage="Security Code Required">*</asp:RequiredFieldValidator>
			</p>
			<p style="text-align: center; vertical-align: middle;">
				<asp:Label ID="lbl_status0" runat="server" ForeColor="White"></asp:Label>
				<asp:Button ID="btn_submit" runat="server" Text="Submit" BackColor="#333333" BorderColor="Black" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="45px" Width="116px" onclick="btn_submit_Click" />
				<asp:Label ID="lbl_status" runat="server"></asp:Label>
			</p>
			<asp:ValidationSummary ID="ValidationSummary1" runat="server" />
		</div>
	</div>
	</form>
	
	<img alt="X" src="../Resources/diamondPlate.png" height="130%" width="130%" style="overflow:hidden; position:fixed; left:-20px; top:-20px; z-index:-99999" />

</body>
</html>
