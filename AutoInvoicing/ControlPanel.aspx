<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ControlPanel.aspx.cs" Inherits="AutoInvoicing_ControlPanel" Title="AutoInvoicing Control Panel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<h2>AutoInvoicing - Control Panel</h2>
	<p><a href="<%= Page.ResolveUrl("~")%>Default.aspx">Back</a></p>
    <div class="sideNav">
        <p><a href="AUTO_errors.aspx">AUTO Error Logs</a></p>
        <p><a href="AutoInvoicing_logs.aspx">AutoInvoicing Logs</a></p>
        <hr />
        <p><a href="VacationAlerts.aspx">CSR Vacation Alert Redirection</a></p>
        <p><a href="AlertJobTest.aspx">AlertJobs Testing</a></p>
        <p><a href="AccountingFunctions.aspx">Accounting Functions</a> <i>(In Development)</i></p>
        <p><a href="WinAcctContents.aspx">Logic Accounting Tables</a></p>
    </div>
</asp:Content>

