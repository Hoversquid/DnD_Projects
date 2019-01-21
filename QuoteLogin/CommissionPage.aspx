<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CommissionPage.aspx.cs" Inherits="QuoteLogin.CommissionPage" %>

<%@ Register Assembly="QuoteLogin" Namespace="ControlLibrary.Controls" TagPrefix="cstate" %>

<asp:Content ID="ComissionPage" ContentPlaceHolderID="Main" runat="server">
    <asp:Label runat="server" Font-Bold="true" Font-Size="X-Large" CssClass="MainHeader">Quota Board</asp:Label>
    <asp:GridView ID="ActivitiesGridView" CellPadding="10" CssClass="GridViewBoard" OnRowDataBound="ActivitiesGridView_RowDataBound" DataSourceID="ActivitiesDataSource" runat="server" AutoGenerateColumns="False" ForeColor="#333333" OnRowCreated="ActivitiesGridView_RowCreated" AllowSorting="True">
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
    <asp:Panel ID="CommissionPanel" runat="server">
        <asp:GridView ID="CommissionEmployeeGridView" CssClass="LeftColumnMainBoardDiv" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowCreated="CommissionEmployeeGridView_RowCreated" DataSourceID="EmployeeDataSource" DataKeyNames="EmpID">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID" Visible="false" />
                <asp:TemplateField HeaderText="Name" SortExpression="FName">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("FName") %> ' />
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("LName") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:GridView ID="GridView2" CssClass="RightColumnMainBoardDiv" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ComissionDataSource" DataKeyNames="TrackerID">
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

    <asp:SqlDataSource ID="ActivitiesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [ActivitiesTracker]" />
        
        
    <asp:SqlDataSource ID="ComissionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [AccessoriesTracker]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [AccessoriesTracker] WHERE [TrackerID] = @original_TrackerID AND (([EmpID] = @original_EmpID) OR ([EmpID] IS NULL AND @original_EmpID IS NULL)) AND (([AccName] = @original_AccName) OR ([AccName] IS NULL AND @original_AccName IS NULL)) AND (([AccAmt] = @original_AccAmt) OR ([AccAmt] IS NULL AND @original_AccAmt IS NULL))" InsertCommand="INSERT INTO [AccessoriesTracker] ([TrackerID], [EmpID], [AccName], [AccAmt]) VALUES (@TrackerID, @EmpID, @AccName, @AccAmt)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [AccessoriesTracker] SET [EmpID] = @EmpID, [AccName] = @AccName, [AccAmt] = @AccAmt WHERE [TrackerID] = @original_TrackerID AND (([EmpID] = @original_EmpID) OR ([EmpID] IS NULL AND @original_EmpID IS NULL)) AND (([AccName] = @original_AccName) OR ([AccName] IS NULL AND @original_AccName IS NULL)) AND (([AccAmt] = @original_AccAmt) OR ([AccAmt] IS NULL AND @original_AccAmt IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_TrackerID" Type="Int32" />
            <asp:Parameter Name="original_EmpID" Type="Int32" />
            <asp:Parameter Name="original_AccName" Type="String" />
            <asp:Parameter Name="original_AccAmt" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TrackerID" Type="Int32" />
            <asp:Parameter Name="EmpID" Type="Int32" />
            <asp:Parameter Name="AccName" Type="String" />
            <asp:Parameter Name="AccAmt" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmpID" Type="Int32" />
            <asp:Parameter Name="AccName" Type="String" />
            <asp:Parameter Name="AccAmt" Type="Decimal" />
            <asp:Parameter Name="original_TrackerID" Type="Int32" />
            <asp:Parameter Name="original_EmpID" Type="Int32" />
            <asp:Parameter Name="original_AccName" Type="String" />
            <asp:Parameter Name="original_AccAmt" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="StoreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnectionString %>" />
    <asp:SqlDataSource ID="EmployeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
</asp:Content>
