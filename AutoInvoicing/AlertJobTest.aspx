<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AlertJobTest.aspx.cs" Inherits="AutoInvoicing_AlertJobTest" Title="AlertJob Testing Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<style type="text/css">
		.style1
		{
			color: #FF0000;
			font-weight: bold;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<h2>AlertJob Testing Page</h2>
	<p><a href="<%= Page.ResolveUrl("~")%>AutoInvoicing/ControlPanel.aspx">Back</a></p>
	<p>Use this page to test if a Job/Order will pass the upcoming round of AlertJobs.</p>
	<p class="style1">FG tests will be implemented soon.</p>
	<div>
		<div style="float:left; padding:10px; vertical-align:middle; height: 60px;">
			<asp:Label ID="lbl_JobN" runat="server" Font-Bold="True" style="text-align: right" Text="Job#: " Width="125px"></asp:Label>
			<asp:TextBox ID="txt_JobN" runat="server" Width="200px"></asp:TextBox>
			<br />
			<asp:Label ID="lbl_FGOrderN" runat="server" Font-Bold="True" style="text-align: right" Text="FG Order#: " Width="125px"></asp:Label>
			<asp:TextBox ID="txt_FGOrderN" runat="server" Width="200px" Enabled="false"></asp:TextBox>
		</div>
		<div style="float:left; padding:10px; height: 60px; vertical-align: middle; text-align: center;">
			<asp:Button ID="btn_go" runat="server" Text="Run Tests" BackColor="#FF9933" Font-Bold="True" Font-Size="Large" Height="45px" Width="150px" onclick="btn_go_Click" />
		</div>
		<div style="float:left; padding:10px; height: 60px; width: 33%;">
			<asp:Label ID="X_lbl_status" runat="server" Font-Bold="True">Status: </asp:Label>
			<asp:Label ID="lbl_status" runat="server" Font-Bold="True"></asp:Label>
		</div>
	</div>
	
	<div style="clear:both;">
	<hr />
		<p>
			
			<asp:Label ID="pass_1" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right" ></asp:Label>
			
			<asp:Label ID="fail_1" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_1" runat="server" Font-Bold="True" Text="1. No cost on the billing worksheet (BWS)?" Width="500px" style="text-align: left" Visible="False" ></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_2" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_2" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_2" runat="server" Font-Bold="True" Text="2. Job contains a revised estimate?" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_3" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_3" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_3" runat="server" Font-Bold="True" Text="3. Job has AA Alts with no Alts $ on the BWS?" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_4" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_4" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_4" runat="server" Font-Bold="True" Text="4. Customer requires a PO for invoicing?" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_5" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_5" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_5" runat="server" Font-Bold="True" Text="5. Job has WF labor with no WF $ on the BWS?" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_6" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_6" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_6" runat="server" Font-Bold="True" Text="6. NOT IMPLEMENTED YET (Phase 2)" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_7" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_7" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_7" runat="server" Font-Bold="True" Text="7. Job has a discrepancy between shipping / ordered?" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_8" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_8" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_8" runat="server" Font-Bold="True" Text="8. Job has Overs with no Overs $ on the BWS" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_9" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_9" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_9" runat="server" Font-Bold="True" Text="9. Job has more than 20% Overs." Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_10" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_10" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_10" runat="server" Font-Bold="True" Text="10. QSM job has a discrepancy between QuotedSales and BWS?" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
			
			<asp:Label ID="pass_11" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_11" runat="server" Font-Bold="True" ForeColor="#CC9900" Text="Warning" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_11" runat="server" Font-Bold="True" Text="11. Overs exceed CustPref and will be charged by BWS amount?" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />	
			
			<asp:Label ID="pass_12" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_12" runat="server" Font-Bold="True" ForeColor="#CC9900" Text="Warning" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="lbl_12" runat="server" Font-Bold="True" Text="12. Overs exceed CustPref and will be charged $0, BWS trigger" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
				
			<asp:Label ID="pass_13" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_13" runat="server" Font-Bold="True" ForeColor="#CC9900" Text="Warning" Visible="False" Width="70px" style="text-align: right"></asp:Label>
				
			<asp:Label ID="lbl_13" runat="server" Font-Bold="True" Text="13. Tax Codes are different on job and customer file?" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
				
			<asp:Label ID="pass_14" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_14" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
				
			<asp:Label ID="lbl_14" runat="server" Font-Bold="True" Text="14. Outside Buy - Direct Purchase order exists." Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
				
			<asp:Label ID="pass_15" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_15" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
				
			<asp:Label ID="lbl_15" runat="server" Font-Bold="True" Text="15. Outside Buy - Direct Purchase order pricing." Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
			<br />
				
			<asp:Label ID="pass_16" runat="server" Font-Bold="True" ForeColor="#009900" Text="Passed" Visible="False" Width="70px" style="text-align: right"></asp:Label>
			
			<asp:Label ID="fail_16" runat="server" Font-Bold="True" ForeColor="#CC9900" Text="Warning" Visible="False" Width="70px" style="text-align: right"></asp:Label>
				
			<asp:Label ID="lbl_16" runat="server" Font-Bold="True" Text="16. Customer requires 'Bill To' override" Width="500px" style="text-align: left" Visible="False"></asp:Label>
			
		</p>
		<p>
			
			<asp:Label ID="lbl_done" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#000099" Text="Done" Visible="false"></asp:Label>
			<asp:Label ID="lbl_error" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#CC9900" Text="Error" Visible="false"></asp:Label>
			
			<br />
		</p>
	</div>
</asp:Content>

