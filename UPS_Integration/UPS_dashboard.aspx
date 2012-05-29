<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UPS_dashboard.aspx.cs" Inherits="UPS_Integration_UPS_dashboard" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>UPS - System Dashboard</h2>
    <a href="<%= Page.ResolveUrl("~")%>Default.aspx">Back</a>
    <div class="sideNav">
        <p><a href="<%= Page.ResolveUrl("~") %>UPS_Integration/consume.aspx">UPS Billing - File Processor</a></p>
        <p><a href="<%= Page.ResolveUrl("~") %>UPS_Integration/EOD_logs.aspx">UPS/EOD Logs</a></p>
        <p><a href="<%= Page.ResolveUrl("~") %>UPS_Integration/EOD_errors.aspx">UPS/EOD Error Logs</a></p>
    </div>
</asp:Content>

