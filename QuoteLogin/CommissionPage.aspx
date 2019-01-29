<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CommissionPage.aspx.cs" Inherits="QuoteLogin.CommissionPage" %>

<%@ Register Assembly="QuoteLogin" Namespace="ControlLibrary.Controls" TagPrefix="cstate" %>

<asp:Content ID="ComissionPage" ContentPlaceHolderID="Main" runat="server">
    <cstate:QuoteControlState ID="qcs" runat="server" />
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <div class="TopMenuDiv">
                <asp:Panel ID="StoreSelectionPanel" CssClass="LeftColumnMenu" runat="server">
                    <asp:Label runat="server" CssClass="DropdownLabel" Font-Bold="true" Font-Size="Large">Store: </asp:Label>
                    <asp:DropDownList ID="SelectedStoreDropdown" OnSelectedIndexChanged="SelectedStoreDropdown_SelectedIndexChanged" CssClass="DropdownWithLabel" AutoPostBack="true" AppendDataBoundItems="true" runat="server" DataSourceID="StoreDataSource" DataTextField="StoreName" DataValueField="StoreID">
                        <asp:ListItem Value="0" Text="Select store" Selected="true" />
                    </asp:DropDownList>
                </asp:Panel>
                <asp:Panel ID="ButtonMenuPanel" CssClass="RightColumnMenu" Visible="false" runat="server">
                    <asp:Table runat="server" CellPadding="5" CssClass="SelectionMenu" HorizontalAlign="Center">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="QuotaBoardPanelButton" CssClass="InputCell" CausesValidation="false" runat="server" Text="Quota Board" OnClick="QuotaBoardPanelButton_Click" />
                            </asp:TableCell><asp:TableCell>
                                <asp:Button ID="AccessoriesBoardPanelButton" CssClass="InputCell" CausesValidation="false" runat="server" Text="Accessories Board" OnClick="AccessoriesBoardPanelButton_Click" />
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="StoreTotalsPanelButton"  CssClass="InputCell" CausesValidation="false" runat="server" Text="Store Totals" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:Panel>
            </div>
            <br />
            <asp:Panel ID="LabelPanel" runat="server" HorizontalAlign="Center" Visible="false">
                <asp:Table runat="server" CellPadding="2" CssClass="SelectionMenu" HorizontalAlign="Center">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="BoardLabel" Font-Bold="true" Font-Size="X-Large" runat="server" />
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="StoreLabel" Font-Bold="true" Font-Size="X-Large" runat="server" />
                        </asp:TableCell></asp:TableRow></asp:Table></asp:Panel><br /><asp:Panel ID="QuotaBoardPanel" runat="server" Visible="false" CssClass="GridViewBoard">
                <asp:GridView ID="StoreQuotasGridView" HorizontalAlign="Center" CellPadding="10" runat="server" AutoGenerateColumns="False" OnRowCreated="StoreTotalsGridView_RowCreated" DataSourceID="StoreTotalsDataSource" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="StoreID" HeaderText="StoreID" SortExpression="StoreID" Visible="false" />
                        <asp:BoundField ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="140px" />
                        <asp:BoundField ItemStyle-Width="140px" DataField="StoreQuotaRepairs" HeaderText="Repairs" SortExpression="StoreQuotaRepairs" />
                        <asp:BoundField ItemStyle-Width="140px" DataField="StoreQuotaAccessories" DataFormatString="{0:N2}" HeaderText="Accessories" SortExpression="StoreQuotaAccessories" />
                        <asp:BoundField ItemStyle-Width="140px" DataField="StoreQuotaPO" HeaderText="Preowned" SortExpression="StoreQuotaPO" />
                        <asp:BoundField ItemStyle-Width="140px" DataField="StoreQuotaTnD" HeaderText="TnD" SortExpression="StoreQuotaTnD" />
                        <asp:BoundField ItemStyle-Width="140px" DataField="StoreQuotaTnDC" HeaderText="TnDC" SortExpression="StoreQuotaTnDC" />
                        <asp:BoundField ItemStyle-Width="140px" DataField="StoreQuotaTotal" DataFormatString="{0:N2}" HeaderText="Total" SortExpression="StoreQuotaTotal" />
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
                <asp:GridView ID="ActivitiesGridView" HorizontalAlign="Center" CellPadding="10" OnRowDataBound="ActivitiesGridView_RowDataBound" DataSourceID="ActivitiesDataSource" runat="server" AutoGenerateColumns="False" ForeColor="#333333" OnRowCreated="ActivitiesGridView_RowCreated" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" Visible="false" />
                        <asp:BoundField ItemStyle-Width="140px" DataField="EmpName" HeaderText="Employee" SortExpression="EmpName" />
                        <asp:TemplateField HeaderText="Q | A" SortExpression="RepairsDone" ItemStyle-Width="140px">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# String.Format("{0} | {1}", Eval("RepairsQuota"), Eval("RepairsDone"))%>' />
                            </ItemTemplate>

                            <HeaderStyle Font-Underline="True" />
                            <ItemStyle Width="140px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Font-Underline="false" HeaderText="Q | A" SortExpression="AccessoriesDone" ItemStyle-Width="140px">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# String.Format("{0:N2} | {1:N2}", Eval("AccessoriesQuota"), Eval("AccessoriesDone"))%>' />

                            </ItemTemplate>
                            <HeaderStyle Font-Underline="False" />
                            <ItemStyle Width="140px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Q | A" SortExpression="PreownedDone" ItemStyle-Width="140px">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# String.Format("{0} | {1}", Eval("PreownedQuota"), Eval("PreownedDone"))%>' />
                            </ItemTemplate>
                            <ItemStyle Width="140px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Q | A" SortExpression="TnDDone" ItemStyle-Width="140px">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# String.Format("{0} | {1}", Eval("TnDQuota"), Eval("TnDDone"))%>' />
                            </ItemTemplate>
                            <ItemStyle Width="140px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Q | A" SortExpression="TnDCDone" ItemStyle-Width="140px">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# String.Format("{0} | {1}", Eval("TnDCQuota"), Eval("TnDCDone"))%>' />
                            </ItemTemplate>
                            <ItemStyle Width="140px" />
                        </asp:TemplateField>
                        <asp:BoundField ItemStyle-Width="140px" ItemStyle-BackColor="#5D7B9D" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Underline="false" Font-Size="Large" Height="20px" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:GridView ID="StoreSelfTrackerGridView" HorizontalAlign="Center" ShowHeader="False" runat="server" CellPadding="10" ForeColor="#333333" AutoGenerateColumns="False" DataSourceID="StoreSelfTrackerDataSource">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="StoreID" HeaderText="StoreID" SortExpression="StoreID" Visible="false" />
                        <asp:TemplateField ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="140px">
                            <ItemTemplate>
                                <asp:Label runat="server" Text="Store" Font-Bold="true" ForeColor="White" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StoreSelfRepairs" ItemStyle-Width="140px" HeaderText="StoreSelfRepairs" SortExpression="StoreSelfRepairs" />
                        <asp:BoundField DataField="StoreSelfAccessories" ItemStyle-Width="140px" HeaderText="StoreSelfAccessories" SortExpression="StoreSelfAccessories" />
                        <asp:BoundField DataField="StoreSelfPO" ItemStyle-Width="140px" HeaderText="StoreSelfPO" SortExpression="StoreSelfPO" />
                        <asp:BoundField DataField="StoreSelfTnD" ItemStyle-Width="140px" HeaderText="StoreSelfTnD" SortExpression="StoreSelfTnD" />
                        <asp:BoundField DataField="StoreSelfTnDC" ItemStyle-Width="140px" HeaderText="StoreSelfTnDC" SortExpression="StoreSelfTnDC" />
                        <asp:BoundField ItemStyle-Width="140px" ItemStyle-BackColor="#5D7B9D" />
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
                <asp:GridView ID="StoreTotalsGridView" ShowHeader="false" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" CellPadding="10" DataSourceID="StoreTotalsDataSource" ForeColor="#333333" GridLines="Both">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="140px">
                            <ItemTemplate>
                                <asp:Label runat="server" Text="Current" Font-Bold="true" ForeColor="White" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StoreID" HeaderText="" SortExpression="StoreID" Visible="false" />
                        <asp:BoundField DataField="StoreActualRepairs" ItemStyle-Width="140px" HeaderText="StoreActualRepairs" SortExpression="StoreActualRepairs" />
                        <asp:BoundField DataField="StoreActualAccessories" ItemStyle-Width="140px" HeaderText="StoreActualAccessories" SortExpression="StoreActualAccessories" />
                        <asp:BoundField DataField="StoreActualPO" ItemStyle-Width="140px" HeaderText="StoreActualPO" SortExpression="StoreActualPO" />
                        <asp:BoundField DataField="StoreActualTnD" ItemStyle-Width="140px" HeaderText="StoreActualTnD" SortExpression="StoreActualTnD" />
                        <asp:BoundField DataField="StoreActualTnDC" ItemStyle-Width="140px" HeaderText="StoreActualTnDC" SortExpression="StoreActualTnDC" />
                        <asp:BoundField DataField="StoreActualTotal" ItemStyle-Width="140px" HeaderText="StoreActualTotal" SortExpression="StoreActualTotal" />
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
            <asp:Panel ID="CommissionSelectionPanel" Height="124px" runat="server" Visible="false">
                <br />
                <div class="LeftColumnMenu">
                    <asp:Label runat="server" Text="Employee: " CssClass="DropdownLabel" Font-Bold="true" Font-Size="Large" />
                    <asp:DropDownList ID="AccessoryEmpSelectionDropdown" OnSelectedIndexChanged="AccessoryEmpSelectionDropdown_SelectedIndexChanged" AutoPostBack="true" CssClass="DropdownWithLabel" runat="server" AppendDataBoundItems="true" DataSourceID="EmployeeDataSource" DataValueField="EmpID" DataTextField="EmpName">
                        <asp:ListItem Value="0" Text="Select Employee" />
                    </asp:DropDownList>

                </div>
                <div class="RightColumnMenu">
                    <asp:Table runat="server" HorizontalAlign="Center" Width="50%" Height="60px">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" Font-Bold="true" Font-Size="Large">
                    Select Time Range
                            </asp:TableCell></asp:TableRow><asp:TableRow>
                            <asp:TableCell>
                                <asp:TextBox ID="TimeRangeStartText" runat="server" TextMode="Date" />
                            </asp:TableCell><asp:TableCell>
                                <asp:TextBox ID="TimeRangeEndText" runat="server" TextMode="Date" />
                            </asp:TableCell></asp:TableRow><asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="TimeRangeStartButton" runat="server" OnClick="TimeRangeStartButton_Click" Text="| <<" />
                            </asp:TableCell><asp:TableCell>
                                <asp:Button ID="TimeRangeEndButton" runat="server" OnClick="TimeRangeEndButton_Click" Text=">> |" />
                            </asp:TableCell></asp:TableRow></asp:Table></div></asp:Panel><br /><asp:Panel ID="CommissionAccessoryPanel" runat="server" Height="320px" Visible="false">
                <asp:GridView ID="CommissionEmployeeGridView" CssClass="LeftColumnTotalsBoardDiv" PageSize="8" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowCreated="CommissionEmployeeGridView_RowCreated" DataSourceID="ComissionDataSource" DataKeyNames="TrackerID" AllowPaging="True" OnSelectedIndexChanged="CommissionEmployeeGridView_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="TrackerID" HeaderText="TrackerID" SortExpression="TrackerID" ReadOnly="True" InsertVisible="False" Visible="false" />
                            <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" Visible="false" />
                            <asp:BoundField DataField="StoreID" HeaderText="StoreID" SortExpression="StoreID" Visible="false" />
                            <asp:BoundField DataField="AccName" HeaderText="Accessory" SortExpression="AccName" />
                            <asp:BoundField DataField="AccAmt" HeaderText="Amount" SortExpression="AccAmt" />
                            <asp:BoundField DataField="InvoiceID" HeaderText="Invoice #" SortExpression="InvoiceID" />
                            <asp:BoundField DataField="TimeSold" HeaderText="Time" SortExpression="TimeSold" />
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
                    <asp:DetailsView ID="SelectedAccessoryDetailView" CssClass="RightColumnTotalsBoardDiv" Height="200px" OnItemCommand="SelectedAccessoryDetailView_ItemCommand" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="TrackerID" DataSourceID="SelectedCustomerAccessoryListDataSource" ForeColor="#333333" GridLines="None">
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <EditRowStyle BackColor="#999999" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Width="30%" Font-Bold="True" />
                        <EmptyDataTemplate>
                            <asp:Button ID="InsertButton" BorderStyle="None" BorderWidth="0px" CssClass="GridViewClass" Text="New Pricing" runat="server" CommandName="New" />
                        </EmptyDataTemplate>
                        <Fields>
                            <asp:BoundField DataField="TrackerID" HeaderText="TrackerID" InsertVisible="False" ReadOnly="True" SortExpression="TrackerID" Visible="false" />
                            <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" Visible="false" />
                            <asp:BoundField DataField="StoreID" HeaderText="StoreID" SortExpression="StoreID" Visible="false" />
                            <asp:BoundField DataField="InvoiceID" HeaderText="Invoice #" SortExpression="InvoiceID" />
                            <asp:BoundField DataField="AccName" HeaderText="Accessory" SortExpression="AccName" />
                            <asp:BoundField DataField="AccAmt" HeaderText="Amount" SortExpression="AccAmt" />
                            <asp:TemplateField HeaderText="Date Sold" SortExpression="TimeSold">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TimeSoldText" CssClass="CenteredText" TextMode="Date" runat="server" Text='<%# Bind("TimeSold") %>' /></EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TimeSoldText" CssClass="CenteredText" TextMode="Date" runat="server" Text='<%# Bind("TimeSold") %>' />

                                </InsertItemTemplate><ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TimeSold") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button" />
                        </Fields>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:DetailsView>
            </asp:Panel>
            <asp:Panel ID="AdminPanel" runat="server">
            </asp:Panel>
            <asp:Table runat="server" CssClass="PageAction" ID="PageActionTable" CellPadding="20" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="PageSignOutButton" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Sign Out" />
                    </asp:TableCell><asp:TableCell>
                        <asp:Button ID="PageBackButton" CausesValidation="false" CssClass="TableFormButton" runat="server" Text="Back" />
                    </asp:TableCell></asp:TableRow></asp:Table><asp:SqlDataSource ID="ActivitiesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [ActivitiesTracker] WHERE (StoreID = @StoreID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="qcs" Name="StoreID" Type="Int32" DefaultValue="" PropertyName="StoreID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ComissionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [AccessoriesTracker] WHERE (EmpID = @SelectedEmpID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [AccessoriesTracker] WHERE [TrackerID] = @original_TrackerID AND (([EmpID] = @original_EmpID) OR ([EmpID] IS NULL AND @original_EmpID IS NULL)) AND (([AccName] = @original_AccName) OR ([AccName] IS NULL AND @original_AccName IS NULL)) AND (([AccAmt] = @original_AccAmt) OR ([AccAmt] IS NULL AND @original_AccAmt IS NULL))" InsertCommand="INSERT INTO [AccessoriesTracker] (EmpID, StoreID, InvoiceID, AccName, AccAmt, DateSold) VALUES (@EmpID, @StoreID, @InvoiceID, @AccName, @AccAmt, @DateSold)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [AccessoriesTracker] SET [EmpID] = @EmpID, [AccName] = @AccName, [AccAmt] = @AccAmt WHERE [TrackerID] = @original_TrackerID AND (([EmpID] = @original_EmpID) OR ([EmpID] IS NULL AND @original_EmpID IS NULL)) AND (([AccName] = @original_AccName) OR ([AccName] IS NULL AND @original_AccName IS NULL)) AND (([AccAmt] = @original_AccAmt) OR ([AccAmt] IS NULL AND @original_AccAmt IS NULL))">
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
                    <asp:ControlParameter ControlID="qcs" Name="EmpID" Type="Int32" PropertyName="SelectedEmpID" />
                    <asp:ControlParameter ControlID="qcs" Name="StoreID" Type="Decimal" PropertyName="StoreID" />
                    <asp:Parameter Name="InvoiceID" Type="Int32" />
                    <asp:Parameter Name="AccName" Type="String" />
                    <asp:Parameter Name="AccAmt" Type="Decimal" />
                    <asp:Parameter Name="DateSold" DbType="DateTime" />
                    
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
            <asp:SqlDataSource ID="StoreSelfTracker" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [StoreSelfTracker]" />
            <asp:SqlDataSource ID="StoreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [Store_Locations]" />
            <asp:SqlDataSource ID="StoreTotalsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [StoreTotalTracker] WHERE [StoreID] = @StoreID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="qcs" Name="StoreID" Type="Int32" DefaultValue="" PropertyName="StoreID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="EmployeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="EXEC GetAllEmpNames" />
            <asp:SqlDataSource ID="SelectedCustomerAccessoryListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [AccessoriesTracker] WHERE (EmpID = @SelectedEmpID) AND (StoreID = @StoreID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [AccessoriesTracker] WHERE [TrackerID] = @original_TrackerID AND (([EmpID] = @original_EmpID) OR ([EmpID] IS NULL AND @original_EmpID IS NULL)) AND (([StoreID] = @original_StoreID) OR ([StoreID] IS NULL AND @original_StoreID IS NULL)) AND [InvoiceID] = @original_InvoiceID AND (([AccName] = @original_AccName) OR ([AccName] IS NULL AND @original_AccName IS NULL)) AND (([AccAmt] = @original_AccAmt) OR ([AccAmt] IS NULL AND @original_AccAmt IS NULL)) AND (([TimeSold] = @original_TimeSold) OR ([TimeSold] IS NULL AND @original_TimeSold IS NULL))" InsertCommand="INSERT INTO [AccessoriesTracker] ([EmpID], [StoreID], [InvoiceID], [AccName], [AccAmt], [TimeSold]) VALUES (@EmpID, @StoreID, @InvoiceID, @AccName, @AccAmt, @TimeSold)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [AccessoriesTracker] SET [EmpID] = @EmpID, [StoreID] = @StoreID, [InvoiceID] = @InvoiceID, [AccName] = @AccName, [AccAmt] = @AccAmt, [TimeSold] = @TimeSold WHERE [TrackerID] = @original_TrackerID AND (([EmpID] = @original_EmpID) OR ([EmpID] IS NULL AND @original_EmpID IS NULL)) AND (([StoreID] = @original_StoreID) OR ([StoreID] IS NULL AND @original_StoreID IS NULL)) AND [InvoiceID] = @original_InvoiceID AND (([AccName] = @original_AccName) OR ([AccName] IS NULL AND @original_AccName IS NULL)) AND (([AccAmt] = @original_AccAmt) OR ([AccAmt] IS NULL AND @original_AccAmt IS NULL)) AND (([TimeSold] = @original_TimeSold) OR ([TimeSold] IS NULL AND @original_TimeSold IS NULL))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="qcs" Name="SelectedEmpID" Type="Int32" DefaultValue="" PropertyName="SelectedEmpID" />
                    <asp:ControlParameter ControlID="qcs" Name="StoreID" Type="Int32" DefaultValue="" PropertyName="StoreID" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_TrackerID" Type="Int32" />
                    <asp:Parameter Name="original_EmpID" Type="Int32" />
                    <asp:Parameter Name="original_StoreID" Type="Int32" />
                    <asp:Parameter Name="original_InvoiceID" Type="Int32" />
                    <asp:Parameter Name="original_AccName" Type="String" />
                    <asp:Parameter Name="original_AccAmt" Type="Decimal" />
                    <asp:Parameter DbType="DateTime" Name="original_DateSold" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmpID" Type="Int32" />
                    <asp:Parameter Name="StoreID" Type="Int32" />
                    <asp:Parameter Name="InvoiceID" Type="Int32" />
                    <asp:Parameter Name="AccName" Type="String" />
                    <asp:Parameter Name="AccAmt" Type="Decimal" />
                    <asp:Parameter DbType="DateTime" Name="DateSold" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EmpID" Type="Int32" />
                    <asp:Parameter Name="StoreID" Type="Int32" />
                    <asp:Parameter Name="InvoiceID" Type="Int32" />
                    <asp:Parameter Name="AccName" Type="String" />
                    <asp:Parameter Name="AccAmt" Type="Decimal" />
                    <asp:Parameter DbType="DateTime" Name="DateSold" />
                    <asp:Parameter Name="original_TrackerID" Type="Int32" />
                    <asp:Parameter Name="original_EmpID" Type="Int32" />
                    <asp:Parameter Name="original_StoreID" Type="Int32" />
                    <asp:Parameter Name="original_InvoiceID" Type="Int32" />
                    <asp:Parameter Name="original_AccName" Type="String" />
                    <asp:Parameter Name="original_AccAmt" Type="Decimal" />
                    <asp:Parameter DbType="DateTime" Name="original_DateSold" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="StoreSelfTrackerDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:QuoteDBConnection %>' SelectCommand="SELECT * FROM [StoreSelfTracker] WHERE ([StoreID] = @StoreID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="qcs" Name="StoreID" Type="Int32" DefaultValue="" PropertyName="StoreID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
