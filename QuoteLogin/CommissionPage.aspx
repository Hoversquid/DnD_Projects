<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CommissionPage.aspx.cs" Inherits="QuoteLogin.CommissionPage" %>

<%@ Register Assembly="QuoteLogin" Namespace="ControlLibrary.Controls" TagPrefix="cstate" %>

<asp:Content ID="ComissionPage" ContentPlaceHolderID="Main" runat="server">
    <asp:Table runat="server" CellPadding="20" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="Button1" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Quota Board" />
            </asp:TableCell><asp:TableCell>
                <asp:Button ID="Button2" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Accessories Board" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Panel ID="QuotaBoardPanel" runat="server">
        <asp:Label runat="server" Font-Bold="true" Font-Size="X-Large" CssClass="MainHeader">Quota Board</asp:Label>
        <asp:GridView ID="ActivitiesGridView" CellPadding="10" Width="86%" HorizontalAlign="Center" OnRowDataBound="ActivitiesGridView_RowDataBound" DataSourceID="ActivitiesDataSource" runat="server" AutoGenerateColumns="False" ForeColor="#333333" OnRowCreated="ActivitiesGridView_RowCreated" AllowSorting="True">
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
    </asp:Panel>
    <asp:Panel ID="CommissionPanel" runat="server" CssClass="MenuPanel">
        <asp:Label runat="server" Text="Accessories Board" Font-Size="X-Large" Font-Bold="true" />
        <br />
        <asp:DropDownList ID="EmployeeSelectDropdown" runat="server" AppendDataBoundItems="true">
            <asp:ListItem Value="None" Text="Select Employee"></asp:ListItem>
        </asp:DropDownList>
        <asp:GridView ID="GridView2" CssClass="LeftColumnMainBoardDiv" PageSize="8" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ComissionDataSource" DataKeyNames="TrackerID" AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="TrackerID" HeaderText="TrackerID" SortExpression="TrackerID" ReadOnly="True" Visible="false" />
                            <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" Visible="false" />
                            <asp:BoundField DataField="AccName" HeaderText="AccName" SortExpression="AccName" />
                            <asp:BoundField DataField="AccAmt" HeaderText="AccAmt" SortExpression="AccAmt" />
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

    </asp:Panel>
    <asp:Table runat="server" CssClass="PageAction" ID="PageActionTable" CellPadding="20" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="PageSignOutButton" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Sign Out" OnClick="PageSignOutButton_Click" />
            </asp:TableCell><asp:TableCell>
                <asp:Button ID="PageBackButton" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Back" OnClick="PageBackButton_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:SqlDataSource ID="ActivitiesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [ActivitiesTracker]" />
    <asp:SqlDataSource ID="ComissionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [AccessoriesTracker] WHERE (EmpID = @SelectedEmpID)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="qcs" Name="SelectedEmpID" Type="Int32" DefaultValue="" PropertyName="SelectedEmpId" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="F_Name" Type="String" />
            <asp:Parameter Name="L_Name" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="qcs" Name="CustID" Type="Int32" DefaultValue="" PropertyName="SelectedEmpId" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="F_Name" Type="String" />
            <asp:Parameter Name="L_Name" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="CustID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="StoreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnectionString %>" />
    <asp:SqlDataSource ID="EmployeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
</asp:Content>
