<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CommissionPage.aspx.cs" Inherits="QuoteLogin.CommissionPage" %>

<%@ Register Assembly="QuoteLogin" Namespace="ControlLibrary.Controls" TagPrefix="cstate" %>

<asp:Content ID="ComissionPage" ContentPlaceHolderID="Main" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>


            <cstate:QuoteControlState ID="qcs" runat="server" />
            <asp:Table runat="server" CellPadding="20" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="QuotaBoardPanelButton" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Quota Board" OnClick="QuotaBoardPanelButton_Click" />
                    </asp:TableCell><asp:TableCell>
                        <asp:Button ID="AccessoriesBoardPanelButton" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Accessories Board" OnClick="AccessoriesBoardPanelButton_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="StoreTotalsPanelButton" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Store Totals" OnClick="StoreTotalsPanelButton_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Panel ID="QuotaBoardPanel" runat="server">
                <asp:Label runat="server" Font-Bold="true" Font-Size="X-Large" CssClass="MainHeader">Quota Board</asp:Label>
                <asp:GridView ID="ActivitiesGridView" Width="80%" CellPadding="10" HorizontalAlign="Center" OnRowDataBound="ActivitiesGridView_RowDataBound" DataSourceID="ActivitiesDataSource" runat="server" AutoGenerateColumns="False" ForeColor="#333333" OnRowCreated="ActivitiesGridView_RowCreated" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" Visible="false" />
                        <asp:BoundField DataField="EmpName" HeaderText="Employee" SortExpression="EmpName" />
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
            <asp:Panel ID="CommissionPanel" CssClass="MenuPanel" runat="server" Visible="false">
                <asp:Label runat="server" Text="Accessories Board" Font-Size="X-Large" Font-Bold="true" />
                <br />
                <div class="LeftColumnMainBoardDiv">
                    <asp:GridView Width="100%" runat="server" Height="200px" ID="EmployeeSelectGridView" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmpID" DataSourceID="EmployeeDataSource" ForeColor="#333333" GridLines="None" OnRowCreated="EmployeeSelectGridView_RowCreated" OnSelectedIndexChanged="EmployeeSelectGridView_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="EmpID" HeaderText="EmpID" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="EmpID" />
                            <asp:BoundField DataField="EmpName" HeaderText="EmpName" ReadOnly="True" SortExpression="EmpName" />
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
                    <asp:Table runat="server" Width="100%" Height="60px">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="3" Font-Bold="true" Font-Size="Large">
                    Select Time Range
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:TextBox ID="TimeRangeStartText" runat="server" TextMode="Date" />
                            </asp:TableCell><asp:TableCell>
                                <asp:TextBox ID="TimeRangeEndText" runat="server" TextMode="Date" />
                            </asp:TableCell></asp:TableRow><asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="TimeRangeStartButton" runat="server" OnClick="TimeRangeStartButton_Click" Text="| <<" />
                            </asp:TableCell><asp:TableCell>
                                <asp:Button ID="TimeRangeEndButton" runat="server" OnClick="TimeRangeEndButton_Click" Text=">> |" />
                            </asp:TableCell></asp:TableRow></asp:Table></div><div class="RightColumnMainBoardDiv">
                    <asp:GridView ID="CommissionEmployeeGridView" Width="100%" Height="260px" PageSize="8" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowCreated="CommissionEmployeeGridView_RowCreated" DataSourceID="ComissionDataSource" DataKeyNames="TrackerID" AllowPaging="True" OnSelectedIndexChanged="CommissionEmployeeGridView_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="TrackerID" HeaderText="TrackerID" SortExpression="TrackerID" ReadOnly="True" InsertVisible="False" Visible="false" />
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
                    <asp:DetailsView ID="SelectedAccessoryDetailView" Height="60px" Width="100%" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="TrackerID" DataSourceID="SelectedCustomerAccessoryListDataSource" ForeColor="#333333" GridLines="None">
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <EditRowStyle BackColor="#999999" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Width="30%" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="TrackerID" HeaderText="TrackerID" InsertVisible="False" ReadOnly="True" SortExpression="TrackerID" Visible="false" />
                            <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" Visible="false" />
                            <asp:BoundField DataField="AccName" HeaderText="Accessory" SortExpression="AccName" />
                            <asp:BoundField DataField="AccAmt" HeaderText="Amount" SortExpression="AccAmt" />
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:DetailsView>
                </div>
            </asp:Panel>
            <asp:Panel ID="StoreTotalsPanel" runat="server" CssClass="MenuPanel" Visible="false">
                <asp:Label ID="StoreTotalsLabel" runat="server" Text="Store Totals Board" Font-Bold="true" Font-Size="X-Large" />
                <br />
                <div class="LeftColumnTotalsBoardDiv">
                    <asp:GridView ID="StoreSelectionGridView" Width="100%" OnRowCreated="StoreSelectionGridView_RowCreated" OnSelectedIndexChanged="StoreSelectionGridView_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="StoreDataSource" ForeColor="#333333" GridLines="None" DataKeyNames="StoreID">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="StoreID" HeaderText="StoreID" InsertVisible="False" ReadOnly="True" SortExpression="StoreID" Visible="false" />
                            <asp:BoundField DataField="StoreName" HeaderText="StoreName" SortExpression="StoreName" />
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
                </div>
                <div class="RightColumnTotalsBoardDiv">
                    <asp:GridView ID="StoreTotalsGridView" Width="84%" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" OnRowCreated="StoreTotalsGridView_RowCreated" DataSourceID="StoreTotalsDataSource" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="StoreID" HeaderText="StoreID" SortExpression="StoreID" Visible="false" />
                            <asp:BoundField DataField="StoreQuotaRepairs" HeaderText="Q" SortExpression="StoreQuotaRepairs" />
                            <asp:BoundField DataField="StoreActualRepairs" HeaderText="A" SortExpression="StoreActualRepairs" />
                            <asp:BoundField DataField="StoreQuotaAccessories" HeaderText="Q" SortExpression="StoreQuotaAccessories" />
                            <asp:BoundField DataField="StoreActualAccessories" HeaderText="A" SortExpression="StoreActualAccessories" />
                            <asp:BoundField DataField="StoreQuotaPO" HeaderText="Q" SortExpression="StoreQuotaPO" />
                            <asp:BoundField DataField="StoreActualPO" HeaderText="A" SortExpression="StoreActualPO" />
                            <asp:BoundField DataField="StoreQuotaTnD" HeaderText="Q" SortExpression="StoreQuotaTnD" />
                            <asp:BoundField DataField="StoreActualTnD" HeaderText="A" SortExpression="StoreActualTnD" />
                            <asp:BoundField DataField="StoreQuotaTnDC" HeaderText="Q" SortExpression="StoreQuotaTnDC" />
                            <asp:BoundField DataField="StoreActualTnDC" HeaderText="A" SortExpression="StoreActualTnDC" />
                            <asp:BoundField DataField="StoreQuotaTotal" HeaderText="Q" SortExpression="StoreQuotaTotal" />
                            <asp:BoundField DataField="StoreActualTotal" HeaderText="A" SortExpression="StoreActualTotal" />
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
                </div>
            </asp:Panel>
            <asp:Panel ID="AdminPanel" runat="server">
            </asp:Panel>
            <asp:Table runat="server" CssClass="PageAction" ID="PageActionTable" CellPadding="20" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="PageSignOutButton" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Sign Out" />
                    </asp:TableCell><asp:TableCell>
                        <asp:Button ID="PageBackButton" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Back" />
                    </asp:TableCell></asp:TableRow></asp:Table><asp:SqlDataSource ID="ActivitiesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [ActivitiesTracker]" />
            <asp:SqlDataSource ID="ComissionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [AccessoriesTracker] WHERE (EmpID = @SelectedEmpID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [AccessoriesTracker] WHERE [TrackerID] = @original_TrackerID AND (([EmpID] = @original_EmpID) OR ([EmpID] IS NULL AND @original_EmpID IS NULL)) AND (([AccName] = @original_AccName) OR ([AccName] IS NULL AND @original_AccName IS NULL)) AND (([AccAmt] = @original_AccAmt) OR ([AccAmt] IS NULL AND @original_AccAmt IS NULL))" InsertCommand="INSERT INTO [AccessoriesTracker] ([EmpID], [AccName], [AccAmt]) VALUES (@EmpID, @AccName, @AccAmt)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [AccessoriesTracker] SET [EmpID] = @EmpID, [AccName] = @AccName, [AccAmt] = @AccAmt WHERE [TrackerID] = @original_TrackerID AND (([EmpID] = @original_EmpID) OR ([EmpID] IS NULL AND @original_EmpID IS NULL)) AND (([AccName] = @original_AccName) OR ([AccName] IS NULL AND @original_AccName IS NULL)) AND (([AccAmt] = @original_AccAmt) OR ([AccAmt] IS NULL AND @original_AccAmt IS NULL))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="qcs" Name="SelectedEmpID" Type="Int32" DefaultValue="" PropertyName="SelectedEmpID" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_TrackerID" Type="Int32" />
                    <asp:Parameter Name="original_EmpID" Type="Int32" />
                    <asp:Parameter Name="original_AccName" Type="String" />
                    <asp:Parameter Name="original_AccAmt" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
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
            <asp:SqlDataSource ID="StoreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [Store_Locations]" />
            <asp:SqlDataSource ID="StoreTotalsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [StoreTotalTracker] WHERE [StoreID] = @StoreID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="qcs" Name="StoreID" Type="Int32" DefaultValue="" PropertyName="StoreID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="EmployeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="EXEC GetAllEmpNames" />
            <asp:SqlDataSource ID="SelectedCustomerAccessoryListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [AccessoriesTracker] WHERE (TrackerID = @TrackerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="qcs" Name="TrackerID" Type="Int32" DefaultValue="" PropertyName="TrackerID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="StoreSelfTrackerDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:QuoteDBConnection %>' SelectCommand="SELECT * FROM [StoreSelfTracker]" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
