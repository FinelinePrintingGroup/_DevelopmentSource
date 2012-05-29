<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="AutoInvoicing_logs.aspx.cs" Inherits="Reporting_AutoInvoicing_logs" Title="AutoInvoicing Logs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server"><h2>AutoInvoicing Logs</h2>
	<p><a href="<%= Page.ResolveUrl("~")%>AutoInvoicing/ControlPanel.aspx">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%= Page.ResolveUrl("~")%>AutoInvoicing/AUTO_errors.aspx">Error Log</a></p>
	<hr />
	<h3>Batch Schedule&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txt_batch" runat="server" Height="22px" Width="317px"></asp:TextBox>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="142px"><asp:ListItem>BatchNum</asp:ListItem>
			<asp:ListItem>CreateDate</asp:ListItem>
			<asp:ListItem>ScheduledPostDate</asp:ListItem>
			<asp:ListItem>Posted</asp:ListItem>
			<asp:ListItem>CustomerN</asp:ListItem>
			<asp:ListItem>BatchType</asp:ListItem>
			<asp:ListItem>LumpBatch</asp:ListItem>
		</asp:DropDownList>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btn_searchBatch" runat="server" OnClick="btn_searchBatch_Click" Text="Search" />
	</h3>
	<p><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="BatchNum" DataSourceID="BatchSchedule" ForeColor="Black" GridLines="Vertical" PageSize="15" Width="80%"><Columns>
		<asp:BoundField DataField="BatchNum" HeaderText="BatchNum" ReadOnly="True" SortExpression="BatchNum" />
		<asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
		<asp:BoundField DataField="ScheduledPostDate" HeaderText="ScheduledPostDate" SortExpression="ScheduledPostDate" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200px" />
		<asp:CheckBoxField DataField="Posted" HeaderText="Posted" SortExpression="Posted" />
		<asp:BoundField DataField="CustomerN" HeaderText="CustomerN" SortExpression="CustomerN" />
		<asp:BoundField DataField="BatchType" HeaderText="BatchType" SortExpression="BatchType" />
		<asp:CheckBoxField DataField="LumpBatch" HeaderText="LumpBatch" SortExpression="LumpBatch" />
		<asp:BoundField DataField="TimeIdentifier" HeaderText="TimeIdentifier" SortExpression="TimeIdentifier" />
	</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#CCCCCC" />
	</asp:GridView>
	</p>
	<p><hr />
		<h3>Hold Table&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txt_holdTable" runat="server" Width="300px"></asp:TextBox>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="drop_holdTable" runat="server" Width="152px"><asp:ListItem>JobN</asp:ListItem>
				<asp:ListItem>JobType</asp:ListItem>
				<asp:ListItem>CreateDate</asp:ListItem>
				<asp:ListItem>ReleaseDate</asp:ListItem>
				<asp:ListItem>Released</asp:ListItem>
			</asp:DropDownList>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
		</h3>
		<p><asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="JobN,JobType" DataSourceID="HoldTables" ForeColor="Black" GridLines="Vertical" Width="75%"><Columns>
			<asp:CommandField ShowEditButton="True" />
			<asp:BoundField DataField="JobN" HeaderText="JobN" ReadOnly="True" SortExpression="JobN" />
			<asp:BoundField DataField="JobType" HeaderText="JobType" ReadOnly="True" SortExpression="JobType" />
			<asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" ReadOnly="true" />
			<asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />
			<asp:CheckBoxField DataField="Released" HeaderText="Released" SortExpression="Released" />
		</Columns>
			<FooterStyle BackColor="#CCCCCC" />
			<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
			<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
			<AlternatingRowStyle BackColor="#CCCCCC" />
		</asp:GridView>
			<asp:SqlDataSource ID="HoldTables" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" DeleteCommand="DELETE FROM [CT_AUTO_HoldTable] WHERE [JobN] = @original_JobN AND [JobType] = @original_JobType AND [CreateDate] = @original_CreateDate AND [ReleaseDate] = @original_ReleaseDate AND [Released] = @original_Released" InsertCommand="INSERT INTO [CT_AUTO_HoldTable] ([JobN], [JobType], [CreateDate], [ReleaseDate], [Released]) VALUES (@JobN, @JobType, @CreateDate, @ReleaseDate, @Released)" SelectCommand="SELECT * FROM [CT_AUTO_HoldTable] ORDER BY [CreateDate] DESC, [JobN] DESC" UpdateCommand="UPDATE [CT_AUTO_HoldTable] SET [ReleaseDate] = @ReleaseDate, [Released] = @Released WHERE [JobN] = @original_JobN AND [JobType] = @original_JobType AND [CreateDate] = @original_CreateDate AND [ReleaseDate] = @original_ReleaseDate AND [Released] = @original_Released" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}"><DeleteParameters>
				<asp:Parameter Name="original_JobN" Type="Int32" />
				<asp:Parameter Name="original_JobType" Type="Int32" />
				<asp:Parameter DbType="DateTime" Name="original_CreateDate" />
				<asp:Parameter DbType="DateTime" Name="original_ReleaseDate" />
				<asp:Parameter Name="original_Released" Type="Boolean" />
			</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter DbType="DateTime" Name="ReleaseDate" />
					<asp:Parameter Name="Released" Type="Boolean" />
					<asp:Parameter Name="original_JobN" Type="Int32" />
					<asp:Parameter Name="original_JobType" Type="Int32" />
					<asp:Parameter DbType="DateTime" Name="original_CreateDate" />
					<asp:Parameter DbType="DateTime" Name="original_ReleaseDate" />
					<asp:Parameter Name="original_Released" Type="Boolean" />
				</UpdateParameters>
				<InsertParameters>
					<asp:Parameter Name="JobN" Type="Int32" />
					<asp:Parameter Name="JobType" Type="Int32" />
					<asp:Parameter DbType="DateTime" Name="CreateDate" />
					<asp:Parameter DbType="DateTime" Name="ReleaseDate" />
					<asp:Parameter Name="Released" Type="Boolean" />
				</InsertParameters>
			</asp:SqlDataSource>
		</p>
		<hr />
		<h3>Invoice Log&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txt_invoice" runat="server" Height="22px" Width="317px"></asp:TextBox>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList2" runat="server" Height="22px" Width="142px"><asp:ListItem Value="OrderN">Job/Order</asp:ListItem>
				<asp:ListItem>WIKey</asp:ListItem>
				<asp:ListItem>InvoiceN</asp:ListItem>
				<asp:ListItem>CreateDate</asp:ListItem>
				<asp:ListItem>OrderType</asp:ListItem>
				<asp:ListItem>BatchNumber</asp:ListItem>
				<asp:ListItem>CustPON</asp:ListItem>
				<asp:ListItem>CustomerN</asp:ListItem>
				<asp:ListItem>Posted</asp:ListItem>
			</asp:DropDownList>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btn_searchInvoice" runat="server" OnClick="btn_searchInvoice_Click" Text="Search" />
		</h3>
		<p><asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="OrderN,WIKey,InvoiceN,CreateDate,OrderType" DataSourceID="InvoiceLog" ForeColor="Black" GridLines="Vertical" PageSize="15" Width="100%"><Columns>
			<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
			<asp:BoundField DataField="OrderN" HeaderText="OrderN" ReadOnly="True" SortExpression="OrderN" />
			<asp:BoundField DataField="WIKey" HeaderText="WIKey" ReadOnly="True" SortExpression="WIKey" />
			<asp:BoundField DataField="InvoiceN" HeaderText="InvoiceN" ReadOnly="True" SortExpression="InvoiceN" />
			<asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" ReadOnly="True" />
			<asp:BoundField DataField="OrderType" HeaderText="OrderType" ReadOnly="True" SortExpression="OrderType" />
			<asp:BoundField DataField="BatchNumber" HeaderText="BatchNumber" SortExpression="BatchNumber" />
			<asp:BoundField DataField="CustPON" HeaderText="CustPON" SortExpression="CustPON" />
			<asp:BoundField DataField="CustomerN" HeaderText="CustomerN" SortExpression="CustomerN" />
			<asp:CheckBoxField DataField="Posted" HeaderText="Posted" SortExpression="Posted" />
		</Columns>
			<FooterStyle BackColor="#CCCCCC" />
			<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
			<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
			<AlternatingRowStyle BackColor="#CCCCCC" />
		</asp:GridView>
		</p>
		<hr />
		<h3>Invoice Log - Deleted&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txt_invoice0" runat="server" Height="22px" Width="317px"></asp:TextBox>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList4" runat="server" Height="22px" Width="142px"><asp:ListItem Value="OrderN">Job/Order</asp:ListItem>
				<asp:ListItem>WIKey</asp:ListItem>
				<asp:ListItem>InvoiceN</asp:ListItem>
				<asp:ListItem>CreateDate</asp:ListItem>
				<asp:ListItem>OrderType</asp:ListItem>
				<asp:ListItem>BatchNumber</asp:ListItem>
				<asp:ListItem>CustPON</asp:ListItem>
				<asp:ListItem>CustomerN</asp:ListItem>
				<asp:ListItem>Posted</asp:ListItem>
				<asp:ListItem>DeletedDate</asp:ListItem>
			</asp:DropDownList>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btn_searchInvoice0" runat="server" OnClick="btn_searchInvoice0_Click" Text="Search" />
		</h3>
		<p><asp:GridView ID="GridView4" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="OrderN,WIKey,InvoiceN,CreateDate,OrderType" DataSourceID="InvoiceLogDeleted" ForeColor="Black" GridLines="Vertical"><Columns>
			<asp:BoundField DataField="OrderN" HeaderText="OrderN" ReadOnly="True" SortExpression="OrderN" />
			<asp:BoundField DataField="WIKey" HeaderText="WIKey" ReadOnly="True" SortExpression="WIKey" />
			<asp:BoundField DataField="InvoiceN" HeaderText="InvoiceN" ReadOnly="True" SortExpression="InvoiceN" />
			<asp:BoundField DataField="CreateDate" HeaderText="CreateDate" ReadOnly="True" SortExpression="CreateDate" />
			<asp:BoundField DataField="OrderType" HeaderText="OrderType" ReadOnly="True" SortExpression="OrderType" />
			<asp:BoundField DataField="BatchNumber" HeaderText="BatchNumber" SortExpression="BatchNumber" />
			<asp:BoundField DataField="CustPON" HeaderText="CustPON" SortExpression="CustPON" />
			<asp:BoundField DataField="CustomerN" HeaderText="CustomerN" SortExpression="CustomerN" />
			<asp:CheckBoxField DataField="Posted" HeaderText="Posted" SortExpression="Posted" />
			<asp:BoundField DataField="DeletedDate" HeaderText="DeletedDate" SortExpression="DeletedDate" />
		</Columns>
			<FooterStyle BackColor="#CCCCCC" />
			<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
			<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
			<AlternatingRowStyle BackColor="#CCCCCC" />
		</asp:GridView>
			<asp:SqlDataSource ID="InvoiceLogDeleted" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT * FROM [CT_AUTO_InvoiceLog_Deleted] ORDER BY [DeletedDate] DESC"></asp:SqlDataSource>
		</p>
		<hr />
		<h3>Alert Job Notification Log&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txt_alert" runat="server" Height="22px" Width="317px"></asp:TextBox>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList3" runat="server" Height="22px" Width="142px"><asp:ListItem>id</asp:ListItem>
				<asp:ListItem>alertDate</asp:ListItem>
				<asp:ListItem>reasonCode</asp:ListItem>
				<asp:ListItem Value="prodPlanner">CSR</asp:ListItem>
				<asp:ListItem>jobN</asp:ListItem>
				<asp:ListItem Value="alertNum">Notification #</asp:ListItem>
			</asp:DropDownList>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btn_searchAlert" runat="server" OnClick="btn_searchAlert_Click" Text="Search" />
			&nbsp;&nbsp;&nbsp; </h3>
		<p><asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="AlertJobLog" ForeColor="Black" GridLines="Vertical" PageSize="15" Width="50%"><Columns>
			<asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
			<asp:BoundField DataField="alertDate" HeaderText="alertDate" SortExpression="alertDate" />
			<asp:BoundField DataField="reasonCode" HeaderText="reasonCode" SortExpression="reasonCode" />
			<asp:BoundField DataField="prodPlanner" HeaderText="CSR" SortExpression="prodPlanner" />
			<asp:BoundField DataField="jobN" HeaderText="jobN" SortExpression="jobN" />
			<asp:BoundField DataField="alertNum" HeaderText="Notification #" SortExpression="alertNum" />
		</Columns>
			<FooterStyle BackColor="#CCCCCC" />
			<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
			<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
			<AlternatingRowStyle BackColor="#CCCCCC" />
		</asp:GridView>
			<asp:SqlDataSource ID="AlertJobLog" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT * FROM [CT_AUTO_AlertJobLog] ORDER BY [id] DESC"></asp:SqlDataSource>
		</p>
		<p>
			<asp:SqlDataSource ID="InvoiceLog" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT * FROM [CT_AUTO_InvoiceLog] ORDER BY [CreateDate] DESC" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [CT_AUTO_InvoiceLog] WHERE [OrderN] = @original_OrderN AND [WIKey] = @original_WIKey AND [InvoiceN] = @original_InvoiceN AND [CreateDate] = @original_CreateDate AND [OrderType] = @original_OrderType AND [BatchNumber] = @original_BatchNumber AND (([CustPON] = @original_CustPON) OR ([CustPON] IS NULL AND @original_CustPON IS NULL)) AND [CustomerN] = @original_CustomerN AND [Posted] = @original_Posted" InsertCommand="INSERT INTO [CT_AUTO_InvoiceLog] ([OrderN], [WIKey], [InvoiceN], [CreateDate], [OrderType], [BatchNumber], [CustPON], [CustomerN], [Posted]) VALUES (@OrderN, @WIKey, @InvoiceN, @CreateDate, @OrderType, @BatchNumber, @CustPON, @CustomerN, @Posted)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [CT_AUTO_InvoiceLog] SET [BatchNumber] = @BatchNumber, [CustPON] = @CustPON, [CustomerN] = @CustomerN, [Posted] = @Posted WHERE [OrderN] = @original_OrderN AND [WIKey] = @original_WIKey AND [InvoiceN] = @original_InvoiceN AND [CreateDate] = @original_CreateDate AND [OrderType] = @original_OrderType AND [BatchNumber] = @original_BatchNumber AND (([CustPON] = @original_CustPON) OR ([CustPON] IS NULL AND @original_CustPON IS NULL)) AND [CustomerN] = @original_CustomerN AND [Posted] = @original_Posted"><DeleteParameters>
				<asp:Parameter Name="original_OrderN" Type="Int32" />
				<asp:Parameter Name="original_WIKey" Type="Int32" />
				<asp:Parameter Name="original_InvoiceN" Type="Int32" />
				<asp:Parameter DbType="DateTime" Name="original_CreateDate" />
				<asp:Parameter Name="original_OrderType" Type="Int32" />
				<asp:Parameter Name="original_BatchNumber" Type="Int32" />
				<asp:Parameter Name="original_CustPON" Type="String" />
				<asp:Parameter Name="original_CustomerN" Type="Int32" />
				<asp:Parameter Name="original_Posted" Type="Boolean" />
			</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="BatchNumber" Type="Int32" />
					<asp:Parameter Name="CustPON" Type="String" />
					<asp:Parameter Name="CustomerN" Type="Int32" />
					<asp:Parameter Name="Posted" Type="Boolean" />
					<asp:Parameter Name="original_OrderN" Type="Int32" />
					<asp:Parameter Name="original_WIKey" Type="Int32" />
					<asp:Parameter Name="original_InvoiceN" Type="Int32" />
					<asp:Parameter DbType="DateTime" Name="original_CreateDate" />
					<asp:Parameter Name="original_OrderType" Type="Int32" />
					<asp:Parameter Name="original_BatchNumber" Type="Int32" />
					<asp:Parameter Name="original_CustPON" Type="String" />
					<asp:Parameter Name="original_CustomerN" Type="Int32" />
					<asp:Parameter Name="original_Posted" Type="Boolean" />
				</UpdateParameters>
				<InsertParameters>
					<asp:Parameter Name="OrderN" Type="Int32" />
					<asp:Parameter Name="WIKey" Type="Int32" />
					<asp:Parameter Name="InvoiceN" Type="Int32" />
					<asp:Parameter DbType="DateTime" Name="CreateDate" />
					<asp:Parameter Name="OrderType" Type="Int32" />
					<asp:Parameter Name="BatchNumber" Type="Int32" />
					<asp:Parameter Name="CustPON" Type="String" />
					<asp:Parameter Name="CustomerN" Type="Int32" />
					<asp:Parameter Name="Posted" Type="Boolean" />
				</InsertParameters>
			</asp:SqlDataSource>
		</p>
		<p>
			<asp:SqlDataSource ID="BatchSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT * FROM [CT_AUTO_BatchSchedule] ORDER BY [BatchNum] DESC"></asp:SqlDataSource>
		</p>
</asp:Content>
