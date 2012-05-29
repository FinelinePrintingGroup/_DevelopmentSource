<%@ Page Language="C#" MasterPageFile="../MasterPage.master" AutoEventWireup="true" CodeFile="PTI_errors.aspx.cs" Inherits="ErrorLogs_PTI_errors" Title="PTI Errors" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h4>This is the error logs page for the PTI applications.</h4>
    <p><a href="<%= Page.ResolveUrl("~")%>PHP_Printable/PHP_dashboard.aspx">Back</a></p>
	<p style="margin-left: 40px"><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="errNumSelect" DataTextField="errNum" DataValueField="errNum" Height="23px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="true" style="font-weight: 700" Width="130px" AutoPostBack="True">
		<asp:ListItem Text="Error Number" Value="" /> </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btn_viewAll" runat="server" onclick="btn_viewAll_Click" Text="View All" Height="27px" style="font-weight: 700" UseSubmitBehavior="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" Width="369px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btn_search" runat="server" onclick="btn_search_Click" Text="Search" Height="27px" style="font-weight: 700" />
&nbsp;<asp:SqlDataSource ID="errNumSelect" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT DISTINCT [errNum] FROM [CT_PTI_ErrorLog] ORDER BY [errNum] DESC"></asp:SqlDataSource>
	</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="errID" DataSourceID="Printable" ForeColor="Black" 
        GridLines="Vertical" PageSize="50" RowHeaderColumn="errID" Width="100%" style="font-size: small">
        <Columns>
            <asp:BoundField DataField="errID" HeaderText="errID" InsertVisible="False" 
                ReadOnly="True" SortExpression="errID" />
            <asp:BoundField DataField="errNum" HeaderText="errNum" 
                SortExpression="errNum" />
            <asp:BoundField DataField="errDesc" HeaderText="errDesc" 
                SortExpression="errDesc" />
            <asp:BoundField DataField="errMsg" HeaderText="errMsg" 
                SortExpression="errMsg" />
            <asp:BoundField DataField="errDate" HeaderText="errDate" 
                SortExpression="errDate" />
            <asp:BoundField DataField="printableID" HeaderText="printableID" 
                SortExpression="printableID" />
            <asp:BoundField DataField="packingSlipNum" HeaderText="packingSlipNum" 
                SortExpression="packingSlipNum" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
    </p>
    <p>&nbsp;</p>
<p>
    <asp:SqlDataSource ID="Printable" runat="server" 
        ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" 
        SelectCommand="SELECT * FROM [CT_PTI_ErrorLog] ORDER BY [errID] DESC">
    </asp:SqlDataSource>
</p>
    
</asp:Content>

