<%@ Page Language="C#" MasterPageFile="../MasterPage.master" AutoEventWireup="true" CodeFile="switchboard.aspx.cs" Inherits="Automation_switchboard" Title="Automation Switchboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server"><h2>Automation Switchboard</h2>
	<p>Use this to turn on/off certain functionalities within automation.</p>
	
	<h1 style="color:red">NOT FUNCTIONAL YET</h1>
	<div class="sideNav">
		<p><span class="style1">Automation System:</span><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="systemsColumn" DataTextField="system" AutoPostBack="True" style="font-size: large"></asp:DropDownList>
			<asp:SqlDataSource ID="systemsColumn" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT DISTINCT [system] FROM [CT_Switchboard]"></asp:SqlDataSource>
		</p>
		<p><asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="variable,system" DataSourceID="list" ForeColor="Black" GridLines="Vertical" Width="395px"><Columns>
			<asp:CommandField ShowEditButton="True" />
			<asp:BoundField DataField="variable" HeaderText="variable" ReadOnly="True" SortExpression="variable" />
			<asp:BoundField DataField="system" HeaderText="system" ReadOnly="True" SortExpression="system" />
			<asp:CheckBoxField DataField="switch" HeaderText="switch" SortExpression="switch" />
			</Columns>
			<FooterStyle BackColor="#CCCCCC" />
			<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
			<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
			<AlternatingRowStyle BackColor="#CCCCCC" />
			</asp:GridView>
			<asp:SqlDataSource ID="list" runat="server" ConnectionString="<%$ ConnectionStrings:printableConnectionString %>" SelectCommand="SELECT CT_Switchboard.* FROM CT_Switchboard WHERE system = @system2" UpdateCommand="UPDATE CT_Switchboard SET switch = @switch WHERE (variable = @variable) AND (system = @system)"><SelectParameters>
				<asp:ControlParameter ControlID="DropDownList1" Name="system2" PropertyName="SelectedValue" Type="String" />
				</SelectParameters>
				<UpdateParameters>
				<asp:Parameter Name="switch" />
				<asp:Parameter Name="variable" />
				<asp:Parameter Name="system" />
				</UpdateParameters>
			</asp:SqlDataSource>
		</p>
	</div>
</asp:Content>
