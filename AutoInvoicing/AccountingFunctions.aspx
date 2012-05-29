<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountingFunctions.aspx.cs" Inherits="AutoInvoicing_AccountingFunctions" Title="Accounting Functions Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<style type="text/css">
		.style1
		{
			color: black;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<h2>AutoInvoicing - Accounting Functions</h2>
	<p><a href="<%= Page.ResolveUrl("~")%>AutoInvoicing/ControlPanel.aspx">Back</a></p>
	<p>Use this page to help with Accounting Maintenance functions.</p>
	<h1 style="color:red">NOT FUNCTIONAL YET</h1>
	<p class="style1">Future capabilities:</p>
	<ul>
		<li><p class="style1">Move invoices across batches.</p>
		</li>
		<li><p class="style1">AutoInvoice Management</p>
		</li>
		<li><p class="style1">Invoice Discrepancy Monitoring</p>
		</li>
	</ul>
	<div>
	
	</div>
</asp:Content>

