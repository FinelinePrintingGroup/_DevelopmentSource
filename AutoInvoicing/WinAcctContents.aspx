<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WinAcctContents.aspx.cs" Inherits="AutoInvoicing_WinAcctContents" Title="WinAcct Contents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<h2>WinAcct Contents</h2>
    <p><a href="<%= Page.ResolveUrl("~")%>AutoInvoicing/ControlPanel.aspx">Back</a></p>
<hr />
<h3>WinAcctBatch</h3>
<p><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="BatchNo" DataSourceID="WinAcctBatch" ForeColor="Black" GridLines="Vertical" Width="100%"><Columns>
	<asp:BoundField DataField="BatchNo" HeaderText="BatchNo" ReadOnly="True" SortExpression="BatchNo" />
	<asp:BoundField DataField="PostingDate" HeaderText="PostingDate" SortExpression="PostingDate" />
	<asp:BoundField DataField="CheckSum" HeaderText="CheckSum" SortExpression="CheckSum" />
	<asp:BoundField DataField="Logname" HeaderText="Logname" SortExpression="Logname" />
	<asp:BoundField DataField="BatchStatus" HeaderText="BatchStatus" SortExpression="BatchStatus" />
	<asp:BoundField DataField="TypeOfBatch" HeaderText="TypeOfBatch" SortExpression="TypeOfBatch" />
	<asp:BoundField DataField="PayThruDate" HeaderText="PayThruDate" SortExpression="PayThruDate" />
	<asp:BoundField DataField="NextPmtDate" HeaderText="NextPmtDate" SortExpression="NextPmtDate" />
	<asp:BoundField DataField="SourceOfBatch" HeaderText="SourceOfBatch" SortExpression="SourceOfBatch" />
	</Columns>
	<FooterStyle BackColor="#CCCCCC" />
	<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
	<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
	<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
	<AlternatingRowStyle BackColor="#CCCCCC" />
	</asp:GridView>
	<asp:SqlDataSource ID="WinAcctBatch" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:pLogicConnectionString %>" DeleteCommand="DELETE FROM [WinAcctBatch] WHERE [BatchNo] = @original_BatchNo AND [PostingDate] = @original_PostingDate AND [AcctGroup] = @original_AcctGroup AND (([Division] = @original_Division) OR ([Division] IS NULL AND @original_Division IS NULL)) AND [CheckSum] = @original_CheckSum AND [Logname] = @original_Logname AND [BatchStatus] = @original_BatchStatus AND [TypeOfBatch] = @original_TypeOfBatch AND [DatePostRan] = @original_DatePostRan AND [PayThruDate] = @original_PayThruDate AND [NextPmtDate] = @original_NextPmtDate AND [SourceOfBatch] = @original_SourceOfBatch AND [AutoPost] = @original_AutoPost" InsertCommand="INSERT INTO [WinAcctBatch] ([BatchNo], [PostingDate], [AcctGroup], [Division], [CheckSum], [Logname], [BatchStatus], [TypeOfBatch], [DatePostRan], [PayThruDate], [NextPmtDate], [SourceOfBatch], [AutoPost]) VALUES (@BatchNo, @PostingDate, @AcctGroup, @Division, @CheckSum, @Logname, @BatchStatus, @TypeOfBatch, @DatePostRan, @PayThruDate, @NextPmtDate, @SourceOfBatch, @AutoPost)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [WinAcctBatch] ORDER BY [BatchNo] DESC" UpdateCommand="UPDATE [WinAcctBatch] SET [PostingDate] = @PostingDate, [AcctGroup] = @AcctGroup, [Division] = @Division, [CheckSum] = @CheckSum, [Logname] = @Logname, [BatchStatus] = @BatchStatus, [TypeOfBatch] = @TypeOfBatch, [DatePostRan] = @DatePostRan, [PayThruDate] = @PayThruDate, [NextPmtDate] = @NextPmtDate, [SourceOfBatch] = @SourceOfBatch, [AutoPost] = @AutoPost WHERE [BatchNo] = @original_BatchNo AND [PostingDate] = @original_PostingDate AND [AcctGroup] = @original_AcctGroup AND (([Division] = @original_Division) OR ([Division] IS NULL AND @original_Division IS NULL)) AND [CheckSum] = @original_CheckSum AND [Logname] = @original_Logname AND [BatchStatus] = @original_BatchStatus AND [TypeOfBatch] = @original_TypeOfBatch AND [DatePostRan] = @original_DatePostRan AND [PayThruDate] = @original_PayThruDate AND [NextPmtDate] = @original_NextPmtDate AND [SourceOfBatch] = @original_SourceOfBatch AND [AutoPost] = @original_AutoPost">
		<DeleteParameters>
			<asp:Parameter Name="original_BatchNo" Type="Int32" />
			<asp:Parameter DbType="Date" Name="original_PostingDate" />
			<asp:Parameter Name="original_AcctGroup" Type="Byte" />
			<asp:Parameter Name="original_Division" Type="Int32" />
			<asp:Parameter Name="original_CheckSum" Type="Decimal" />
			<asp:Parameter Name="original_Logname" Type="String" />
			<asp:Parameter Name="original_BatchStatus" Type="Int16" />
			<asp:Parameter Name="original_TypeOfBatch" Type="Int16" />
			<asp:Parameter DbType="Date" Name="original_DatePostRan" />
			<asp:Parameter DbType="Date" Name="original_PayThruDate" />
			<asp:Parameter DbType="Date" Name="original_NextPmtDate" />
			<asp:Parameter Name="original_SourceOfBatch" Type="Int32" />
			<asp:Parameter Name="original_AutoPost" Type="Int16" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter DbType="Date" Name="PostingDate" />
			<asp:Parameter Name="AcctGroup" Type="Byte" />
			<asp:Parameter Name="Division" Type="Int32" />
			<asp:Parameter Name="CheckSum" Type="Decimal" />
			<asp:Parameter Name="Logname" Type="String" />
			<asp:Parameter Name="BatchStatus" Type="Int16" />
			<asp:Parameter Name="TypeOfBatch" Type="Int16" />
			<asp:Parameter DbType="Date" Name="DatePostRan" />
			<asp:Parameter DbType="Date" Name="PayThruDate" />
			<asp:Parameter DbType="Date" Name="NextPmtDate" />
			<asp:Parameter Name="SourceOfBatch" Type="Int32" />
			<asp:Parameter Name="AutoPost" Type="Int16" />
			<asp:Parameter Name="original_BatchNo" Type="Int32" />
			<asp:Parameter DbType="Date" Name="original_PostingDate" />
			<asp:Parameter Name="original_AcctGroup" Type="Byte" />
			<asp:Parameter Name="original_Division" Type="Int32" />
			<asp:Parameter Name="original_CheckSum" Type="Decimal" />
			<asp:Parameter Name="original_Logname" Type="String" />
			<asp:Parameter Name="original_BatchStatus" Type="Int16" />
			<asp:Parameter Name="original_TypeOfBatch" Type="Int16" />
			<asp:Parameter DbType="Date" Name="original_DatePostRan" />
			<asp:Parameter DbType="Date" Name="original_PayThruDate" />
			<asp:Parameter DbType="Date" Name="original_NextPmtDate" />
			<asp:Parameter Name="original_SourceOfBatch" Type="Int32" />
			<asp:Parameter Name="original_AutoPost" Type="Int16" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="BatchNo" Type="Int32" />
			<asp:Parameter DbType="Date" Name="PostingDate" />
			<asp:Parameter Name="AcctGroup" Type="Byte" />
			<asp:Parameter Name="Division" Type="Int32" />
			<asp:Parameter Name="CheckSum" Type="Decimal" />
			<asp:Parameter Name="Logname" Type="String" />
			<asp:Parameter Name="BatchStatus" Type="Int16" />
			<asp:Parameter Name="TypeOfBatch" Type="Int16" />
			<asp:Parameter DbType="Date" Name="DatePostRan" />
			<asp:Parameter DbType="Date" Name="PayThruDate" />
			<asp:Parameter DbType="Date" Name="NextPmtDate" />
			<asp:Parameter Name="SourceOfBatch" Type="Int32" />
			<asp:Parameter Name="AutoPost" Type="Int16" />
		</InsertParameters>
	</asp:SqlDataSource>
