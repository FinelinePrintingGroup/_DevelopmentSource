<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Fineline Development</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Welcome to the Development Front-End</h2>
    <div class="sideNav">
        
        <p><a href="AutoInvoicing/ControlPanel.aspx">AutoInvoicing Application</a></p>
        <hr />
        <p><a href="UPS_Integration/UPS_dashboard.aspx">UPS Integration</a></p>
        <p><a href="PHP_Printable/PHP_dashboard.aspx">Printable Integration</a></p>
        <p><a href="Ariba_Integration/AribaIntegration.aspx">Ariba Integration</a></p>
        <hr />
        <p><a href="Automation/switchboard.aspx">Automation Switchboard</a> <i>(In Development)</i></p>
        <hr />
        <p><a href="mailto:ShawnH@Finelink.com?Subject=DevWeb%20Contact">Contact the Dev.</a></p>
        
        
        <hr />
        <p><a href="http://crm1/intra/dev/Projects/Jupiter/">Project Jupiter</a> <i>(In Development)</i></p>
        <p><a href="http://crm1/intra/dev/Projects/Jupiter_Test/">Jupiter-Test</a> <i>(In Development)</i></p>
        
    </div>
</asp:Content>
