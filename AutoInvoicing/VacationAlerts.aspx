<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VacationAlerts.aspx.cs" Inherits="AutoInvoicing_VacationAlerts" Title="Vacation Alerts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server"><h2>CSR Vacation Notification Redirect</h2>
	<p><a href="<%= Page.ResolveUrl("~")%>AutoInvoicing/ControlPanel.aspx">Back</a></p>
	<p>Use this page to redirect AlertJob emails while individuals are on vacation.</p>
	<p>
	<asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ProdPlanner" DataSourceID="ProdPlannerAdmin" ForeColor="Black" GridLines="Vertical" Width="80%">
		<Columns>
			<asp:CommandField ShowEditButton="True" />
			<asp:BoundField DataField="ProdPlanner" HeaderText="ProdPlanner#" ReadOnly="True" SortExpression="ProdPlanner" />
			<asp:BoundField DataField="PlannerName" HeaderText="Planner Name" ReadOnly="True" SortExpression="PlannerName" />
			<asp:CheckBoxField DataField="OnVacation" HeaderText="On Vacation?" SortExpression="OnVacation" />
			<asp:BoundField DataField="RedirectTo" HeaderText="RedirectTo (Email)" SortExpression="RedirectTo" />
			<asp:BoundField DataField="MailAlias" HeaderText="Mail Alias" ReadOnly="True" SortExpression="MailAlias" />
		</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#CCCCCC" />
	</asp:GridView>
		<asp:SqlDataSource ID="ProdPlannerAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT * FROM [vw_AUTO_ProdPlannerAdmin]" UpdateCommand="UPDATE CT_AUTO_ProdPlannerAdmin SET OnVacation=@OnVacation, RedirectTo=@RedirectTo WHERE ProdPlanner=@ProdPlanner"></asp:SqlDataSource>
	</p>
</asp:Content>