</p>
<p>
<hr />
<h3>WinInvoice</h3>

				<asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="WIKey" DataSourceID="WinInvoice" ForeColor="Black" GridLines="Vertical" Width="200%"><Columns>
					<asp:BoundField DataField="WIKey" HeaderText="WIKey" ReadOnly="True" SortExpression="WIKey" />
					<asp:BoundField DataField="CustomerN" HeaderText="CustomerN" SortExpression="CustomerN" />
					<asp:BoundField DataField="InvoiceDate" HeaderText="InvoiceDate" SortExpression="InvoiceDate" />
					<asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
					<asp:BoundField DataField="TotalDue" HeaderText="TotalDue" SortExpression="TotalDue" />
					<asp:BoundField DataField="TaxTotal" HeaderText="TaxTotal" SortExpression="TaxTotal" />
					<asp:BoundField DataField="SubTotal" HeaderText="SubTotal" SortExpression="SubTotal" />
					<asp:BoundField DataField="InvoiceN" HeaderText="InvoiceN" SortExpression="InvoiceN" />
					<asp:BoundField DataField="BatchNumber" HeaderText="BatchNumber" SortExpression="BatchNumber" />
					<asp:BoundField DataField="BillContact" HeaderText="BillContact" SortExpression="BillContact" />
					<asp:BoundField DataField="BillAddressee" HeaderText="BillAddressee" SortExpression="BillAddressee" />
					<asp:BoundField DataField="BillAddrLine1" HeaderText="BillAddrLine1" SortExpression="BillAddrLine1" />
					<asp:BoundField DataField="BillAddrLine2" HeaderText="BillAddrLine2" SortExpression="BillAddrLine2" />
					<asp:BoundField DataField="BillCity" HeaderText="BillCity" SortExpression="BillCity" />
					<asp:BoundField DataField="BillStateProv" HeaderText="BillStateProv" SortExpression="BillStateProv" />
					<asp:BoundField DataField="BillPostalCode" HeaderText="BillPostalCode" SortExpression="BillPostalCode" />
					<asp:BoundField DataField="BillCountryCode" HeaderText="BillCountryCode" SortExpression="BillCountryCode" />
					<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
					<asp:BoundField DataField="BillAddrLine3" HeaderText="BillAddrLine3" SortExpression="BillAddrLine3" />
					</Columns>
					<FooterStyle BackColor="#CCCCCC" />
					<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
					<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
					<AlternatingRowStyle BackColor="#CCCCCC" />
				</asp:GridView>
				<asp:SqlDataSource ID="WinInvoice" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:pLogicConnectionString %>" DeleteCommand="DELETE FROM [WinInvoice] WHERE [WIKey] = @original_WIKey AND [CustomerN] = @original_CustomerN AND [InvoiceDate] = @original_InvoiceDate AND [Type] = @original_Type AND [TotalDue] = @original_TotalDue AND [TaxTotal] = @original_TaxTotal AND [SubTotal] = @original_SubTotal AND [InvoiceN] = @original_InvoiceN AND [BatchNumber] = @original_BatchNumber AND [BillContact] = @original_BillContact AND [BillAddressee] = @original_BillAddressee AND [BillAddrLine1] = @original_BillAddrLine1 AND [BillAddrLine2] = @original_BillAddrLine2 AND [BillCity] = @original_BillCity AND [BillStateProv] = @original_BillStateProv AND [BillPostalCode] = @original_BillPostalCode AND [BillCountryCode] = @original_BillCountryCode AND [Status] = @original_Status AND [BillAddrLine3] = @original_BillAddrLine3" InsertCommand="INSERT INTO [WinInvoice] ([WIKey], [CustomerN], [InvoiceDate], [Type], [TotalDue], [TaxTotal], [SubTotal], [InvoiceN], [BatchNumber], [BillContact], [BillAddressee], [BillAddrLine1], [BillAddrLine2], [BillCity], [BillStateProv], [BillPostalCode], [BillCountryCode], [Status], [BillAddrLine3]) VALUES (@WIKey, @CustomerN, @InvoiceDate, @Type, @TotalDue, @TaxTotal, @SubTotal, @InvoiceN, @BatchNumber, @BillContact, @BillAddressee, @BillAddrLine1, @BillAddrLine2, @BillCity, @BillStateProv, @BillPostalCode, @BillCountryCode, @Status, @BillAddrLine3)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [WIKey], [CustomerN], [InvoiceDate], [Type], [TotalDue], [TaxTotal], [SubTotal], [InvoiceN], [BatchNumber], [BillContact], [BillAddressee], [BillAddrLine1], [BillAddrLine2], [BillCity], [BillStateProv], [BillPostalCode], [BillCountryCode], [Status], [BillAddrLine3] FROM [WinInvoice] WHERE ([WIKey] &gt; @WIKey) ORDER BY [WIKey] DESC" UpdateCommand="UPDATE [WinInvoice] SET [CustomerN] = @CustomerN, [InvoiceDate] = @InvoiceDate, [Type] = @Type, [TotalDue] = @TotalDue, [TaxTotal] = @TaxTotal, [SubTotal] = @SubTotal, [InvoiceN] = @InvoiceN, [BatchNumber] = @BatchNumber, [BillContact] = @BillContact, [BillAddressee] = @BillAddressee, [BillAddrLine1] = @BillAddrLine1, [BillAddrLine2] = @BillAddrLine2, [BillCity] = @BillCity, [BillStateProv] = @BillStateProv, [BillPostalCode] = @BillPostalCode, [BillCountryCode] = @BillCountryCode, [Status] = @Status, [BillAddrLine3] = @BillAddrLine3 WHERE [WIKey] = @original_WIKey AND [CustomerN] = @original_CustomerN AND [InvoiceDate] = @original_InvoiceDate AND [Type] = @original_Type AND [TotalDue] = @original_TotalDue AND [TaxTotal] = @original_TaxTotal AND [SubTotal] = @original_SubTotal AND [InvoiceN] = @original_InvoiceN AND [BatchNumber] = @original_BatchNumber AND [BillContact] = @original_BillContact AND [BillAddressee] = @original_BillAddressee AND [BillAddrLine1] = @original_BillAddrLine1 AND [BillAddrLine2] = @original_BillAddrLine2 AND [BillCity] = @original_BillCity AND [BillStateProv] = @original_BillStateProv AND [BillPostalCode] = @original_BillPostalCode AND [BillCountryCode] = @original_BillCountryCode AND [Status] = @original_Status AND [BillAddrLine3] = @original_BillAddrLine3">
					<SelectParameters>
						<asp:Parameter DefaultValue="97500" Name="WIKey" Type="Int32" />
					</SelectParameters>
					<DeleteParameters>
						<asp:Parameter Name="original_WIKey" Type="Int32" />
						<asp:Parameter Name="original_CustomerN" Type="Int32" />
						<asp:Parameter DbType="Date" Name="original_InvoiceDate" />
						<asp:Parameter Name="original_Type" Type="Int16" />
						<asp:Parameter Name="original_TotalDue" Type="Decimal" />
						<asp:Parameter Name="original_TaxTotal" Type="Decimal" />
						<asp:Parameter Name="original_SubTotal" Type="Decimal" />
						<asp:Parameter Name="original_InvoiceN" Type="Int32" />
						<asp:Parameter Name="original_BatchNumber" Type="Int32" />
						<asp:Parameter Name="original_BillContact" Type="String" />
						<asp:Parameter Name="original_BillAddressee" Type="String" />
						<asp:Parameter Name="original_BillAddrLine1" Type="String" />
						<asp:Parameter Name="original_BillAddrLine2" Type="String" />
						<asp:Parameter Name="original_BillCity" Type="String" />
						<asp:Parameter Name="original_BillStateProv" Type="String" />
						<asp:Parameter Name="original_BillPostalCode" Type="String" />
						<asp:Parameter Name="original_BillCountryCode" Type="String" />
						<asp:Parameter Name="original_Status" Type="Int16" />
						<asp:Parameter Name="original_BillAddrLine3" Type="String" />
					</DeleteParameters>
					<UpdateParameters>
						<asp:Parameter Name="CustomerN" Type="Int32" />
						<asp:Parameter DbType="Date" Name="InvoiceDate" />
						<asp:Parameter Name="Type" Type="Int16" />
						<asp:Parameter Name="TotalDue" Type="Decimal" />
						<asp:Parameter Name="TaxTotal" Type="Decimal" />
						<asp:Parameter Name="SubTotal" Type="Decimal" />
						<asp:Parameter Name="InvoiceN" Type="Int32" />
						<asp:Parameter Name="BatchNumber" Type="Int32" />
						<asp:Parameter Name="BillContact" Type="String" />
						<asp:Parameter Name="BillAddressee" Type="String" />
						<asp:Parameter Name="BillAddrLine1" Type="String" />
						<asp:Parameter Name="BillAddrLine2" Type="String" />
						<asp:Parameter Name="BillCity" Type="String" />
						<asp:Parameter Name="BillStateProv" Type="String" />
						<asp:Parameter Name="BillPostalCode" Type="String" />
						<asp:Parameter Name="BillCountryCode" Type="String" />
						<asp:Parameter Name="Status" Type="Int16" />
						<asp:Parameter Name="BillAddrLine3" Type="String" />
						<asp:Parameter Name="original_WIKey" Type="Int32" />
						<asp:Parameter Name="original_CustomerN" Type="Int32" />
						<asp:Parameter DbType="Date" Name="original_InvoiceDate" />
						<asp:Parameter Name="original_Type" Type="Int16" />
						<asp:Parameter Name="original_TotalDue" Type="Decimal" />
						<asp:Parameter Name="original_TaxTotal" Type="Decimal" />
						<asp:Parameter Name="original_SubTotal" Type="Decimal" />
						<asp:Parameter Name="original_InvoiceN" Type="Int32" />
						<asp:Parameter Name="original_BatchNumber" Type="Int32" />
						<asp:Parameter Name="original_BillContact" Type="String" />
						<asp:Parameter Name="original_BillAddressee" Type="String" />
						<asp:Parameter Name="original_BillAddrLine1" Type="String" />
						<asp:Parameter Name="original_BillAddrLine2" Type="String" />
						<asp:Parameter Name="original_BillCity" Type="String" />
						<asp:Parameter Name="original_BillStateProv" Type="String" />
						<asp:Parameter Name="original_BillPostalCode" Type="String" />
						<asp:Parameter Name="original_BillCountryCode" Type="String" />
						<asp:Parameter Name="original_Status" Type="Int16" />
						<asp:Parameter Name="original_BillAddrLine3" Type="String" />
					</UpdateParameters>
					<InsertParameters>
						<asp:Parameter Name="WIKey" Type="Int32" />
						<asp:Parameter Name="CustomerN" Type="Int32" />
						<asp:Parameter DbType="Date" Name="InvoiceDate" />
						<asp:Parameter Name="Type" Type="Int16" />
						<asp:Parameter Name="TotalDue" Type="Decimal" />
						<asp:Parameter Name="TaxTotal" Type="Decimal" />
						<asp:Parameter Name="SubTotal" Type="Decimal" />
						<asp:Parameter Name="InvoiceN" Type="Int32" />
						<asp:Parameter Name="BatchNumber" Type="Int32" />
						<asp:Parameter Name="BillContact" Type="String" />
						<asp:Parameter Name="BillAddressee" Type="String" />
						<asp:Parameter Name="BillAddrLine1" Type="String" />
						<asp:Parameter Name="BillAddrLine2" Type="String" />
						<asp:Parameter Name="BillCity" Type="String" />
						<asp:Parameter Name="BillStateProv" Type="String" />
						<asp:Parameter Name="BillPostalCode" Type="String" />
						<asp:Parameter Name="BillCountryCode" Type="String" />
						<asp:Parameter Name="Status" Type="Int16" />
						<asp:Parameter Name="BillAddrLine3" Type="String" />
					</InsertParameters>
				</asp:SqlDataSource>

