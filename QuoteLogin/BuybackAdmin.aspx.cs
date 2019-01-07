using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuoteLogin
{
    public partial class BuybackAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataView view = (DataView)BuybackMarkdownDataSource.Select(DataSourceSelectArguments.Empty);
                DataRow tblRow = view.Table.Rows[0];
                GmailNoText.Text = tblRow["GMailNotDeleted"].ToString();
                iPhoneNoText.Text = tblRow["iPhoneFindOn"].ToString();
                PowerNoText.Text = tblRow["NoPower"].ToString();
                ClearScuffText.Text = tblRow["ClearScuffs"].ToString();
                BarelyScuffText.Text = tblRow["BarelyScuffs"].ToString();
                LiquidYesText.Text = tblRow["LiquidDamage"].ToString();
                ScreenCrackYesText.Text = tblRow["ScreenCracks"].ToString();
            }
        }

        protected void BuybackPageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuybackForm.aspx");
        }

        protected void ChecklistEditButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BuybackMarkdownDataSource.Update();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            // Will edit the pre-made device which was selected or insert a new device into the table
            if (PresetDeviceDropdown.SelectedValue == "New")
            {
                PremadeDeviceDataSource.Insert();
            }
            else
            {
                PremadeDeviceDataSource.Update();
            }
        }

        protected void SubmitDeviceTypeButton_Click(object sender, EventArgs e)
        {
            if (EditDeviceTypeDropdown.SelectedValue == "New")
            {
                DeviceCategoryDataSource.Insert();
            }
            else
            {
                DeviceCategoryDataSource.Update();
            }
        }
    }
}