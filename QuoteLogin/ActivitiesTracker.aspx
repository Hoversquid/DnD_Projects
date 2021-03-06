﻿<%@ Page MasterPageFile="MasterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="ActivitiesTracker.aspx.cs" Inherits="QuoteLogin.ActivitiesTracker" Title="Opening and Closing Procedures" %>

<%@ Register Assembly="QuoteLogin" Namespace="ControlLibrary.Controls" TagPrefix="cstate" %>

<asp:Content ID="MainProcedureChecklist" ContentPlaceHolderID="Main" runat="server">
    <asp:GridView ID="ActivitiesGridView" CellPadding="5"  HorizontalAlign="Center" DataSourceID="ActivitiesDataSource" runat="server" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnRowCreated="ActivitiesGridView_RowCreated" OnSelectedIndexChanged="ActivitiesGridView_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" Visible="false" />
            <asp:BoundField DataField="RepairsQuota" HeaderText="Q" SortExpression="RepairsQuota" />
            <asp:BoundField DataField="RepairsDone" HeaderText="A" SortExpression="RepairsDone" />
            <asp:BoundField DataField="AccessoriesQuota" HeaderText="Q" SortExpression="AccessoriesQuota" />
            <asp:BoundField DataField="AccessoriesDone" HeaderText="A" SortExpression="AccessoriesDone" />
            <asp:BoundField DataField="PreownedQuota" HeaderText="Q" SortExpression="PreownedQuota" />
            <asp:BoundField DataField="PreownedDone" HeaderText="A" SortExpression="PreownedDone" />
            <asp:BoundField DataField="TnDQuota" HeaderText="Q" SortExpression="TnDQuota" />
            <asp:BoundField DataField="TnDDone" HeaderText="A" SortExpression="TnDDone" />
            <asp:BoundField DataField="TnDCQuota" HeaderText="Q" SortExpression="TnDCQuota" />
            <asp:BoundField DataField="TnDCDone" HeaderText="A" SortExpression="TnDCDone" />
            <asp:BoundField DataField="TotalQuota" HeaderText="Total" SortExpression="TotalQuota" />
            <asp:BoundField DataField="TotalDone" HeaderText="Remaining" SortExpression="TotalDone" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="ActivitiesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnectionString %>" SelectCommand="SELECT * FROM [ActivitiesTracker]" />
</asp:Content>
