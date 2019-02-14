<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CommissionPage.aspx.cs" Inherits="QuoteLogin.CommissionPage" %>

<%@ Register Assembly="QuoteLogin" Namespace="ControlLibrary.Controls" TagPrefix="cstate" %>

<head id="Head1" runat="server">
    <title>Master Page</title>
    <link rel="stylesheet" href="QuoteStyle.css" />
    <script src="html2canvas.js" type="text/javascript"></script>
</head>
<body style="background-color: #ffffff;">
    <cstate:QuoteControlState ID="QuoteControlState1" runat="server" />
    <script>
        var clicked = false;
        function PrintPanel() {
            var printVars = document.getElementsByClassName("PrintDiv");
            var printWindow = window.open('PrintWindow.html', 'PrintWindow', 'height=800,width=1000');
            //printWindow.document.head.innerHTML = '<link rel="stylesheet" type="text/css" href="~/QuoteStyle.css"/>';

            for (var i = 0; i < printVars.length; i++) {
                //var newPrintEle = printWindow.document.body.createElement("div");
                //newPrintEle.innerHTML = printVars[i].innerHTML;
                //printWindow.document.body.appendChild(newPrintEle);
                printWindow.document.body.innerHTML += printVars[i].innerHTML;
            }
            return true;

        }
        function CheckBrowser() {
            if (clicked == false) {
                //Browser closed   
            } else {
                //redirected
                clicked = false;
            }
        }
        function bodyUnload() {
            if (clicked == false)//browser is closed
            {
                var request = GetRequest();
                request.open("POST", "../LogOut.aspx", false);
                request.send();
            }
        }

        function GetRequest() {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            return xmlhttp;
        }

        function Validate() {
            var isValid = false;
            isValid = Page_ClientValidate('RegExValidation');
            return isValid;
        }
    </script>
    <form runat="server">
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
                                    <asp:Button ID="QuotaBoardPanelButton" CssClass="InputCell" CausesValidation="false" runat="server" Text="Totals Board" OnClick="QuotaBoardPanelButton_Click" />
                                </asp:TableCell><asp:TableCell>
                                    <asp:Button ID="AccessoriesBoardPanelButton" CssClass="InputCell" CausesValidation="false" runat="server" Text="Accessories Board" OnClick="AccessoriesBoardPanelButton_Click" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Button ID="AdminBoardPanelButton" CssClass="InputCell" CausesValidation="false" runat="server" Text="Talley/Quotas" OnClick="AdminBoardPanelButton_Click" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                </div>
                <br />
                <div>
                    <asp:Panel ID="LabelPanel" runat="server" HorizontalAlign="Center" Visible="false">
                        <asp:Table runat="server" CellPadding="2" CssClass="SelectionMenu" HorizontalAlign="Center">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="BoardLabel" Font-Bold="true" Font-Size="X-Large" runat="server" />
                                </asp:TableCell><asp:TableCell>
                                    <asp:Label ID="StoreLabel" Font-Bold="true" Font-Size="X-Large" runat="server" />
                                </asp:TableCell></asp:TableRow></asp:Table></asp:Panel><asp:Panel ID="QuotaBoardPanel" runat="server" Visible="false" CssClass="GridViewBoard">
                        <asp:GridView Width="88%" ID="StoreQuotasGridView" PageSize="1" HorizontalAlign="Center" CellPadding="10" runat="server" AutoGenerateColumns="False" OnRowCreated="StoreTotalsGridView_RowCreated" DataSourceID="StoreTotalsDataSource" ForeColor="#333333" DataKeyNames="StoreID">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="StoreID" HeaderText="StoreID" SortExpression="StoreID" InsertVisible="False" ReadOnly="True" Visible="false" ItemStyle-HorizontalAlign="Center" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text="Quota" Font-Bold="true" Font-Size="Large" ForeColor="White" />
                                    </ItemTemplate>
                                    <ItemStyle Width="14.28%" BackColor="#5D7B9D" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="14.28%" DataField="StoreQuotaRepairs" HeaderText="Repairs" SortExpression="StoreQuotaRepairs" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="14.28%" DataField="StoreQuotaAccessories" HeaderText="Accessories" SortExpression="StoreQuotaAccessories" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="14.28%" DataField="StoreQuotaPO" HeaderText="Preowned" SortExpression="StoreQuotaPO" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="14.28%" DataField="StoreQuotaTnD" HeaderText="TnD" SortExpression="StoreQuotaTnD" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="14.28%" DataField="StoreQuotaTnDC" HeaderText="TnDC" SortExpression="StoreQuotaTnDC" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="14.28%" DataField="StoreQuotaTotal" HeaderText="Totals" SortExpression="StoreQuotaTotal" />
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
                        <asp:GridView Width="88%" ID="ActivitiesGridView" HorizontalAlign="Center" CellPadding="10" OnRowDataBound="ActivitiesGridView_RowDataBound" DataSourceID="ActivitiesDataSource" runat="server" AutoGenerateColumns="False" ForeColor="#333333" OnRowCreated="ActivitiesGridView_RowCreated" AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="Employee" SortExpression="EmpName">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmpName") %>'></asp:Label></ItemTemplate><ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="14.28%" />
                                </asp:TemplateField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="RepairsQuota" HeaderText="Q" SortExpression="RepairsQuota" ItemStyle-Width="7.14%"></asp:BoundField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7.14%" DataField="RepairsDone" HeaderText="A" SortExpression="RepairsDone"></asp:BoundField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7.14%" DataField="AccessoriesQuota" HeaderText="Q" SortExpression="AccessoriesQuota"></asp:BoundField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7.14%" DataField="AccessoriesDone" HeaderText="A" SortExpression="AccessoriesDone"></asp:BoundField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7.14%" DataField="PreownedQuota" HeaderText="Q" SortExpression="PreownedQuota"></asp:BoundField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7.14%" DataField="PreownedDone" HeaderText="A" SortExpression="PreownedDone"></asp:BoundField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7.14%" DataField="TnDQuota" HeaderText="Q" SortExpression="TnDQuota"></asp:BoundField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7.14%" DataField="TnDDone" HeaderText="A" SortExpression="TnDDone"></asp:BoundField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7.14%" DataField="TnDCQuota" HeaderText="Q" SortExpression="TnDCQuota"></asp:BoundField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7.14%" DataField="TnDCDone" HeaderText="A" SortExpression="TnDCDone"></asp:BoundField>
                                <asp:BoundField ItemStyle-Width="14.28%" ItemStyle-BackColor="#5D7B9D" />
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
                        <asp:GridView ID="StoreSelfTrackerGridView" Width="88%" PageSize="1" HorizontalAlign="Center" ShowHeader="False" runat="server" CellPadding="10" ForeColor="#333333" AutoGenerateColumns="False" DataSourceID="StoreSelfTrackerDataSource">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="StoreID" HeaderText="StoreID" SortExpression="StoreID" Visible="false" />
                                <asp:TemplateField ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="14.28%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text="Store" Font-Bold="true" Font-Size="Large" ForeColor="White" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="7.14%" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreSelfRepairs" ItemStyle-Width="7.14%" HeaderText="StoreSelfRepairs" SortExpression="StoreSelfRepairs" />
                                <asp:BoundField ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="7.14%" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreSelfAccessories" ItemStyle-Width="7.14%" HeaderText="StoreSelfAccessories" SortExpression="StoreSelfAccessories" />
                                <asp:BoundField ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="7.14%" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreSelfPO" ItemStyle-Width="7.14%" HeaderText="StoreSelfPO" SortExpression="StoreSelfPO" />
                                <asp:BoundField ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="7.14%" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreSelfTnD" ItemStyle-Width="7.14%" HeaderText="StoreSelfTnD" SortExpression="StoreSelfTnD" />
                                <asp:BoundField ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="7.14%" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreSelfTnDC" ItemStyle-Width="7.14%" HeaderText="StoreSelfTnDC" SortExpression="StoreSelfTnDC" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="14.28%" ItemStyle-BackColor="#5D7B9D" />
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
                        <asp:GridView ID="StoreTotalsGridView" Width="88%" ShowHeader="False" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" CellPadding="10" DataSourceID="StoreTotalsDataSource" ForeColor="#333333" DataKeyNames="StoreID">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="14.28%">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ForeColor="White" Font-Bold="true" Font-Size="Large" Text="Current" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreID" HeaderText="StoreID" SortExpression="StoreID" InsertVisible="False" ReadOnly="True" Visible="false" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreQuotaRepairs" ItemStyle-Width="14.28%" HeaderText="StoreQuotaRepairs" SortExpression="StoreQuotaRepairs" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreQuotaAccessories" ItemStyle-Width="14.28%" HeaderText="StoreQuotaAccessories" SortExpression="StoreQuotaAccessories" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreQuotaPO" ItemStyle-Width="14.28%" HeaderText="StoreQuotaPO" SortExpression="StoreQuotaPO" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreQuotaTnD" ItemStyle-Width="14.28%" HeaderText="StoreQuotaTnD" SortExpression="StoreQuotaTnD" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreQuotaTnDC" ItemStyle-Width="14.28%" HeaderText="StoreQuotaTnDC" SortExpression="StoreQuotaTnDC" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreQuotaTotal" ItemStyle-Width="14.28%" HeaderText="StoreQuotaTotal" SortExpression="StoreQuotaTotal" />
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
                        <asp:GridView ID="StoreTotalRemainingGrid" runat="server" Width="88%" ShowHeader="False" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="10" DataSourceID="StoreTotalsDataSource" ForeColor="#333333" DataKeyNames="StoreID">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="#5D7B9D" ItemStyle-Width="14.28%">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ForeColor="White" Font-Bold="true" Font-Size="Large" Text="Remaining" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreRemainingRepairs" ItemStyle-Width="14.28%" HeaderText="StoreRemainingRepairs" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreRemainingAccessories" ItemStyle-Width="14.28%" HeaderText="StoreRemainingAccessories" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreRemainingPO" ItemStyle-Width="14.28%" HeaderText="StoreRemainingPO" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreRemainingTnD" ItemStyle-Width="14.28%" HeaderText="StoreRemainingTnD" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreRemainingTnDC" ItemStyle-Width="14.28%" HeaderText="StoreRemainingTnDC" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="StoreRemainingTotal" ItemStyle-Width="14.28%" HeaderText="StoreRemainingTotal" SortExpression="StoreRemainingTotal" />
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
                        <asp:SqlDataSource ID="StoreTotalRemainingDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT [StoreRemainingTotal] FROM [StoreTotalTracker]"></asp:SqlDataSource>
                    </asp:Panel>
                    <asp:Panel ID="CommissionAccessoryPanel" runat="server" Height="450px" Visible="false">
                        <br />
                        <div class="LeftColumnMenu">
                            <asp:Table Height="80px" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Employee: " CssClass="DropdownLabel" Font-Bold="true" Font-Size="Large" />
                                        <asp:DropDownList ID="AccessoryEmpSelectionDropdown" OnSelectedIndexChanged="AccessoryEmpSelectionDropdown_SelectedIndexChanged" AutoPostBack="true" CssClass="DropdownWithLabel" runat="server" AppendDataBoundItems="true" DataSourceID="EmployeeDataSource" DataValueField="EmpID" DataTextField="EmpName">
                                            <asp:ListItem Value="0" Selected="True" Text="Select Employee" />
                                        </asp:DropDownList>
                                    </asp:TableCell></asp:TableRow><asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Button ID="EmpAccessoryAddButton" CssClass="TableFormButton" runat="server" OnClick="EmpAccessoryAddButton_Click" Text="Add Accessory" />
                                    </asp:TableCell></asp:TableRow></asp:Table></div><div class="RightColumnMenu">
                            <asp:Table CssClass="SelectionMenuTable" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Center">
                                    <asp:Label Text="Select Invoice" Font-Bold="true" Font-Size="Large" runat="server" />
                                    </asp:TableCell><asp:TableCell>
                                    
                                    </asp:TableCell><asp:TableCell ColumnSpan="2" Font-Bold="true" Font-Size="Large" HorizontalAlign="Center">
                        Select Time Range
                                    </asp:TableCell></asp:TableRow><asp:TableRow>
                                    <asp:TableCell>
                                        <asp:TextBox ID="InvoiceIDText" runat="server" />
                                    </asp:TableCell><asp:TableCell Width="100px" /><asp:TableCell>
                                        <asp:TextBox ID="TimeRangeStartText" runat="server" TextMode="Date" />
                                    </asp:TableCell><asp:TableCell>
                                        <asp:TextBox ID="TimeRangeEndText" runat="server" TextMode="Date" />
                                    </asp:TableCell></asp:TableRow><asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Button ID="SelectInvoiceButton" OnClick="SelectInvoiceButton_Click" runat="server" Text="Select" />
                                    </asp:TableCell><asp:TableCell />
                                    <asp:TableCell>
                                        <asp:Button ID="TimeRangeStartButton" runat="server" OnClick="TimeRangeStartButton_Click" Text="| <<" />
                                    </asp:TableCell><asp:TableCell>
                                        <asp:Button ID="TimeRangeEndButton" runat="server" OnClick="TimeRangeEndButton_Click" Text=">> |" />
                                    </asp:TableCell></asp:TableRow></asp:Table></div><br /><div style="width: 100%">
                            <asp:GridView ID="CommissionEmployeeGridView" CssClass="LeftColumnTotalsBoardDiv" PageSize="8" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowCreated="CommissionEmployeeGridView_RowCreated" DataSourceID="ComissionDataSource" DataKeyNames="TrackerID" OnSelectedIndexChanged="CommissionEmployeeGridView_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="DateSold" HeaderText="DateSold" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="24%" DataFormatString="{0:dd-M-yyyy}" SortExpression="DateSold" />

                                    <asp:BoundField DataField="AccName" ItemStyle-Width="40%" HeaderText="AccName" ItemStyle-HorizontalAlign="Center" SortExpression="AccName" />
                                    <asp:BoundField DataField="AccAmt" ItemStyle-Width="24%" HeaderText="AccAmt" ItemStyle-HorizontalAlign="Center" SortExpression="AccAmt" />
                                    <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" SortExpression="InvoiceID" HeaderStyle-HorizontalAlign="Left" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label runat="server" Text="Select Employee" />
                                </EmptyDataTemplate>
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
                            <div class="RightColumnTotalsBoardDiv">
                                <asp:DetailsView ID="SelectedAccessoryDetailView" Width="100%" Height="200px" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="TrackerID" DataSourceID="SelectedEmpAccessoryListDataSource" ForeColor="#333333" GridLines="None">
                                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FieldHeaderStyle BackColor="#E9ECF1" Width="30%" Font-Bold="True" />
                                    <Fields>
                                        <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" SortExpression="InvoiceID" />
                                        <asp:BoundField DataField="AccName" HeaderText="AccName" SortExpression="AccName" />
                                        <asp:BoundField DataField="AccAmt" HeaderText="AccAmt" SortExpression="AccAmt" />
                                        <asp:BoundField DataField="DateSold" HeaderText="DateSold" SortExpression="DateSold" />
                                    </Fields>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                </asp:DetailsView>
                            </div>
                    </asp:Panel>
                    <asp:Panel ID="AdminPanel" runat="server" Visible="false" Height="450px">
                        <div class="LeftAdminColumnMenu">
                            <asp:Table CellPadding="0" runat="server" CssClass="MenuCellTable">
                                <asp:TableRow>
                                    <asp:TableCell Width="18%">
                                        <asp:Label runat="server" Text="Admin: " CssClass="DropdownLabel" Font-Bold="true" Font-Size="Large" />
                                    </asp:TableCell><asp:TableCell Width="30%">
                                        <asp:Button ID="EmployeeQuotasButton" OnClick="EmployeeQuotasButton_Click" CssClass="TableFormButton" runat="server" Text="Employee Quotas" />
                                    </asp:TableCell></asp:TableRow><asp:TableRow>
                                    <asp:TableCell />
                                    <asp:TableCell>
                                        <asp:Button ID="SetStoreQuotasButton" CssClass="TableFormButton" runat="server" Text="Store Quotas" OnClick="SetStoreQuotasButton_Click" />
                                    </asp:TableCell></asp:TableRow><asp:TableRow>
                                </asp:TableRow>
                            </asp:Table>
                            <asp:Table CssClass="MenuCellTable" CellPadding="0" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell Width="18%">
                                        <asp:Label runat="server" Text="Employee: " CssClass="DropdownLabel" Font-Bold="true" Font-Size="Large" />
                                    </asp:TableCell><asp:TableCell Width="30%">
                                        <asp:Button ID="EmployeeNumbersButton" CssClass="TableFormButton" runat="server" OnClick="EmployeeNumbersButton_Click" Text="Set Numbers" />
                                    </asp:TableCell></asp:TableRow><asp:TableRow>
                                    <asp:TableCell />
                                    <asp:TableCell>
                                        <asp:Button ID="EmployeeTotalsButton" CssClass="TableFormButton" runat="server" Text="Employee Totals" OnClick="EmployeeTotalsButton_Click"/>
                                    </asp:TableCell></asp:TableRow><asp:TableRow>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                        <div class="RightAdminColumnMenu">
                            <asp:Table CssClass="PagingMenu" Width="100%" runat="server" GridLines="Both">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Left" Width="50%">
                                        <asp:DropDownList Width="94%" ID="AdminEmpSelectDropdown" OnSelectedIndexChanged="AdminEmpSelectDropdown_SelectedIndexChanged" AutoPostBack="true" CssClass="EmpSelectDropdown" runat="server" AppendDataBoundItems="true" DataSourceID="EmployeeDataSource" DataValueField="EmpID" DataTextField="EmpName">
                                            <asp:ListItem Value="0" Selected="True" Text="Select Employee" />
                                        </asp:DropDownList>
                                    </asp:TableCell><asp:TableCell><asp:Checkbox ID="SetEmpActiveCheckbox" OnCheckedChanged="SetEmpActiveCheckbox_CheckedChanged" runat="server" Font-Size="Smaller" Text="- Active at Store" /></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <asp:DetailsView ID="DetailsView1" CssClass="SelectionDetailView" HorizontalAlign="Center" runat="server" Width="100%" AutoGenerateRows="False" CellPadding="4" DataSourceID="StoreTotalsDataSource" ForeColor="#333333" GridLines="None" DataKeyNames="StoreID">
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Width="30%" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="StoreQuotaRepairs" HeaderText="Repairs" SortExpression="StoreQuotaRepairs" />
                                <asp:BoundField DataField="StoreQuotaAccessories" HeaderText="Accessories" SortExpression="StoreQuotaAccessories" />
                                <asp:BoundField DataField="StoreQuotaPO" HeaderText="Preowned" SortExpression="StoreQuotaPO" />
                                <asp:BoundField DataField="StoreQuotaTnD" HeaderText="T n D" SortExpression="StoreQuotaTnD" />
                                <asp:BoundField DataField="StoreQuotaTnDC" HeaderText="T n D Complete" SortExpression="StoreQuotaTnDC" />
                                <asp:BoundField DataField="StoreQuotaTotal" HeaderText="Total" SortExpression="StoreQuotaTotal" />
                            </Fields>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:DetailsView>

                        </div>
                    </asp:Panel>
                </div>
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
                <asp:SqlDataSource ID="ComissionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [AccessoriesTracker] WHERE (EmpID = @SelectedEmpID) AND (StoreID = @StoreID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="qcs" Name="SelectedEmpID" PropertyName="SelectedEmpID" />
                        <asp:ControlParameter ControlID="qcs" Name="StoreID" PropertyName="StoreID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="StoreSelfTracker" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [StoreSelfTracker]" />
                <asp:SqlDataSource ID="StoreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [Store_Locations]" />
                <asp:SqlDataSource ID="StoreTotalsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [StoreTotalTracker] WHERE (StoreID = @StoreID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="qcs" Name="StoreID" Type="Int32" DefaultValue="" PropertyName="StoreID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="EmployeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="EXEC GetAllEmpNames" />
                <asp:SqlDataSource ID="SelectedEmpAccessoryListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [AccessoriesTracker] WHERE (TrackerID = @TrackerID)" DeleteCommand="DELETE FROM [AccessoriesTracker] WHERE [TrackerID] = @TrackerID" InsertCommand="INSERT INTO [AccessoriesTracker] ([EmpID], [StoreID], [InvoiceID], [AccName], [AccAmt], [DateSold]) VALUES (@EmpID, @StoreID, @InvoiceID, @AccName, @AccAmt, @DateSold)" UpdateCommand="UPDATE [AccessoriesTracker] SET [EmpID] = @EmpID, [StoreID] = @StoreID, [InvoiceID] = @InvoiceID, [AccName] = @AccName, [AccAmt] = @AccAmt, [DateSold] = @DateSold WHERE [TrackerID] = @TrackerID">
                    <DeleteParameters>
                        <asp:Parameter Name="TrackerID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmpID" Type="Int32" />
                        <asp:Parameter Name="StoreID" Type="Int32" />
                        <asp:Parameter Name="InvoiceID" Type="Int32" />
                        <asp:Parameter Name="AccName" Type="String" />
                        <asp:Parameter Name="AccAmt" Type="Decimal" />
                        <asp:Parameter Name="DateSold" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="qcs" Name="TrackerID" PropertyName="TrackerID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EmpID" Type="Int32" />
                        <asp:Parameter Name="StoreID" Type="Int32" />
                        <asp:Parameter Name="InvoiceID" Type="Int32" />
                        <asp:Parameter Name="AccName" Type="String" />
                        <asp:Parameter Name="AccAmt" Type="Decimal" />
                        <asp:Parameter Name="DateSold" Type="DateTime" />
                        <asp:Parameter Name="TrackerID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="StoreSelfTrackerDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:QuoteDBConnection %>' SelectCommand="SELECT * FROM [StoreSelfTracker] WHERE ([StoreID] = @StoreID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="qcs" Name="StoreID" Type="Int32" DefaultValue="" PropertyName="StoreID" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="qcs" Name="SelectedEmpID" Type="Int32" DefaultValue="" PropertyName="SelectedEmpID" />
                        <asp:ControlParameter ControlID="qcs" Name="StoreID" Type="Int32" DefaultValue="" PropertyName="StoreID" />

                    </InsertParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
