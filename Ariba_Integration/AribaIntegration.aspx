<%@ Page Language="C#" MasterPageFile="../MasterPage.master" AutoEventWireup="true" CodeFile="AribaIntegration.aspx.cs" Inherits="Reporting_AribaIntegration" Title="Ariba Integration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p><a href="<%= Page.ResolveUrl("~")%>Default.aspx">Back</a></p>
<div>
<h2>Ariba Integration Response Codes</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" 
            DataKeyNames="id" DataSourceID="AribaResponseCodes" ForeColor="Black" GridLines="Vertical" 
            Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
            BorderWidth="1px" PageSize="15" RowHeaderColumn="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" 
                    SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" />
                <asp:BoundField DataField="Msg" HeaderText="Msg" SortExpression="Msg" />
                <asp:BoundField DataField="date_created" HeaderText="date_created" 
                    SortExpression="date_created" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    
        <h2>Ariba Integration Payload Log</h2>
        
        <p><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="id" DataSourceID="Printable" ForeColor="Black" 
            GridLines="Vertical" Height="178px" Width="100%" AllowPaging="True" 
                AllowSorting="True" PageSize="15" RowHeaderColumn="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="payloadID" HeaderText="payloadID" 
                    SortExpression="payloadID" />
                <asp:BoundField DataField="timestamp" HeaderText="timestamp" 
                    SortExpression="timestamp" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="date_created" HeaderText="date_created" 
                    SortExpression="date_created" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        
    <p>
        <asp:SqlDataSource ID="AribaResponseCodes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" 
            SelectCommand="SELECT * FROM [CT_AUTO_AribaResponseCode] ORDER BY [id] DESC">
        </asp:SqlDataSource>
    </p>

</div>
    <asp:SqlDataSource ID="Printable" runat="server" 
        ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" 
        SelectCommand="SELECT * FROM [CT_AUTO_AribaPayloadLog] ORDER BY [id] DESC">
    </asp:SqlDataSource>
</asp:Content>

