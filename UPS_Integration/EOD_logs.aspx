<%@ Page Language="C#" MasterPageFile="../MasterPage.master" AutoEventWireup="true" CodeFile="EOD_logs.aspx.cs" Inherits="Reporting_EOD_logs" Title="EOD Logs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><a href="<%= Page.ResolveUrl("~")%>UPS_Integration/UPS_dashboard.aspx">Back</a></p>
	<h2>"EOD Export&quot; Log</h2>
    <asp:TextBox ID="txt_searchExport" runat="server" Width="355px"></asp:TextBox>&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="drop_export" runat="server">
        <asp:ListItem>id</asp:ListItem>
        <asp:ListItem Selected="True">shipmentNum</asp:ListItem>
        <asp:ListItem>dateShipped</asp:ListItem>
        <asp:ListItem>trackingNum</asp:ListItem>
        <asp:ListItem>shipmentCharges</asp:ListItem>
        <asp:ListItem>EOD_processed</asp:ListItem>
        <asp:ListItem>shipmentType</asp:ListItem>
        <asp:ListItem>totalShipmentCharge</asp:ListItem>
        <asp:ListItem>billTo</asp:ListItem>
        <asp:ListItem>International_processed</asp:ListItem>
    </asp:DropDownList>&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btn_searchExport" runat="server" onclick="btn_searchExport_Click" Text="Search" />
	<br /><br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            DataKeyNames="id" DataSourceID="EODexport" ForeColor="Black" 
            GridLines="Vertical" PageSize="20" Width="100%">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="shipmentNum" HeaderText="shipmentNum" 
                    SortExpression="shipmentNum" />
                <asp:BoundField DataField="dateShipped" HeaderText="dateShipped" 
                    SortExpression="dateShipped" />
                <asp:HyperLinkField DataNavigateUrlFields="trackingNum" DataTextField="trackingNum" HeaderText="trackingNum" DataNavigateUrlFormatString="http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums={0}"
                    SortExpression="trackingNum" />
                <asp:BoundField DataField="shipmentCharges" HeaderText="shipmentCharges" SortExpression="shipmentCharges" />
                <asp:CheckBoxField DataField="EOD_processed" HeaderText="EOD_processed" 
                    SortExpression="EOD_processed" />
                <asp:BoundField DataField="shipmentType" HeaderText="shipmentType" 
                    SortExpression="shipmentType" />
                <asp:BoundField DataField="totalShipmentCharge" 
                    HeaderText="totalShipmentCharge" SortExpression="totalShipmentCharge" />
                <asp:BoundField DataField="billTo" HeaderText="billTo" 
                    SortExpression="billTo" />
                <asp:CheckBoxField DataField="International_processed" 
                    HeaderText="Int'l" SortExpression="International_processed" ItemStyle-Width="50px" >
