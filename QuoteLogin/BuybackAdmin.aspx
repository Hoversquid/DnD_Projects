<%@ Page MasterPageFile="MasterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="BuybackAdmin.aspx.cs" Inherits="QuoteLogin.BuybackAdmin" %>

<%@ Register Assembly="QuoteLogin" Namespace="ControlLibrary.Controls" TagPrefix="cc1" %>


<asp:Content ID="BuybackAdmin" ContentPlaceHolderID="Main" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <cc1:QuoteControlState ID="qcs" runat='server' />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Panel ID="PresetDevicePanel" runat="server">
                <asp:Label Font-Bold="true" Font-Size="X-Large" runat="server">Edit Preset Devices</asp:Label>
                <asp:Table runat="server" CssClass="BBFormTable">
                    <asp:TableRow>
                        <asp:TableCell>
                        <asp:Label runat="server">Preset Device:</asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:DropDownList ID="PresetDeviceDropdown" AutoPostBack="true" runat="server" DataSourceID="PremadeDeviceDataSource" AppendDataBoundItems="true" DataTextField="DeviceName" DataValueField="DeviceName" OnSelectedIndexChanged="PresetDeviceDropdown_SelectedIndexChanged">
                                <asp:ListItem Value="New" Selected="True">New Device</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table runat="server" CssClass="BBFormTable">
                    <asp:TableRow>
                        <asp:TableCell>
                        <asp:Label runat="server">Name:</asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:Label runat="server">Base Price:</asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:Label runat="server">Device Type:</asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="AdminNameText" runat="server" />
                        </asp:TableCell><asp:TableCell>
                            <asp:RegularExpressionValidator ID="AdminBasePriceValid" ValidationGroup="PresetValidGroup" ControlToValidate="AdminBasePriceText" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" CssClass="SRRequiredError" ErrorMessage="*" runat="server" />
                            <asp:TextBox ID="AdminBasePriceText" runat="server" />
                        </asp:TableCell><asp:TableCell>
                            <asp:RequiredFieldValidator ID="DeviceTypeValid" ValidationGroup="PresetValidGroup" ControlToValidate="AdminDeviceTypeDropdown" InitialValue="0" CssClass="SRRequiredError" ErrorMessage="*" runat="server" />
                            <asp:DropDownList ID="AdminDeviceTypeDropdown" runat="server" AppendDataBoundItems="true" DataSourceID="DeviceCategoryDataSource" DataTextField="CatName" DataValueField="CatName">
                                <asp:ListItem Value="0">--</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell></asp:TableRow></asp:Table><asp:Table CssClass="BBFormTable" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server">Make:</asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label runat="server">Model:</asp:Label>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                                <asp:TableCell>
                                    <asp:TextBox ID="AdminMakeText" runat="server" />
                                </asp:TableCell><asp:TableCell>
                                    <asp:TextBox ID="AdminModelText" runat="server" />
                                </asp:TableCell></asp:TableRow></asp:Table><asp:Table CssClass="BBFormTable" runat="server" CellPadding="10">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="Submit" BackColor="Green" ForeColor="White" Font-Bold="true" runat="server" Text="Submit" OnClick="Submit_Click" ValidationGroup="PresetValidGroup" />
                        </asp:TableCell></asp:TableRow></asp:Table></asp:Panel><asp:SqlDataSource ID="PremadeDeviceDataSource" runat="server"
                SelectCommand="SELECT * FROM [PremadeDevice]"
                InsertCommand="INSERT INTO [PremadeDevice] (DeviceName, BasePrice, DeviceType, Make, Model) VALUES (@Name, @Base, @Type, @Make, @Model)"
                UpdateCommand="UPDATE [PremadeDevice] SET DeviceName = @Name, BasePrice = @Base, DeviceType = @Type, Make = @Make, Model = @Model WHERE DeviceName = @PresetName" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>">
                <InsertParameters>
                    <asp:ControlParameter Name="Name" ControlID="AdminNameText" PropertyName="Text" />
                    <asp:ControlParameter Name="Base" ControlID="AdminBasePriceText" PropertyName="Text" />
                    <asp:ControlParameter Name="Type" ControlID="AdminDeviceTypeDropdown" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="Make" ControlID="AdminMakeText" PropertyName="Text" />
                    <asp:ControlParameter Name="Model" ControlID="AdminModelText" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter Name="Name" ControlID="AdminNameText" PropertyName="Text" />
                    <asp:ControlParameter Name="Base" ControlID="AdminBasePriceText" PropertyName="Text" />
                    <asp:ControlParameter Name="Type" ControlID="AdminDeviceTypeDropdown" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="PresetName" ControlID="PresetDeviceDropdown" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="Make" ControlID="AdminMakeText" PropertyName="Text" />
                    <asp:ControlParameter Name="Model" ControlID="AdminModelText" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Panel ID="DeviceTypePanel" runat="server">
                <asp:Label runat="server" Font-Bold="true" Font-Size="X-Large">Edit Device Types</asp:Label><asp:Table runat="server" CssClass="BBFormTable">
                    <asp:TableRow>
                        <asp:TableCell>
                        <asp:Label runat="server">Device Type:</asp:Label>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            <asp:DropDownList ID="EditDeviceTypeDropdown" runat="server" AutoPostBack="true" DataSourceID="DeviceCategoryDataSource" AppendDataBoundItems="true" DataTextField="CatName" DataValueField="CatName" OnSelectedIndexChanged="EditDeviceTypeDropdown_SelectedIndexChanged">
                                <asp:ListItem Value="New" Selected="True">New Type</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell></asp:TableRow></asp:Table><asp:Table runat="server" CssClass="BBFormTable">
                    <asp:TableRow>
                        <asp:TableCell>
                        <asp:Label runat="server">Name:</asp:Label>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="DeviceNameValid" ControlToValidate="DeviceNameText" runat="server" ValidationGroup="DeviceTypeValidGroup" ErrorMessage="*" CssClass="SRRequiredError" />
                            <asp:TextBox ID="DeviceNameText" runat="server" />
                        </asp:TableCell></asp:TableRow></asp:Table><asp:Table CssClass="BBFormTable" runat="server" CellPadding="10">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="SubmitDeviceTypeButton" BackColor="Green" ForeColor="White" Font-Bold="true" runat="server" Text="Submit" OnClick="SubmitDeviceTypeButton_Click" ValidationGroup="DeviceTypeValidGroup" />
                        </asp:TableCell></asp:TableRow></asp:Table></asp:Panel><asp:SqlDataSource ID="DeviceCategoryDataSource" runat="server"
                SelectCommand="SELECT * FROM [BuybackDeviceCategory]"
                InsertCommand="INSERT INTO [BuybackDeviceCategory] (CatName) VALUES (@Name)"
                UpdateCommand="EXEC [UpdateDeviceTypes] @TypeName, @Name"
                ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>">
                <InsertParameters>
                    <asp:ControlParameter Name="Name" ControlID="DeviceNameText" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter Name="Name" ControlID="DeviceNameText" PropertyName="Text" />
                    <asp:ControlParameter Name="TypeName" ControlID="EditDeviceTypeDropdown" PropertyName="SelectedValue" />

                </UpdateParameters>

            </asp:SqlDataSource>
            <asp:Panel ID="ChecklistEditPanel" runat="server">
                <asp:Label runat="server" Font-Bold="true" Font-Size="X-Large">Checklist Edit</asp:Label><asp:Table ID="AndroidTable" CellPadding="10" runat="server" CssClass="BBChecklist">
                    <asp:TableRow>
                        <asp:TableCell CssClass="BBCell">
                                        Has Gmail been deleted?
                        </asp:TableCell><asp:TableCell CssClass="BBAdminCell">
                            <asp:Label runat="server">No</asp:Label>
                            <br />
                            <asp:RegularExpressionValidator ID="GmailNoValid" ControlToValidate="GmailNoText" runat="server" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" ErrorMessage="*" ValidationGroup="ChecklistValidGroup" CssClass="SRRequiredError" />
                            <asp:TextBox ID="GmailNoText" CssClass="ChecklistText" runat="server" />
                        </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="iPhoneTable" runat="server" CellPadding="10" CssClass="BBChecklist">
                    <asp:TableRow>
                        <asp:TableCell CssClass="BBCell">Has "Find my iPhone" been turned off?</asp:TableCell><asp:TableCell CssClass="BBAdminCell">
                            <asp:Label runat="server">No</asp:Label>
                            <br />
                            <asp:RegularExpressionValidator ID="iPhoneNoValid" ControlToValidate="iPhoneNoText" runat="server" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" ValidationGroup="ChecklistValidGroup" ErrorMessage="*" CssClass="SRRequiredError" />
                            <asp:TextBox ID="iPhoneNoText" CssClass="ChecklistText" runat="server" />
                        </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="BasicDeviceTable" runat="server" CellPadding="10" CssClass="BBChecklist">
                    <asp:TableRow>
                        <asp:TableCell CssClass="BBCell">Does the device power on?</asp:TableCell><asp:TableCell CssClass="BBAdminCell">
                            <asp:Label runat="server">No</asp:Label>
                            <br />
                            <asp:RegularExpressionValidator ID="PowerNoValid" ControlToValidate="PowerNoText" runat="server" ValidationGroup="ChecklistValidGroup" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" ErrorMessage="*" CssClass="SRRequiredError" />
                            <asp:TextBox ID="PowerNoText" CssClass="ChecklistText" runat="server" />
                        </asp:TableCell></asp:TableRow></asp:Table><asp:Table runat="server" CssClass="BBChecklist">
                    <asp:TableRow>
                        <asp:TableCell CssClass="BBCell">Does the device have nics or scuffs?</asp:TableCell><asp:TableCell CssClass="BBAdminCell">
                            <asp:Label runat="server">Clearly Visible</asp:Label>
                            <br />
                            <asp:RegularExpressionValidator ID="ClearScuffValid" ControlToValidate="ClearScuffText" ValidationGroup="ChecklistValidGroup" runat="server" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" ErrorMessage="*" CssClass="SRRequiredError" />
                            <asp:TextBox ID="ClearScuffText" CssClass="ChecklistText" runat="server" />
                        </asp:TableCell><asp:TableCell CssClass="BBAdminCell">
                            <asp:Label runat="server">Barely Visible</asp:Label>
                            <br />
                            <asp:RegularExpressionValidator ID="BarelyScuffValid" ControlToValidate="BarelyScuffText" ValidationGroup="ChecklistValidGroup" runat="server" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" ErrorMessage="*" CssClass="SRRequiredError" />
                            <asp:TextBox ID="BarelyScuffText" CssClass="ChecklistText" runat="server" />
                        </asp:TableCell></asp:TableRow></asp:Table><asp:Table runat="server" CssClass="BBChecklist">
                    <asp:TableRow>
                        <asp:TableCell CssClass="BBCell">Does the device have liquid damage?</asp:TableCell><asp:TableCell CssClass="BBAdminCell">
                            <asp:Label runat="server">Yes</asp:Label>
                            <br />
                            <asp:RegularExpressionValidator ID="LiquidYesValid" ControlToValidate="LiquidYesText" ValidationGroup="ChecklistValidGroup" runat="server" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" ErrorMessage="*" CssClass="SRRequiredError" />
                            <asp:TextBox ID="LiquidYesText" CssClass="ChecklistText" runat="server" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell CssClass="BBCell">Does the screen have cracks?</asp:TableCell><asp:TableCell CssClass="BBAdminCell">
                            <asp:Label runat="server">Yes</asp:Label>
                            <br />
                            <asp:RegularExpressionValidator ID="ScreenCrackYesValid" ControlToValidate="ScreenCrackYesText" ValidationGroup="ChecklistValidGroup" runat="server" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" ErrorMessage="*" CssClass="SRRequiredError" />
                            <asp:TextBox ID="ScreenCrackYesText" CssClass="ChecklistText" runat="server" />
                        </asp:TableCell></asp:TableRow></asp:Table><asp:Label ID="ChecklistEditUpdateText" runat="server" Font-Bold="true" ForeColor="Blue" Font-Size="X-Large" />
                <br />
                <asp:Button ID="ChecklistEditButton" CssClass="MarginedButton" runat="server" Text="Confirm Changes" BackColor="Green" ForeColor="White" Font-Bold="true" OnClick="ChecklistEditButton_Click" ValidationGroup="ChecklistValidGroup" />
                <br />
                <asp:Button ID="BuybackPageButton" CssClass="MarginedButton" runat="server" Text="Back to Buyback Page" BackColor="Blue" ForeColor="White" Font-Bold="true" OnClick="BuybackPageButton_Click" />
            </asp:Panel>
            <asp:SqlDataSource ID="BuybackMarkdownDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuoteDBConnection %>" SelectCommand="SELECT * FROM [BuybackChecklistMarkdown]"
                UpdateCommand="UPDATE [BuybackChecklistMarkdown] SET GmailNotDeleted = @Gmail, iPhoneFindOn = @iPhone, NoPower = @Power, ClearScuffs = @ClearScuffs, BarelyScuffs = @BarelyScuffs, LiquidDamage = @LiquidDamage, ScreenCracks = @ScreenCracks">
                <UpdateParameters>
                    <asp:ControlParameter Name="Gmail" ControlID="GmailNoText" PropertyName="Text" />
                    <asp:ControlParameter Name="iPhone" ControlID="iPhoneNoText" PropertyName="Text" />
                    <asp:ControlParameter Name="Power" ControlID="PowerNoText" PropertyName="Text" />
                    <asp:ControlParameter Name="ClearScuffs" ControlID="ClearScuffText" PropertyName="Text" />
                    <asp:ControlParameter Name="BarelyScuffs" ControlID="BarelyScuffText" PropertyName="Text" />
                    <asp:ControlParameter Name="LiquidDamage" ControlID="LiquidYesText" PropertyName="Text" />
                    <asp:ControlParameter Name="ScreenCracks" ControlID="ScreenCrackYesText" PropertyName="Text" />
                </UpdateParameters>

            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