<hr />
<h3>WinInvJobs</h3>

<p>
	<asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="WIKey,TranNo" DataSourceID="WinInvoiceJobs" ForeColor="Black" GridLines="Vertical" Width="200%"><Columns>
		<asp:BoundField DataField="WIKey" HeaderText="WIKey" ReadOnly="True" SortExpression="WIKey" />
		<asp:BoundField DataField="TranNo" HeaderText="TranNo" ReadOnly="True" SortExpression="TranNo" />
		<asp:BoundField DataField="Job" HeaderText="Job" SortExpression="Job" />
		<asp:BoundField DataField="ShipContact" HeaderText="ShipContact" SortExpression="ShipContact" />
		<asp:BoundField DataField="ShipAddressee" HeaderText="ShipAddressee" SortExpression="ShipAddressee" />
		<asp:BoundField DataField="ShipAddrLine1" HeaderText="ShipAddrLine1" SortExpression="ShipAddrLine1" />
		<asp:BoundField DataField="ShipAddrLine2" HeaderText="ShipAddrLine2" SortExpression="ShipAddrLine2" />
		<asp:BoundField DataField="ShipCountryCode" HeaderText="ShipCountryCode" SortExpression="ShipCountryCode" />
		<asp:BoundField DataField="ShipStateProv" HeaderText="ShipStateProv" SortExpression="ShipStateProv" />
		<asp:BoundField DataField="ShipPostalCode" HeaderText="ShipPostalCode" SortExpression="ShipPostalCode" />
		<asp:BoundField DataField="ShipCity" HeaderText="ShipCity" SortExpression="ShipCity" />
		<asp:BoundField DataField="TaxTotal" HeaderText="TaxTotal" SortExpression="TaxTotal" />
		<asp:BoundField DataField="JobTotal" HeaderText="JobTotal" SortExpression="JobTotal" />
		<asp:BoundField DataField="PurchaseOrderN" HeaderText="PurchaseOrderN" SortExpression="PurchaseOrderN" />
		<asp:BoundField DataField="SalesPersonN" HeaderText="SalesPersonN" SortExpression="SalesPersonN" />
		<asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
		<asp:BoundField DataField="ShipAddrLine3" HeaderText="ShipAddrLine3" SortExpression="ShipAddrLine3" />
		<asp:BoundField DataField="TaxCode" HeaderText="TaxCode" SortExpression="TaxCode" />
		<asp:BoundField DataField="JobDetMax" HeaderText="JobDetMax" SortExpression="JobDetMax" />
		<asp:BoundField DataField="DistMax" HeaderText="DistMax" SortExpression="DistMax" />
		<asp:BoundField DataField="SubTotal" HeaderText="SubTotal" SortExpression="SubTotal" />
		<asp:BoundField DataField="TaxMax" HeaderText="TaxMax" SortExpression="TaxMax" />
		</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#CCCCCC" />
	</asp:GridView>
	<asp:SqlDataSource ID="WinInvoiceJobs" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:pLogicConnectionString %>" DeleteCommand="DELETE FROM [WinInvJobs] WHERE [WIKey] = @original_WIKey AND [TranNo] = @original_TranNo AND [Job] = @original_Job AND [ShipContact] = @original_ShipContact AND [ShipAddressee] = @original_ShipAddressee AND [ShipAddrLine1] = @original_ShipAddrLine1 AND [ShipAddrLine2] = @original_ShipAddrLine2 AND [ShipCountryCode] = @original_ShipCountryCode AND [ShipStateProv] = @original_ShipStateProv AND [ShipPostalCode] = @original_ShipPostalCode AND [ShipCity] = @original_ShipCity AND [TaxTotal] = @original_TaxTotal AND [JobTotal] = @original_JobTotal AND [PurchaseOrderN] = @original_PurchaseOrderN AND [SalesPersonN] = @original_SalesPersonN AND [ProductCode] = @original_ProductCode AND [ShipAddrLine3] = @original_ShipAddrLine3 AND [TaxCode] = @original_TaxCode AND [JobDetMax] = @original_JobDetMax AND [DistMax] = @original_DistMax AND [SubTotal] = @original_SubTotal AND [TaxMax] = @original_TaxMax" InsertCommand="INSERT INTO [WinInvJobs] ([WIKey], [TranNo], [Job], [ShipContact], [ShipAddressee], [ShipAddrLine1], [ShipAddrLine2], [ShipCountryCode], [ShipStateProv], [ShipPostalCode], [ShipCity], [TaxTotal], [JobTotal], [PurchaseOrderN], [SalesPersonN], [ProductCode], [ShipAddrLine3], [TaxCode], [JobDetMax], [DistMax], [SubTotal], [TaxMax]) VALUES (@WIKey, @TranNo, @Job, @ShipContact, @ShipAddressee, @ShipAddrLine1, @ShipAddrLine2, @ShipCountryCode, @ShipStateProv, @ShipPostalCode, @ShipCity, @TaxTotal, @JobTotal, @PurchaseOrderN, @SalesPersonN, @ProductCode, @ShipAddrLine3, @TaxCode, @JobDetMax, @DistMax, @SubTotal, @TaxMax)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [WIKey], [TranNo], [Job], [ShipContact], [ShipAddressee], [ShipAddrLine1], [ShipAddrLine2], [ShipCountryCode], [ShipStateProv], [ShipPostalCode], [ShipCity], [TaxTotal], [JobTotal], [PurchaseOrderN], [SalesPersonN], [ProductCode], [ShipAddrLine3], [TaxCode], [JobDetMax], [DistMax], [SubTotal], [TaxMax] FROM [WinInvJobs] WHERE ([WIKey] &gt; @WIKey) ORDER BY [WIKey] DESC" UpdateCommand="UPDATE [WinInvJobs] SET [Job] = @Job, [ShipContact] = @ShipContact, [ShipAddressee] = @ShipAddressee, [ShipAddrLine1] = @ShipAddrLine1, [ShipAddrLine2] = @ShipAddrLine2, [ShipCountryCode] = @ShipCountryCode, [ShipStateProv] = @ShipStateProv, [ShipPostalCode] = @ShipPostalCode, [ShipCity] = @ShipCity, [TaxTotal] = @TaxTotal, [JobTotal] = @JobTotal, [PurchaseOrderN] = @PurchaseOrderN, [SalesPersonN] = @SalesPersonN, [ProductCode] = @ProductCode, [ShipAddrLine3] = @ShipAddrLine3, [TaxCode] = @TaxCode, [JobDetMax] = @JobDetMax, [DistMax] = @DistMax, [SubTotal] = @SubTotal, [TaxMax] = @TaxMax WHERE [WIKey] = @original_WIKey AND [TranNo] = @original_TranNo AND [Job] = @original_Job AND [ShipContact] = @original_ShipContact AND [ShipAddressee] = @original_ShipAddressee AND [ShipAddrLine1] = @original_ShipAddrLine1 AND [ShipAddrLine2] = @original_ShipAddrLine2 AND [ShipCountryCode] = @original_ShipCountryCode AND [ShipStateProv] = @original_ShipStateProv AND [ShipPostalCode] = @original_ShipPostalCode AND [ShipCity] = @original_ShipCity AND [TaxTotal] = @original_TaxTotal AND [JobTotal] = @original_JobTotal AND [PurchaseOrderN] = @original_PurchaseOrderN AND [SalesPersonN] = @original_SalesPersonN AND [ProductCode] = @original_ProductCode AND [ShipAddrLine3] = @original_ShipAddrLine3 AND [TaxCode] = @original_TaxCode AND [JobDetMax] = @original_JobDetMax AND [DistMax] = @original_DistMax AND [SubTotal] = @original_SubTotal AND [TaxMax] = @original_TaxMax">
		<SelectParameters>
			<asp:Parameter DefaultValue="97500" Name="WIKey" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="original_WIKey" Type="Int32" />
			<asp:Parameter Name="original_TranNo" Type="Int32" />
			<asp:Parameter Name="original_Job" Type="Int32" />
			<asp:Parameter Name="original_ShipContact" Type="String" />
			<asp:Parameter Name="original_ShipAddressee" Type="String" />
			<asp:Parameter Name="original_ShipAddrLine1" Type="String" />
			<asp:Parameter Name="original_ShipAddrLine2" Type="String" />
			<asp:Parameter Name="original_ShipCountryCode" Type="String" />
			<asp:Parameter Name="original_ShipStateProv" Type="String" />
			<asp:Parameter Name="original_ShipPostalCode" Type="String" />
			<asp:Parameter Name="original_ShipCity" Type="String" />
			<asp:Parameter Name="original_TaxTotal" Type="Decimal" />
			<asp:Parameter Name="original_JobTotal" Type="Decimal" />
			<asp:Parameter Name="original_PurchaseOrderN" Type="String" />
			<asp:Parameter Name="original_SalesPersonN" Type="Int32" />
			<asp:Parameter Name="original_ProductCode" Type="Int32" />
			<asp:Parameter Name="original_ShipAddrLine3" Type="String" />
			<asp:Parameter Name="original_TaxCode" Type="Int32" />
			<asp:Parameter Name="original_JobDetMax" Type="Int32" />
			<asp:Parameter Name="original_DistMax" Type="Int32" />
			<asp:Parameter Name="original_SubTotal" Type="Decimal" />
			<asp:Parameter Name="original_TaxMax" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="Job" Type="Int32" />
			<asp:Parameter Name="ShipContact" Type="String" />
			<asp:Parameter Name="ShipAddressee" Type="String" />
			<asp:Parameter Name="ShipAddrLine1" Type="String" />
			<asp:Parameter Name="ShipAddrLine2" Type="String" />
			<asp:Parameter Name="ShipCountryCode" Type="String" />
			<asp:Parameter Name="ShipStateProv" Type="String" />
			<asp:Parameter Name="ShipPostalCode" Type="String" />
			<asp:Parameter Name="ShipCity" Type="String" />
			<asp:Parameter Name="TaxTotal" Type="Decimal" />
			<asp:Parameter Name="JobTotal" Type="Decimal" />
			<asp:Parameter Name="PurchaseOrderN" Type="String" />
			<asp:Parameter Name="SalesPersonN" Type="Int32" />
			<asp:Parameter Name="ProductCode" Type="Int32" />
			<asp:Parameter Name="ShipAddrLine3" Type="String" />
			<asp:Parameter Name="TaxCode" Type="Int32" />
			<asp:Parameter Name="JobDetMax" Type="Int32" />
			<asp:Parameter Name="DistMax" Type="Int32" />
			<asp:Parameter Name="SubTotal" Type="Decimal" />
			<asp:Parameter Name="TaxMax" Type="Int32" />
			<asp:Parameter Name="original_WIKey" Type="Int32" />
			<asp:Parameter Name="original_TranNo" Type="Int32" />
			<asp:Parameter Name="original_Job" Type="Int32" />
			<asp:Parameter Name="original_ShipContact" Type="String" />
			<asp:Parameter Name="original_ShipAddressee" Type="String" />
			<asp:Parameter Name="original_ShipAddrLine1" Type="String" />
			<asp:Parameter Name="original_ShipAddrLine2" Type="String" />
			<asp:Parameter Name="original_ShipCountryCode" Type="String" />
			<asp:Parameter Name="original_ShipStateProv" Type="String" />
			<asp:Parameter Name="original_ShipPostalCode" Type="String" />
			<asp:Parameter Name="original_ShipCity" Type="String" />
			<asp:Parameter Name="original_TaxTotal" Type="Decimal" />
			<asp:Parameter Name="original_JobTotal" Type="Decimal" />
			<asp:Parameter Name="original_PurchaseOrderN" Type="String" />
			<asp:Parameter Name="original_SalesPersonN" Type="Int32" />
			<asp:Parameter Name="original_ProductCode" Type="Int32" />
			<asp:Parameter Name="original_ShipAddrLine3" Type="String" />
			<asp:Parameter Name="original_TaxCode" Type="Int32" />
			<asp:Parameter Name="original_JobDetMax" Type="Int32" />
			<asp:Parameter Name="original_DistMax" Type="Int32" />
			<asp:Parameter Name="original_SubTotal" Type="Decimal" />
			<asp:Parameter Name="original_TaxMax" Type="Int32" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="WIKey" Type="Int32" />
			<asp:Parameter Name="TranNo" Type="Int32" />
			<asp:Parameter Name="Job" Type="Int32" />
			<asp:Parameter Name="ShipContact" Type="String" />
			<asp:Parameter Name="ShipAddressee" Type="String" />
			<asp:Parameter Name="ShipAddrLine1" Type="String" />
			<asp:Parameter Name="ShipAddrLine2" Type="String" />
			<asp:Parameter Name="ShipCountryCode" Type="String" />
			<asp:Parameter Name="ShipStateProv" Type="String" />
			<asp:Parameter Name="ShipPostalCode" Type="String" />
			<asp:Parameter Name="ShipCity" Type="String" />
			<asp:Parameter Name="TaxTotal" Type="Decimal" />
			<asp:Parameter Name="JobTotal" Type="Decimal" />
			<asp:Parameter Name="PurchaseOrderN" Type="String" />
			<asp:Parameter Name="SalesPersonN" Type="Int32" />
			<asp:Parameter Name="ProductCode" Type="Int32" />
			<asp:Parameter Name="ShipAddrLine3" Type="String" />
			<asp:Parameter Name="TaxCode" Type="Int32" />
			<asp:Parameter Name="JobDetMax" Type="Int32" />
			<asp:Parameter Name="DistMax" Type="Int32" />
			<asp:Parameter Name="SubTotal" Type="Decimal" />
			<asp:Parameter Name="TaxMax" Type="Int32" />
		</InsertParameters>
	</asp:SqlDataSource>
