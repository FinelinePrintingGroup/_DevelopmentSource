<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AUTO_errors.aspx.cs" Inherits="ErrorLogs_AUTO_errors" Title="AUTO Error Log" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server"><h4>This is the error logs page for the AutoInvoicing applications.</h4>
	<p><a href="<%= Page.ResolveUrl("~")%>AutoInvoicing/ControlPanel.aspx">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%= Page.ResolveUrl("~")%>AutoInvoicing/AutoInvoicing_logs.aspx">AutoInvoicing Logs</a> </p>
	<p><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="errID" DataSourceID="Printable" ForeColor="Black" GridLines="Vertical" PageSize="50" RowHeaderColumn="errID" Style="font-size:smaller" Width="100%"><Columns>
		<asp:BoundField DataField="errID" HeaderText="errID" InsertVisible="False" ReadOnly="True" SortExpression="errID" />
		<asp:BoundField DataField="errDate" HeaderText="errDate" SortExpression="errDate" />
		<asp:BoundField DataField="errNum" HeaderText="errNum" SortExpression="errNum" />
		<asp:BoundField DataField="errMsg" HeaderText="errMsg" SortExpression="errMsg" />
		<asp:BoundField DataField="errDesc" HeaderText="errDesc" SortExpression="errDesc" />
		<asp:BoundField DataField="batchNum" HeaderText="batchNum" SortExpression="batchNum" />
		<asp:BoundField DataField="invoiceNum" HeaderText="invoiceNum" SortExpression="invoiceNum" />
		<asp:BoundField DataField="WIKey" HeaderText="WIKey" SortExpression="WIKey" />
	</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#CCCCCC" />
	</asp:GridView>
	</p>
	<p>
		<asp:SqlDataSource ID="Printable" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT * FROM [CT_AUTO_ErrorLog] ORDER BY [errID] DESC"></asp:SqlDataSource>
	</p>
</asp:Content>
