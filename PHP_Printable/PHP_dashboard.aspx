<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PHP_dashboard.aspx.cs" Inherits="UPS_Integration_UPS_dashboard" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Printable Integration - System Dashboard</h2>
    <a href="<%= Page.ResolveUrl("~")%>Default.aspx">Back</a>
    <div class="sideNav">
        <p><a href="<%= Page.ResolveUrl("~") %>PHP_Printable/PHP_logs.aspx">PHP Logs</a></p>
        <p><a href="<%= Page.ResolveUrl("~") %>PHP_Printable/PTI_errors.aspx">PTI Console Error Log</a></p>
    </div>
</asp:Content>