<hr />
<h3>WinInvJobDetails</h3>

				<asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="WIKey,TranNo" DataSourceID="WinInvJobDetail" ForeColor="Black" GridLines="Vertical" Width="200%"><Columns>
					<asp:BoundField DataField="WIKey" HeaderText="WIKey" ReadOnly="True" SortExpression="WIKey" />
					<asp:BoundField DataField="TranNo" HeaderText="TranNo" ReadOnly="True" SortExpression="TranNo" />
					<asp:BoundField DataField="ItemSource" HeaderText="ItemSource" SortExpression="ItemSource" />
					<asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
					<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"  >
						<ItemStyle Width="450px" Wrap="True" />
					</asp:BoundField>
					<asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
					<asp:BoundField DataField="Unit" HeaderText="Unit" SortExpression="Unit" />
					<asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
					<asp:BoundField DataField="GridKey" HeaderText="GridKey" SortExpression="GridKey" />
					<asp:BoundField DataField="QorF" HeaderText="QorF" SortExpression="QorF" />
					<asp:BoundField DataField="WIJobTran" HeaderText="WIJobTran" SortExpression="WIJobTran" />
					<asp:BoundField DataField="WIJobLineN" HeaderText="WIJobLineN" SortExpression="WIJobLineN" />
					<asp:BoundField DataField="DistFlag" HeaderText="DistFlag" SortExpression="DistFlag" />
					<asp:BoundField DataField="DistCount" HeaderText="DistCount" SortExpression="DistCount" />
					<asp:BoundField DataField="DistIdx" HeaderText="DistIdx" SortExpression="DistIdx" />
					<asp:BoundField DataField="DescAlign" HeaderText="DescAlign" SortExpression="DescAlign" />
					<asp:BoundField DataField="PriceList" HeaderText="PriceList" SortExpression="PriceList" />
					<asp:BoundField DataField="FGItemNumber" HeaderText="FGItemNumber" SortExpression="FGItemNumber" />
					<asp:BoundField DataField="TaxCode" HeaderText="TaxCode" SortExpression="TaxCode" />
					<asp:BoundField DataField="MinorReference" HeaderText="MinorReference" SortExpression="MinorReference" />
					</Columns>
					<FooterStyle BackColor="#CCCCCC" />
					<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
					<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
					<AlternatingRowStyle BackColor="#CCCCCC" />
				</asp:GridView>
				<asp:SqlDataSource ID="WinInvJobDetail" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:pLogicConnectionString %>" DeleteCommand="DELETE FROM [WinInvJobDetail] WHERE [WIKey] = @original_WIKey AND [TranNo] = @original_TranNo AND [ItemSource] = @original_ItemSource AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL)) AND [Description] = @original_Description AND [Price] = @original_Price AND [Unit] = @original_Unit AND [Amount] = @original_Amount AND [GridKey] = @original_GridKey AND [QorF] = @original_QorF AND [WIJobTran] = @original_WIJobTran AND [WIJobLineN] = @original_WIJobLineN AND [DistFlag] = @original_DistFlag AND [DistCount] = @original_DistCount AND [DistIdx] = @original_DistIdx AND [DescAlign] = @original_DescAlign AND [PriceList] = @original_PriceList AND [FGItemNumber] = @original_FGItemNumber AND [TaxCode] = @original_TaxCode AND [MinorReference] = @original_MinorReference" InsertCommand="INSERT INTO [WinInvJobDetail] ([WIKey], [TranNo], [ItemSource], [Quantity], [Description], [Price], [Unit], [Amount], [GridKey], [QorF], [WIJobTran], [WIJobLineN], [DistFlag], [DistCount], [DistIdx], [DescAlign], [PriceList], [FGItemNumber], [TaxCode], [MinorReference]) VALUES (@WIKey, @TranNo, @ItemSource, @Quantity, @Description, @Price, @Unit, @Amount, @GridKey, @QorF, @WIJobTran, @WIJobLineN, @DistFlag, @DistCount, @DistIdx, @DescAlign, @PriceList, @FGItemNumber, @TaxCode, @MinorReference)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [WinInvJobDetail] WHERE ([WIKey] &gt; @WIKey) ORDER BY [WIKey] DESC" UpdateCommand="UPDATE [WinInvJobDetail] SET [ItemSource] = @ItemSource, [Quantity] = @Quantity, [Description] = @Description, [Price] = @Price, [Unit] = @Unit, [Amount] = @Amount, [GridKey] = @GridKey, [QorF] = @QorF, [WIJobTran] = @WIJobTran, [WIJobLineN] = @WIJobLineN, [DistFlag] = @DistFlag, [DistCount] = @DistCount, [DistIdx] = @DistIdx, [DescAlign] = @DescAlign, [PriceList] = @PriceList, [FGItemNumber] = @FGItemNumber, [TaxCode] = @TaxCode, [MinorReference] = @MinorReference WHERE [WIKey] = @original_WIKey AND [TranNo] = @original_TranNo AND [ItemSource] = @original_ItemSource AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL)) AND [Description] = @original_Description AND [Price] = @original_Price AND [Unit] = @original_Unit AND [Amount] = @original_Amount AND [GridKey] = @original_GridKey AND [QorF] = @original_QorF AND [WIJobTran] = @original_WIJobTran AND [WIJobLineN] = @original_WIJobLineN AND [DistFlag] = @original_DistFlag AND [DistCount] = @original_DistCount AND [DistIdx] = @original_DistIdx AND [DescAlign] = @original_DescAlign AND [PriceList] = @original_PriceList AND [FGItemNumber] = @original_FGItemNumber AND [TaxCode] = @original_TaxCode AND [MinorReference] = @original_MinorReference">
					<SelectParameters>
						<asp:Parameter DefaultValue="97500" Name="WIKey" Type="Int32" />
					</SelectParameters>
					<DeleteParameters>
						<asp:Parameter Name="original_WIKey" Type="Int32" />
						<asp:Parameter Name="original_TranNo" Type="Int32" />
						<asp:Parameter Name="original_ItemSource" Type="Byte" />
						<asp:Parameter Name="original_Quantity" Type="Decimal" />
						<asp:Parameter Name="original_Description" Type="String" />
						<asp:Parameter Name="original_Price" Type="Decimal" />
						<asp:Parameter Name="original_Unit" Type="Int16" />
						<asp:Parameter Name="original_Amount" Type="Decimal" />
						<asp:Parameter Name="original_GridKey" Type="String" />
						<asp:Parameter Name="original_QorF" Type="String" />
						<asp:Parameter Name="original_WIJobTran" Type="Int32" />
						<asp:Parameter Name="original_WIJobLineN" Type="Int32" />
						<asp:Parameter Name="original_DistFlag" Type="String" />
						<asp:Parameter Name="original_DistCount" Type="Int16" />
						<asp:Parameter Name="original_DistIdx" Type="Int32" />
						<asp:Parameter Name="original_DescAlign" Type="Byte" />
						<asp:Parameter Name="original_PriceList" Type="Int32" />
						<asp:Parameter Name="original_FGItemNumber" Type="Int32" />
						<asp:Parameter Name="original_TaxCode" Type="Int32" />
						<asp:Parameter Name="original_MinorReference" Type="Int32" />
					</DeleteParameters>
					<UpdateParameters>
						<asp:Parameter Name="ItemSource" Type="Byte" />
						<asp:Parameter Name="Quantity" Type="Decimal" />
						<asp:Parameter Name="Description" Type="String" />
						<asp:Parameter Name="Price" Type="Decimal" />
						<asp:Parameter Name="Unit" Type="Int16" />
						<asp:Parameter Name="Amount" Type="Decimal" />
						<asp:Parameter Name="GridKey" Type="String" />
						<asp:Parameter Name="QorF" Type="String" />
						<asp:Parameter Name="WIJobTran" Type="Int32" />
						<asp:Parameter Name="WIJobLineN" Type="Int32" />
						<asp:Parameter Name="DistFlag" Type="String" />
						<asp:Parameter Name="DistCount" Type="Int16" />
						<asp:Parameter Name="DistIdx" Type="Int32" />
						<asp:Parameter Name="DescAlign" Type="Byte" />
						<asp:Parameter Name="PriceList" Type="Int32" />
						<asp:Parameter Name="FGItemNumber" Type="Int32" />
						<asp:Parameter Name="TaxCode" Type="Int32" />
						<asp:Parameter Name="MinorReference" Type="Int32" />
						<asp:Parameter Name="original_WIKey" Type="Int32" />
						<asp:Parameter Name="original_TranNo" Type="Int32" />
						<asp:Parameter Name="original_ItemSource" Type="Byte" />
						<asp:Parameter Name="original_Quantity" Type="Decimal" />
						<asp:Parameter Name="original_Description" Type="String" />
						<asp:Parameter Name="original_Price" Type="Decimal" />
						<asp:Parameter Name="original_Unit" Type="Int16" />
						<asp:Parameter Name="original_Amount" Type="Decimal" />
						<asp:Parameter Name="original_GridKey" Type="String" />
						<asp:Parameter Name="original_QorF" Type="String" />
						<asp:Parameter Name="original_WIJobTran" Type="Int32" />
						<asp:Parameter Name="original_WIJobLineN" Type="Int32" />
						<asp:Parameter Name="original_DistFlag" Type="String" />
						<asp:Parameter Name="original_DistCount" Type="Int16" />
						<asp:Parameter Name="original_DistIdx" Type="Int32" />
						<asp:Parameter Name="original_DescAlign" Type="Byte" />
						<asp:Parameter Name="original_PriceList" Type="Int32" />
						<asp:Parameter Name="original_FGItemNumber" Type="Int32" />
						<asp:Parameter Name="original_TaxCode" Type="Int32" />
						<asp:Parameter Name="original_MinorReference" Type="Int32" />
					</UpdateParameters>
					<InsertParameters>
						<asp:Parameter Name="WIKey" Type="Int32" />
						<asp:Parameter Name="TranNo" Type="Int32" />
						<asp:Parameter Name="ItemSource" Type="Byte" />
						<asp:Parameter Name="Quantity" Type="Decimal" />
						<asp:Parameter Name="Description" Type="String" />
						<asp:Parameter Name="Price" Type="Decimal" />
						<asp:Parameter Name="Unit" Type="Int16" />
						<asp:Parameter Name="Amount" Type="Decimal" />
						<asp:Parameter Name="GridKey" Type="String" />
						<asp:Parameter Name="QorF" Type="String" />
						<asp:Parameter Name="WIJobTran" Type="Int32" />
						<asp:Parameter Name="WIJobLineN" Type="Int32" />
						<asp:Parameter Name="DistFlag" Type="String" />
						<asp:Parameter Name="DistCount" Type="Int16" />
						<asp:Parameter Name="DistIdx" Type="Int32" />
						<asp:Parameter Name="DescAlign" Type="Byte" />
						<asp:Parameter Name="PriceList" Type="Int32" />
						<asp:Parameter Name="FGItemNumber" Type="Int32" />
						<asp:Parameter Name="TaxCode" Type="Int32" />
						<asp:Parameter Name="MinorReference" Type="Int32" />
					</InsertParameters>
				</asp:SqlDataSource>

