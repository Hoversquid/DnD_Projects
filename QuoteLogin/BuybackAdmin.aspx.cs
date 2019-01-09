using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Web.Security;

namespace QuoteLogin
{
    public partial class BuybackAdmin : System.Web.UI.Page
    {
        public int PermID
        {
            get { return qcs.PermID; }
        }
        public int EmpID
        {
            get { return qcs.EmpID; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if (!Page.IsPostBack)
            {
                if (PreviousPage is BuybackForm bf)
                {
                    qcs.EmpID = bf.EmpID;
                    qcs.PermID = bf.PermID;
                }
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
                ChecklistEditUpdateText.Text = "Markdown values have been updated.";
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
            Response.Redirect("BuybackAdminPageRedirect.aspx");
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
            Response.Redirect("BuybackAdminPageRedirect.aspx");
        }

        protected void PresetDeviceDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (PresetDeviceDropdown.SelectedValue != "New")
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["QuoteDBConnection"].ToString()))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [PremadeDevice] WHERE DeviceName = @Device", con);
                    cmd.Parameters.AddWithValue("@Device", PresetDeviceDropdown.SelectedValue);
                    DataTable table = new DataTable();
                    SqlDataAdapter sqlData = new SqlDataAdapter(cmd);
                    con.Open();
                    sqlData.Fill(table);
                    con.Close();
                    AdminNameText.Text = table.Rows[0]["DeviceName"].ToString();
                    AdminMakeText.Text = table.Rows[0]["Make"].ToString();
                    AdminModelText.Text = table.Rows[0]["Model"].ToString();
                    AdminDeviceTypeDropdown.SelectedValue = table.Rows[0]["DeviceType"].ToString();
                    AdminBasePriceText.Text = ((decimal)table.Rows[0]["BasePrice"]).ToString("#.##");
                }
            }
        }

        protected void EditDeviceTypeDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (EditDeviceTypeDropdown.SelectedValue != "New")
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["QuoteDBConnection"].ToString()))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [BuybackDeviceCategory] WHERE CatName = @DeviceType", con);
                    cmd.Parameters.AddWithValue("@DeviceType", EditDeviceTypeDropdown.SelectedValue);
                    DataTable table = new DataTable();
                    SqlDataAdapter sqlData = new SqlDataAdapter(cmd);
                    con.Open();
                    sqlData.Fill(table);
                    con.Close();
                    DeviceNameText.Text = table.Rows[0]["CatName"].ToString();
                }
            }
        }
    }
}