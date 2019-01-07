<%@ Page MasterPageFile="MasterPage.Master" Language="C#" AutoEventWireup="True" CodeBehind="BuybackForm.aspx.cs" Inherits="QuoteLogin.BuybackForm" Title="Buyback Form" %>

<%@ Register Assembly="QuoteLogin" Namespace="BuybackFormState.Controls" TagPrefix="cstate" %>

<asp:Content ID="BuybackForm" ContentPlaceHolderID="Main" runat="server">
    <script type="text/javascript">
        function MutExChkList(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            for (var i = 0; i < chks.length; i++) {
                if (chks[i] != chk && chk.checked) {
                    chks[i].checked = false;
                }
            }
        }
        function PrintPanel() {
            var printWindow = window.open('', '', 'height=800,width=1500');
            printWindow.document.write('<html><head><title>Buyback Form</title>');
            printWindow.document.write('<link rel="stylesheet" href="QuoteStyle.css" /></head><body style="background-color: #ffffff; max-width: 1000px; margin: auto;">');
            printWindow.document.write(document.getElementById('PrintDiv').innerHTML);
            printWindow.document.write(document.getElementById('BuybackDiv').innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.print();
            // hi
            return true;
        }
    </script>
    <cstate:BuybackFormState ID="bcs" runat='server' />
    <asp:ScriptManager ID="ScriptManager" runat="server" />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div id="PrintDiv">
                <asp:Label ID="BuybackLabel" runat="server" Font-Size="XX-Large" Font-Bold="True" CssClass="LabelHeader">Buyback Form</asp:Label>
                <asp:Panel ID="AdminPanel" runat="server" Visible="true">
                    <asp:Table runat="server" HorizontalAlign="Center" Style="margin-bottom: 0px">
                        <asp:TableRow>
                            <asp:TableCell Width="160px">Select preset device:</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="PresetDeviceDropdown" Width="180px" runat="server" DataSourceID="PresetDeviceDataSource" AppendDataBoundItems="true" AutoPostBack="true" DataTextField="DeviceName" DataValueField="DeviceName" OnSelectedIndexChanged="PresetDeviceDropdown_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Value="None">--</asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="AdminPageButton" runat="server" OnClick="AdminPageButton_Click" BackColor="Blue" ForeColor="White" Font-Bold="true" Text="Admin Controls" CausesValidation="false" /></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:SqlDataSource ID="PresetDeviceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [PremadeDevice]" />
                </asp:Panel>
                <asp:Table runat="server" CssClass="BBFormTable">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell Font-Bold="true" Scope="Column" Text="Device Information:" ColumnSpan="2">Device Information:</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Make:<br />
                            <asp:TextBox ID="MakeText" runat="server" CssClass="BBFormText" />
                        </asp:TableCell><asp:TableCell>
                            Model:<br />
                            <asp:TextBox ID="ModelText" runat="server" CssClass="BBFormText" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            Carrier:<br />
                            <asp:TextBox ID="CarrierText" runat="server" CssClass="BBFormText" />
                        </asp:TableCell><asp:TableCell>
                            Serial # / IMEI:<br />
                            <asp:TextBox ID="SerialText" runat="server" CssClass="BBFormText" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <br />
                            <asp:Label runat="server">Device Type:</asp:Label>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <asp:DropDownList ID="DeviceTypeDropdown" runat="server" AppendDataBoundItems="true" DataSourceID="DeviceTypeDataSource" DataTextField="CatName" DataValueField="CatName">
                                <asp:ListItem Selected="True" Value="0">--</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell></asp:TableRow></asp:Table><asp:SqlDataSource ID="DeviceTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [BuybackDeviceCategory]" />
                <asp:Panel ID="ChecklistPanel" runat="server" HorizontalAlign="Center">
                    <asp:Table ID="HandheldTable" CellPadding="5" runat="server" CssClass="BBChecklist">
                        <asp:TableRow>
                            <asp:TableCell CssClass="BBCell">
                                Does the screen have cracks?
                            </asp:TableCell><asp:TableCell CssClass="BBCheckCell">
                                <asp:CheckBoxList ID="CrackCheckl" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="ScreenCracks">Yes</asp:ListItem>
                                    <asp:ListItem Value="NoMarkdown">No</asp:ListItem>
                                </asp:CheckBoxList>
                            </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="AndroidTable" CellPadding="5" runat="server" CssClass="BBChecklist">
                        <asp:TableRow>
                            <asp:TableCell CssClass="BBCell">
                                        Has Gmail been deleted?
                            </asp:TableCell><asp:TableCell CssClass="BBCheckCell">
                                <asp:CheckBoxList ID="GmailCheckl" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="NoMarkdown">Yes</asp:ListItem>
                                    <asp:ListItem Value="GmailNotDeleted">No</asp:ListItem>
                                </asp:CheckBoxList>
                            </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="iPhoneTable" runat="server" CellPadding="5" CssClass="BBChecklist">
                        <asp:TableRow>
                            <asp:TableCell CssClass="BBCell">Has "Find my iPhone" been turned off?</asp:TableCell><asp:TableCell CssClass="BBCheckCell">
                                <asp:CheckBoxList ID="FindCheckl" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Value="iPhoneFindOn">Yes</asp:ListItem>
                                    <asp:ListItem Value="NoMarkdown">No</asp:ListItem>
                                </asp:CheckBoxList>
                            </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="BasicDeviceTable" runat="server" CellPadding="5" CssClass="BBChecklist">
                        <asp:TableRow>
                            <asp:TableCell CssClass="BBCell">Does the device power on?</asp:TableCell><asp:TableCell CssClass="BBCheckCell">
                                <asp:CheckBoxList ID="PowerCheckl" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Value="NoMarkdown" Text="">Yes</asp:ListItem>
                                    <asp:ListItem Value="NoPower" Text="">No</asp:ListItem>
                                </asp:CheckBoxList>
                            </asp:TableCell></asp:TableRow><asp:TableRow>
                            <asp:TableCell CssClass="BBCell">Does the device have nics or scuffs?</asp:TableCell><asp:TableCell CssClass="BBCheckCell">
                                <asp:CheckBoxList ID="ScuffCheckl" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Value="ClearScuffs">Clearly Visible</asp:ListItem>
                                    <asp:ListItem Value="BarelyScuffs">Barely Visible</asp:ListItem>
                                    <asp:ListItem Value="NoMarkdown">None</asp:ListItem>
                                </asp:CheckBoxList>
                            </asp:TableCell></asp:TableRow><asp:TableRow>
                            <asp:TableCell CssClass="BBCell">Does the device have liquid damage?</asp:TableCell><asp:TableCell CssClass="BBCheckCell">
                                <asp:CheckBoxList ID="LiquidCheckl" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Value="LiquidDamage" Text="">Yes</asp:ListItem>
                                    <asp:ListItem Value="NoMarkdown" Text="">No</asp:ListItem>
                                </asp:CheckBoxList>
                            </asp:TableCell></asp:TableRow></asp:Table></asp:Panel></div><asp:Table runat="server" CssClass="BBFormTable">
                <asp:TableRow>
                    <asp:TableCell>
                            <asp:Label runat="server">Base Amount:</asp:Label>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:RegularExpressionValidator ID="BaseValid" runat="server" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" ControlToValidate="BaseText" CssClass="SRRequiredError" ErrorMessage="*" />
                        <asp:TextBox runat="server" ID="BaseText" />

                    </asp:TableCell></asp:TableRow></asp:Table><asp:SqlDataSource ID="BuybackMarkdownDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>"
                SelectCommand="SELECT * FROM [BuybackChecklistMarkdown]" />
            <asp:Button runat="server" ID="CalcButton" OnClick="CalcButton_Click" Text="Calculate" />
            <div id="BuybackDiv">
                <asp:Table runat="server" CssClass="BBFormTable">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server">Buyback Amount:</asp:Label> 
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox runat="server" Enabled="false" ID="BuybackText" />
                        </asp:TableCell></asp:TableRow></asp:Table></div></ContentTemplate></asp:UpdatePanel><asp:Button runat="server" ID="PrintButton" Text="Print Page" OnClick="PrintButton_Click" />
</asp:Content>