<hr />
<h3>WinInvDist</h3>

	<asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="WIKey,TranNo" DataSourceID="WinInvDist" ForeColor="Black" GridLines="Vertical"><Columns>
		<asp:BoundField DataField="WIKey" HeaderText="WIKey" ReadOnly="True" SortExpression="WIKey" />
		<asp:BoundField DataField="TranNo" HeaderText="TranNo" ReadOnly="True" SortExpression="TranNo" />
		<asp:BoundField DataField="SalesAcct" HeaderText="SalesAcct" SortExpression="SalesAcct" />
		<asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
		<asp:BoundField DataField="SalesAmt" HeaderText="SalesAmt" SortExpression="SalesAmt" />
		<asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
		<asp:BoundField DataField="TaxesFlag" HeaderText="TaxesFlag" SortExpression="TaxesFlag" />
		<asp:BoundField DataField="DistFlag" HeaderText="DistFlag" SortExpression="DistFlag" />
		<asp:BoundField DataField="ErrMsg1" HeaderText="ErrMsg1" SortExpression="ErrMsg1" />
		<asp:BoundField DataField="ErrMsg2" HeaderText="ErrMsg2" SortExpression="ErrMsg2" />
		<asp:BoundField DataField="WIJobTran" HeaderText="WIJobTran" SortExpression="WIJobTran" />
		<asp:BoundField DataField="TaxCode" HeaderText="TaxCode" SortExpression="TaxCode" />
		</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#CCCCCC" />
	</asp:GridView>
	<asp:SqlDataSource ID="WinInvDist" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:pLogicConnectionString %>" DeleteCommand="DELETE FROM [WinInvDist] WHERE [WIKey] = @original_WIKey AND [TranNo] = @original_TranNo AND [SalesAcct] = @original_SalesAcct AND [Department] = @original_Department AND [SalesAmt] = @original_SalesAmt AND [ProductCode] = @original_ProductCode AND [TaxesFlag] = @original_TaxesFlag AND [DistFlag] = @original_DistFlag AND [ErrMsg1] = @original_ErrMsg1 AND [ErrMsg2] = @original_ErrMsg2 AND [WIJobTran] = @original_WIJobTran AND [TaxCode] = @original_TaxCode" InsertCommand="INSERT INTO [WinInvDist] ([WIKey], [TranNo], [SalesAcct], [Department], [SalesAmt], [ProductCode], [TaxesFlag], [DistFlag], [ErrMsg1], [ErrMsg2], [WIJobTran], [TaxCode]) VALUES (@WIKey, @TranNo, @SalesAcct, @Department, @SalesAmt, @ProductCode, @TaxesFlag, @DistFlag, @ErrMsg1, @ErrMsg2, @WIJobTran, @TaxCode)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [WinInvDist] WHERE ([WIKey] &gt; @WIKey) ORDER BY [WIKey] DESC" UpdateCommand="UPDATE [WinInvDist] SET [SalesAcct] = @SalesAcct, [Department] = @Department, [SalesAmt] = @SalesAmt, [ProductCode] = @ProductCode, [TaxesFlag] = @TaxesFlag, [DistFlag] = @DistFlag, [ErrMsg1] = @ErrMsg1, [ErrMsg2] = @ErrMsg2, [WIJobTran] = @WIJobTran, [TaxCode] = @TaxCode WHERE [WIKey] = @original_WIKey AND [TranNo] = @original_TranNo AND [SalesAcct] = @original_SalesAcct AND [Department] = @original_Department AND [SalesAmt] = @original_SalesAmt AND [ProductCode] = @original_ProductCode AND [TaxesFlag] = @original_TaxesFlag AND [DistFlag] = @original_DistFlag AND [ErrMsg1] = @original_ErrMsg1 AND [ErrMsg2] = @original_ErrMsg2 AND [WIJobTran] = @original_WIJobTran AND [TaxCode] = @original_TaxCode">
		<SelectParameters>
			<asp:Parameter DefaultValue="97500" Name="WIKey" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="original_WIKey" Type="Int32" />
			<asp:Parameter Name="original_TranNo" Type="Int32" />
			<asp:Parameter Name="original_SalesAcct" Type="Int32" />
			<asp:Parameter Name="original_Department" Type="Int32" />
			<asp:Parameter Name="original_SalesAmt" Type="Decimal" />
			<asp:Parameter Name="original_ProductCode" Type="Int32" />
			<asp:Parameter Name="original_TaxesFlag" Type="Int16" />
			<asp:Parameter Name="original_DistFlag" Type="Int16" />
			<asp:Parameter Name="original_ErrMsg1" Type="String" />
			<asp:Parameter Name="original_ErrMsg2" Type="String" />
			<asp:Parameter Name="original_WIJobTran" Type="Int32" />
			<asp:Parameter Name="original_TaxCode" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="SalesAcct" Type="Int32" />
			<asp:Parameter Name="Department" Type="Int32" />
			<asp:Parameter Name="SalesAmt" Type="Decimal" />
			<asp:Parameter Name="ProductCode" Type="Int32" />
			<asp:Parameter Name="TaxesFlag" Type="Int16" />
			<asp:Parameter Name="DistFlag" Type="Int16" />
			<asp:Parameter Name="ErrMsg1" Type="String" />
			<asp:Parameter Name="ErrMsg2" Type="String" />
			<asp:Parameter Name="WIJobTran" Type="Int32" />
			<asp:Parameter Name="TaxCode" Type="Int32" />
			<asp:Parameter Name="original_WIKey" Type="Int32" />
			<asp:Parameter Name="original_TranNo" Type="Int32" />
			<asp:Parameter Name="original_SalesAcct" Type="Int32" />
			<asp:Parameter Name="original_Department" Type="Int32" />
			<asp:Parameter Name="original_SalesAmt" Type="Decimal" />
			<asp:Parameter Name="original_ProductCode" Type="Int32" />
			<asp:Parameter Name="original_TaxesFlag" Type="Int16" />
			<asp:Parameter Name="original_DistFlag" Type="Int16" />
			<asp:Parameter Name="original_ErrMsg1" Type="String" />
			<asp:Parameter Name="original_ErrMsg2" Type="String" />
			<asp:Parameter Name="original_WIJobTran" Type="Int32" />
			<asp:Parameter Name="original_TaxCode" Type="Int32" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="WIKey" Type="Int32" />
			<asp:Parameter Name="TranNo" Type="Int32" />
			<asp:Parameter Name="SalesAcct" Type="Int32" />
			<asp:Parameter Name="Department" Type="Int32" />
			<asp:Parameter Name="SalesAmt" Type="Decimal" />
			<asp:Parameter Name="ProductCode" Type="Int32" />
			<asp:Parameter Name="TaxesFlag" Type="Int16" />
			<asp:Parameter Name="DistFlag" Type="Int16" />
			<asp:Parameter Name="ErrMsg1" Type="String" />
			<asp:Parameter Name="ErrMsg2" Type="String" />
			<asp:Parameter Name="WIJobTran" Type="Int32" />
			<asp:Parameter Name="TaxCode" Type="Int32" />
		</InsertParameters>
	</asp:SqlDataSource>