<ItemStyle Width="50px"></ItemStyle>
				</asp:CheckBoxField>
            	<asp:BoundField DataField="countryCode" HeaderText="countryCode" SortExpression="countryCode" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        		<hr />
        		<h2>&quot;EOD Items&quot; Log</h2>
        		<asp:TextBox ID="txt_searchItems" runat="server" Width="355px"></asp:TextBox>&nbsp;
		<asp:DropDownList ID="DropDownList1" runat="server">
			<asp:ListItem>id</asp:ListItem>
			<asp:ListItem>exportID</asp:ListItem>
			<asp:ListItem Selected="True">shipmentNum</asp:ListItem>
			<asp:ListItem>shipmentLineNum</asp:ListItem>
			<asp:ListItem>itemCharges</asp:ListItem>
			<asp:ListItem>EOD_processed</asp:ListItem>
			<asp:ListItem>PTI_processed</asp:ListItem>
    		<asp:ListItem>PTI_lineItemID</asp:ListItem>
			<asp:ListItem>Logic_jobNum</asp:ListItem>
			<asp:ListItem>Logic_FGNum</asp:ListItem>
		</asp:DropDownList>&nbsp;
    <asp:Button ID="btn_searchItems" runat="server" onclick="btn_searchItems_Click" Text="Search" />
	<br /><br />

    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="EODitems" ForeColor="Black" GridLines="Vertical" PageSize="20" Width="100%">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="exportID" HeaderText="exportID" SortExpression="exportID" />
            <asp:BoundField DataField="shipmentNum" HeaderText="shipmentNum" SortExpression="shipmentNum" />
            <asp:BoundField DataField="shipmentLineNum" HeaderText="shipmentLineNum" SortExpression="shipmentLineNum" />
            <asp:BoundField DataField="itemCharges" HeaderText="itemCharges" SortExpression="itemCharges" />
            <asp:CheckBoxField DataField="EOD_processed" HeaderText="EOD_processed" SortExpression="EOD_processed" />
            <asp:CheckBoxField DataField="PTI_processed" HeaderText="PTI_processed" SortExpression="PTI_processed" />
            <asp:BoundField DataField="PTI_lineItemID" HeaderText="PTI_lineItemID" SortExpression="PTI_lineItemID" />
            <asp:BoundField DataField="Logic_jobNum" HeaderText="Logic_jobNum" SortExpression="Logic_jobNum" />
            <asp:BoundField DataField="Logic_FGNum" HeaderText="Logic_FGNum" SortExpression="Logic_FGNum" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
    <asp:SqlDataSource ID="EODitems" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT * FROM [CT_UPS_EODitems] ORDER BY [id] DESC"></asp:SqlDataSource>

        
        <asp:SqlDataSource ID="EODexport" runat="server" 
            ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" 
            SelectCommand="SELECT * FROM [CT_UPS_EODexport] ORDER BY [id] DESC">
        </asp:SqlDataSource>
				<br />
	<hr />
	<h2>UPS Exception Log</h2>
	<p><asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="shipmentNumber,exceptionNum" DataSourceID="UPS_exceptions" ForeColor="Black" GridLines="Vertical" Width="150%" Font-Size="Smaller"><Columns>
		<asp:BoundField DataField="shipmentNumber" HeaderText="shipmentNumber" ReadOnly="True" SortExpression="shipmentNumber" />
		<asp:BoundField DataField="exceptionNum" HeaderText="xNum" InsertVisible="False" ReadOnly="True" SortExpression="exceptionNum" />
		<asp:BoundField DataField="exceptionDate" HeaderText="xDate" SortExpression="exceptionDate" />
		<asp:BoundField DataField="exceptionReasonCode" HeaderText="xCode" SortExpression="exceptionReasonCode" />
		<asp:BoundField DataField="exceptionDescription" HeaderText="xDescription" SortExpression="exceptionDescription" />
		<asp:BoundField DataField="exceptionCost" HeaderText="xCost" SortExpression="exceptionCost" />
