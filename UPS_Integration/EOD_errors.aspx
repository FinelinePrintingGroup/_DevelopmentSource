<%@ Page Language="C#" MasterPageFile="../MasterPage.master" AutoEventWireup="true" CodeFile="EOD_errors.aspx.cs" Inherits="ErrorLogs_EOD_errors" Title="EOD Errors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h4>This is the error logs page for the EOD and QV applications.</h4>
    <p><a href="<%= Page.ResolveUrl("~")%>UPS_Integration/UPS_dashboard.aspx">Back</a></p>
    <hr />
    <h2>EOD Error Log</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="errID" DataSourceID="EODerrors" ForeColor="Black" GridLines="Vertical" PageSize="30" Width="100%">
            <Columns>
                <asp:BoundField DataField="errID" HeaderText="errID" InsertVisible="False" ReadOnly="True" SortExpression="errID" />
                <asp:BoundField DataField="errNum" HeaderText="errNum" SortExpression="errNum" />
                <asp:BoundField DataField="errDesc" HeaderText="errDesc" SortExpression="errDesc" />
                <asp:BoundField DataField="errMsg" HeaderText="errMsg" SortExpression="errMsg" />
                <asp:BoundField DataField="errDate" HeaderText="errDate" SortExpression="errDate" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        <asp:SqlDataSource ID="EODerrors" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT * FROM [CT_EOD_ErrorLog] ORDER BY [errID] DESC" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [CT_EOD_ErrorLog] WHERE [errID] = @original_errID AND [errNum] = @original_errNum AND [errDesc] = @original_errDesc AND [errMsg] = @original_errMsg AND [errDate] = @original_errDate" InsertCommand="INSERT INTO [CT_EOD_ErrorLog] ([errNum], [errDesc], [errMsg], [errDate]) VALUES (@errNum, @errDesc, @errMsg, @errDate)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [CT_EOD_ErrorLog] SET [errNum] = @errNum, [errDesc] = @errDesc, [errMsg] = @errMsg, [errDate] = @errDate WHERE [errID] = @original_errID AND [errNum] = @original_errNum AND [errDesc] = @original_errDesc AND [errMsg] = @original_errMsg AND [errDate] = @original_errDate"><DeleteParameters>
			<asp:Parameter Name="original_errID" Type="Int32" />
			<asp:Parameter Name="original_errNum" Type="String" />
			<asp:Parameter Name="original_errDesc" Type="String" />
			<asp:Parameter Name="original_errMsg" Type="String" />
			<asp:Parameter Name="original_errDate" Type="String" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="errNum" Type="String" />
				<asp:Parameter Name="errDesc" Type="String" />
				<asp:Parameter Name="errMsg" Type="String" />
				<asp:Parameter Name="errDate" Type="String" />
				<asp:Parameter Name="original_errID" Type="Int32" />
				<asp:Parameter Name="original_errNum" Type="String" />
				<asp:Parameter Name="original_errDesc" Type="String" />
				<asp:Parameter Name="original_errMsg" Type="String" />
				<asp:Parameter Name="original_errDate" Type="String" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="errNum" Type="String" />
				<asp:Parameter Name="errDesc" Type="String" />
				<asp:Parameter Name="errMsg" Type="String" />
				<asp:Parameter Name="errDate" Type="String" />
			</InsertParameters>
		</asp:SqlDataSource>
    </p>
	<hr />
	
	<h2>Quantum View Feed Error Responses</h2>
	<asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="QV_Errors" ForeColor="Black" GridLines="Vertical" Width="100%"><Columns>
		<asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
		<asp:BoundField DataField="errCode" HeaderText="errCode" SortExpression="errCode" />
		<asp:BoundField DataField="errSeverity" HeaderText="errSeverity" SortExpression="errSeverity" />
		<asp:BoundField DataField="errDescription" HeaderText="errDescription" SortExpression="errDescription" />
		<asp:BoundField DataField="errLocation" HeaderText="errLocation" SortExpression="errLocation" />
		<asp:BoundField DataField="errLocElement" HeaderText="errLocElement" SortExpression="errLocElement" />
		<asp:BoundField DataField="errDate" HeaderText="errDate" SortExpression="errDate" />
		</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#CCCCCC" />
	</asp:GridView>
	<asp:SqlDataSource ID="QV_Errors" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" DeleteCommand="DELETE FROM [CT_UPS_QVFeedErrorLog] WHERE [id] = @original_id AND (([errCode] = @original_errCode) OR ([errCode] IS NULL AND @original_errCode IS NULL)) AND (([errSeverity] = @original_errSeverity) OR ([errSeverity] IS NULL AND @original_errSeverity IS NULL)) AND (([errDescription] = @original_errDescription) OR ([errDescription] IS NULL AND @original_errDescription IS NULL)) AND (([errLocation] = @original_errLocation) OR ([errLocation] IS NULL AND @original_errLocation IS NULL)) AND (([errLocElement] = @original_errLocElement) OR ([errLocElement] IS NULL AND @original_errLocElement IS NULL)) AND [errDate] = @original_errDate" InsertCommand="INSERT INTO [CT_UPS_QVFeedErrorLog] ([errCode], [errSeverity], [errDescription], [errLocation], [errLocElement], [errDate]) VALUES (@errCode, @errSeverity, @errDescription, @errLocation, @errLocElement, @errDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CT_UPS_QVFeedErrorLog] ORDER BY [id] DESC" UpdateCommand="UPDATE [CT_UPS_QVFeedErrorLog] SET [errCode] = @errCode, [errSeverity] = @errSeverity, [errDescription] = @errDescription, [errLocation] = @errLocation, [errLocElement] = @errLocElement, [errDate] = @errDate WHERE [id] = @original_id AND (([errCode] = @original_errCode) OR ([errCode] IS NULL AND @original_errCode IS NULL)) AND (([errSeverity] = @original_errSeverity) OR ([errSeverity] IS NULL AND @original_errSeverity IS NULL)) AND (([errDescription] = @original_errDescription) OR ([errDescription] IS NULL AND @original_errDescription IS NULL)) AND (([errLocation] = @original_errLocation) OR ([errLocation] IS NULL AND @original_errLocation IS NULL)) AND (([errLocElement] = @original_errLocElement) OR ([errLocElement] IS NULL AND @original_errLocElement IS NULL)) AND [errDate] = @original_errDate">
		<DeleteParameters>
			<asp:Parameter Name="original_id" Type="Int32" />
			<asp:Parameter Name="original_errCode" Type="String" />
			<asp:Parameter Name="original_errSeverity" Type="String" />
			<asp:Parameter Name="original_errDescription" Type="String" />
			<asp:Parameter Name="original_errLocation" Type="String" />
			<asp:Parameter Name="original_errLocElement" Type="String" />
			<asp:Parameter DbType="Date" Name="original_errDate" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="errCode" Type="String" />
			<asp:Parameter Name="errSeverity" Type="String" />
			<asp:Parameter Name="errDescription" Type="String" />
			<asp:Parameter Name="errLocation" Type="String" />
			<asp:Parameter Name="errLocElement" Type="String" />
			<asp:Parameter DbType="Date" Name="errDate" />
			<asp:Parameter Name="original_id" Type="Int32" />
			<asp:Parameter Name="original_errCode" Type="String" />
			<asp:Parameter Name="original_errSeverity" Type="String" />
			<asp:Parameter Name="original_errDescription" Type="String" />
			<asp:Parameter Name="original_errLocation" Type="String" />
			<asp:Parameter Name="original_errLocElement" Type="String" />
			<asp:Parameter DbType="Date" Name="original_errDate" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="errCode" Type="String" />
			<asp:Parameter Name="errSeverity" Type="String" />
			<asp:Parameter Name="errDescription" Type="String" />
			<asp:Parameter Name="errLocation" Type="String" />
			<asp:Parameter Name="errLocElement" Type="String" />
			<asp:Parameter DbType="Date" Name="errDate" />
		</InsertParameters>
	</asp:SqlDataSource>
	<asp:LinqDataSource ID="LinqDataSource1" runat="server"></asp:LinqDataSource>
	
	<br />
	<hr />
	<h2>Quantum View Importer Error Log</h2>
	&nbsp;<asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="errID" DataSourceID="QV_Importer_errors" ForeColor="Black" GridLines="Vertical" Width="100%"><Columns>
		<asp:BoundField DataField="errID" HeaderText="errID" InsertVisible="False" ReadOnly="True" SortExpression="errID" />
		<asp:BoundField DataField="errNum" HeaderText="errNum" SortExpression="errNum" />
		<asp:BoundField DataField="errLoc" HeaderText="errLoc" SortExpression="errLoc" />
		<asp:BoundField DataField="errFull" HeaderText="errFull" SortExpression="errFull" />
		<asp:BoundField DataField="errDate" HeaderText="errDate" SortExpression="errDate" />
		<asp:BoundField DataField="refNum1" HeaderText="refNum1" SortExpression="refNum1" />
		<asp:BoundField DataField="refNum2" HeaderText="refNum2" SortExpression="refNum2" />
		</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#CCCCCC" />
	</asp:GridView>
	<asp:SqlDataSource ID="QV_Importer_errors" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" DeleteCommand="DELETE FROM [CT_UPS_QVErrorLog] WHERE [errID] = @original_errID AND [errNum] = @original_errNum AND [errLoc] = @original_errLoc AND [errFull] = @original_errFull AND [errDate] = @original_errDate AND (([refNum1] = @original_refNum1) OR ([refNum1] IS NULL AND @original_refNum1 IS NULL)) AND (([refNum2] = @original_refNum2) OR ([refNum2] IS NULL AND @original_refNum2 IS NULL))" InsertCommand="INSERT INTO [CT_UPS_QVErrorLog] ([errNum], [errLoc], [errFull], [errDate], [refNum1], [refNum2]) VALUES (@errNum, @errLoc, @errFull, @errDate, @refNum1, @refNum2)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CT_UPS_QVErrorLog] ORDER BY [errID] DESC" UpdateCommand="UPDATE [CT_UPS_QVErrorLog] SET [errNum] = @errNum, [errLoc] = @errLoc, [errFull] = @errFull, [errDate] = @errDate, [refNum1] = @refNum1, [refNum2] = @refNum2 WHERE [errID] = @original_errID AND [errNum] = @original_errNum AND [errLoc] = @original_errLoc AND [errFull] = @original_errFull AND [errDate] = @original_errDate AND (([refNum1] = @original_refNum1) OR ([refNum1] IS NULL AND @original_refNum1 IS NULL)) AND (([refNum2] = @original_refNum2) OR ([refNum2] IS NULL AND @original_refNum2 IS NULL))">
		<DeleteParameters>
			<asp:Parameter Name="original_errID" Type="Int32" />
			<asp:Parameter Name="original_errNum" Type="String" />
			<asp:Parameter Name="original_errLoc" Type="String" />
			<asp:Parameter Name="original_errFull" Type="String" />
			<asp:Parameter DbType="Date" Name="original_errDate" />
			<asp:Parameter Name="original_refNum1" Type="String" />
			<asp:Parameter Name="original_refNum2" Type="String" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="errNum" Type="String" />
			<asp:Parameter Name="errLoc" Type="String" />
			<asp:Parameter Name="errFull" Type="String" />
			<asp:Parameter DbType="Date" Name="errDate" />
			<asp:Parameter Name="refNum1" Type="String" />
			<asp:Parameter Name="refNum2" Type="String" />
			<asp:Parameter Name="original_errID" Type="Int32" />
			<asp:Parameter Name="original_errNum" Type="String" />
			<asp:Parameter Name="original_errLoc" Type="String" />
			<asp:Parameter Name="original_errFull" Type="String" />
			<asp:Parameter DbType="Date" Name="original_errDate" />
			<asp:Parameter Name="original_refNum1" Type="String" />
			<asp:Parameter Name="original_refNum2" Type="String" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="errNum" Type="String" />
			<asp:Parameter Name="errLoc" Type="String" />
			<asp:Parameter Name="errFull" Type="String" />
			<asp:Parameter DbType="Date" Name="errDate" />
			<asp:Parameter Name="refNum1" Type="String" />
			<asp:Parameter Name="refNum2" Type="String" />
		</InsertParameters>
	</asp:SqlDataSource>
	
</asp:Content>