</p>
<hr />
<h3>WinInvTax</h3>
	<p><asp:GridView ID="GridView6" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="WIKey,TranNo" DataSourceID="WinInvTax" ForeColor="Black" GridLines="Vertical"><Columns>
		<asp:BoundField DataField="WIKey" HeaderText="WIKey" ReadOnly="True" SortExpression="WIKey" />
		<asp:BoundField DataField="TranNo" HeaderText="TranNo" ReadOnly="True" SortExpression="TranNo" />
		<asp:BoundField DataField="TaxAcct" HeaderText="TaxAcct" SortExpression="TaxAcct" />
		<asp:BoundField DataField="PercentV" HeaderText="PercentV" SortExpression="PercentV" />
		<asp:BoundField DataField="CalcType" HeaderText="CalcType" SortExpression="CalcType" />
		<asp:BoundField DataField="TaxAmt" HeaderText="TaxAmt" SortExpression="TaxAmt" />
		<asp:BoundField DataField="TaxesFlag" HeaderText="TaxesFlag" SortExpression="TaxesFlag" />
		<asp:BoundField DataField="DistFlag" HeaderText="DistFlag" SortExpression="DistFlag" />
		<asp:BoundField DataField="WIJobTran" HeaderText="WIJobTran" SortExpression="WIJobTran" />
		</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#CCCCCC" />
		</asp:GridView>
		<asp:SqlDataSource ID="WinInvTax" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:pLogicConnectionString %>" DeleteCommand="DELETE FROM [WinInvTax] WHERE [WIKey] = @original_WIKey AND [TranNo] = @original_TranNo AND [TaxAcct] = @original_TaxAcct AND [PercentV] = @original_PercentV AND [CalcType] = @original_CalcType AND [TaxAmt] = @original_TaxAmt AND [TaxesFlag] = @original_TaxesFlag AND [DistFlag] = @original_DistFlag AND [WIJobTran] = @original_WIJobTran" InsertCommand="INSERT INTO [WinInvTax] ([WIKey], [TranNo], [TaxAcct], [PercentV], [CalcType], [TaxAmt], [TaxesFlag], [DistFlag], [WIJobTran]) VALUES (@WIKey, @TranNo, @TaxAcct, @PercentV, @CalcType, @TaxAmt, @TaxesFlag, @DistFlag, @WIJobTran)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [WinInvTax] WHERE ([WIKey] &gt; @WIKey) ORDER BY [WIKey] DESC" UpdateCommand="UPDATE [WinInvTax] SET [TaxAcct] = @TaxAcct, [PercentV] = @PercentV, [CalcType] = @CalcType, [TaxAmt] = @TaxAmt, [TaxesFlag] = @TaxesFlag, [DistFlag] = @DistFlag, [WIJobTran] = @WIJobTran WHERE [WIKey] = @original_WIKey AND [TranNo] = @original_TranNo AND [TaxAcct] = @original_TaxAcct AND [PercentV] = @original_PercentV AND [CalcType] = @original_CalcType AND [TaxAmt] = @original_TaxAmt AND [TaxesFlag] = @original_TaxesFlag AND [DistFlag] = @original_DistFlag AND [WIJobTran] = @original_WIJobTran">
			<SelectParameters>
				<asp:Parameter DefaultValue="97500" Name="WIKey" Type="Int32" />
			</SelectParameters>
			<DeleteParameters>
				<asp:Parameter Name="original_WIKey" Type="Int32" />
				<asp:Parameter Name="original_TranNo" Type="Int32" />
				<asp:Parameter Name="original_TaxAcct" Type="Int32" />
				<asp:Parameter Name="original_PercentV" Type="Decimal" />
				<asp:Parameter Name="original_CalcType" Type="Int16" />
				<asp:Parameter Name="original_TaxAmt" Type="Decimal" />
				<asp:Parameter Name="original_TaxesFlag" Type="Int16" />
				<asp:Parameter Name="original_DistFlag" Type="Int16" />
				<asp:Parameter Name="original_WIJobTran" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="TaxAcct" Type="Int32" />
				<asp:Parameter Name="PercentV" Type="Decimal" />
				<asp:Parameter Name="CalcType" Type="Int16" />
				<asp:Parameter Name="TaxAmt" Type="Decimal" />
				<asp:Parameter Name="TaxesFlag" Type="Int16" />
				<asp:Parameter Name="DistFlag" Type="Int16" />
				<asp:Parameter Name="WIJobTran" Type="Int32" />
				<asp:Parameter Name="original_WIKey" Type="Int32" />
				<asp:Parameter Name="original_TranNo" Type="Int32" />
				<asp:Parameter Name="original_TaxAcct" Type="Int32" />
				<asp:Parameter Name="original_PercentV" Type="Decimal" />
				<asp:Parameter Name="original_CalcType" Type="Int16" />
				<asp:Parameter Name="original_TaxAmt" Type="Decimal" />
				<asp:Parameter Name="original_TaxesFlag" Type="Int16" />
				<asp:Parameter Name="original_DistFlag" Type="Int16" />
				<asp:Parameter Name="original_WIJobTran" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="WIKey" Type="Int32" />
				<asp:Parameter Name="TranNo" Type="Int32" />
				<asp:Parameter Name="TaxAcct" Type="Int32" />
				<asp:Parameter Name="PercentV" Type="Decimal" />
				<asp:Parameter Name="CalcType" Type="Int16" />
				<asp:Parameter Name="TaxAmt" Type="Decimal" />
				<asp:Parameter Name="TaxesFlag" Type="Int16" />
				<asp:Parameter Name="DistFlag" Type="Int16" />
				<asp:Parameter Name="WIJobTran" Type="Int32" />
			</InsertParameters>
		</asp:SqlDataSource>
	</p>

</p>
</asp:Content>