<asp:BoundField DataField="resolutionCode" HeaderText="rCode" SortExpression="resolutionCode"></asp:BoundField>
		<asp:BoundField DataField="resolutionDescription" HeaderText="rDescription" SortExpression="resolutionDescription" />
		<asp:HyperLinkField DataNavigateUrlFields="trackingNumber" DataTextField="trackingNumber" HeaderText="Tracking" DataNavigateUrlFormatString="http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums={0}"
                    SortExpression="trackingNumber" />
		<asp:BoundField DataField="loggedDate" HeaderText="loggedDate" SortExpression="loggedDate" />
		<asp:BoundField DataField="jobN" HeaderText="jobN" SortExpression="jobN" />
		<asp:CheckBoxField DataField="notified" HeaderText="notified" SortExpression="notified" />
		<asp:CheckBoxField DataField="invoiced" HeaderText="invoiced" SortExpression="invoiced" />
		</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#CCCCCC" />
		</asp:GridView>
		<asp:SqlDataSource ID="UPS_exceptions" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" DeleteCommand="DELETE FROM [CT_UPS_ExceptionLog] WHERE [shipmentNumber] = @original_shipmentNumber AND [exceptionNum] = @original_exceptionNum AND (([exceptionDate] = @original_exceptionDate) OR ([exceptionDate] IS NULL AND @original_exceptionDate IS NULL)) AND (([exceptionDescription] = @original_exceptionDescription) OR ([exceptionDescription] IS NULL AND @original_exceptionDescription IS NULL)) AND (([exceptionCost] = @original_exceptionCost) OR ([exceptionCost] IS NULL AND @original_exceptionCost IS NULL)) AND (([trackingNumber] = @original_trackingNumber) OR ([trackingNumber] IS NULL AND @original_trackingNumber IS NULL))" InsertCommand="INSERT INTO [CT_UPS_ExceptionLog] ([shipmentNumber], [exceptionNum], [exceptionDate], [exceptionDescription], [exceptionCost], [trackingNumber]) VALUES (@shipmentNumber, @exceptionNum, @exceptionDate, @exceptionDescription, @exceptionCost, @trackingNumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CT_UPS_ExceptionLog] ORDER BY [exceptionNum] DESC" UpdateCommand="UPDATE [CT_UPS_ExceptionLog] SET [exceptionDate] = @exceptionDate, [exceptionDescription] = @exceptionDescription, [exceptionCost] = @exceptionCost, [trackingNumber] = @trackingNumber WHERE [shipmentNumber] = @original_shipmentNumber AND [exceptionNum] = @original_exceptionNum AND (([exceptionDate] = @original_exceptionDate) OR ([exceptionDate] IS NULL AND @original_exceptionDate IS NULL)) AND (([exceptionDescription] = @original_exceptionDescription) OR ([exceptionDescription] IS NULL AND @original_exceptionDescription IS NULL)) AND (([exceptionCost] = @original_exceptionCost) OR ([exceptionCost] IS NULL AND @original_exceptionCost IS NULL)) AND (([trackingNumber] = @original_trackingNumber) OR ([trackingNumber] IS NULL AND @original_trackingNumber IS NULL))">
			<DeleteParameters>
				<asp:Parameter Name="original_shipmentNumber" Type="Int32" />
				<asp:Parameter Name="original_exceptionNum" Type="Int32" />
				<asp:Parameter DbType="Date" Name="original_exceptionDate" />
				<asp:Parameter Name="original_exceptionDescription" Type="String" />
				<asp:Parameter Name="original_exceptionCost" Type="Decimal" />
				<asp:Parameter Name="original_trackingNumber" Type="String" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter DbType="Date" Name="exceptionDate" />
				<asp:Parameter Name="exceptionDescription" Type="String" />
				<asp:Parameter Name="exceptionCost" Type="Decimal" />
				<asp:Parameter Name="trackingNumber" Type="String" />
				<asp:Parameter Name="original_shipmentNumber" Type="Int32" />
				<asp:Parameter Name="original_exceptionNum" Type="Int32" />
				<asp:Parameter DbType="Date" Name="original_exceptionDate" />
				<asp:Parameter Name="original_exceptionDescription" Type="String" />
				<asp:Parameter Name="original_exceptionCost" Type="Decimal" />
				<asp:Parameter Name="original_trackingNumber" Type="String" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="shipmentNumber" Type="Int32" />
				<asp:Parameter Name="exceptionNum" Type="Int32" />
				<asp:Parameter DbType="Date" Name="exceptionDate" />
				<asp:Parameter Name="exceptionDescription" Type="String" />
				<asp:Parameter Name="exceptionCost" Type="Decimal" />
				<asp:Parameter Name="trackingNumber" Type="String" />
			</InsertParameters>
		</asp:SqlDataSource>
	</p>
</asp:Content>

