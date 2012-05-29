<%@ Page Language="C#" MasterPageFile="../MasterPage.master" AutoEventWireup="true" CodeFile="PHP_logs.aspx.cs" Inherits="Reporting_PHP_logs" Title="PHP Logs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>PHP Logs</h2>
    <p><a href="<%= Page.ResolveUrl("~")%>PHP_Printable/PHP_dashboard.aspx">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btn_refresh" runat="server" Text="Refresh" onclick="btn_refresh_Click" /></p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" TextMode="MultiLine" Width="100%" Height="58em"></asp:TextBox>
    </p>
    
   
</asp:Content>

