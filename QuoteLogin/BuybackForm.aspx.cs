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
    public partial class BuybackForm : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                if (PreviousPage is DefaultScreen ds)
                {
                    qcs.EmpID = ds.EmpID;
                    qcs.PermID = ds.PermID;
                }
                else if (PreviousPage is BuybackAdmin ba)
                {
                    qcs.EmpID = ba.EmpID;
                    qcs.PermID = ba.PermID;
                }
                if (qcs.PermID != 1)
                {
                    AdminPageButton.Visible = false;
                }
                for (int i = 0; i < PowerCheckl.Items.Count; i++)
                {
                    PowerCheckl.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
                for (int i = 0; i < ScuffCheckl.Items.Count; i++)
                {
                    ScuffCheckl.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
                for (int i = 0; i < LiquidCheckl.Items.Count; i++)
                {
                    LiquidCheckl.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
                for (int i = 0; i < FindCheckl.Items.Count; i++)
                {
                    FindCheckl.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
                for (int i = 0; i < GmailCheckl.Items.Count; i++)
                {
                    GmailCheckl.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
                for (int i = 0; i < CrackCheckl.Items.Count; i++)
                {
                    CrackCheckl.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
            }
        }

        protected void PrintButton_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "CallPrint", "PrintPanel()", true);
        }

        protected void CalcButton_Click(object sender, EventArgs e)
        {
            decimal BasePrice = Convert.ToDecimal(BaseText.Text);
            DataView view = (DataView)BuybackMarkdownDataSource.Select(DataSourceSelectArguments.Empty);
            foreach (ListItem item in CrackCheckl.Items)
            { 
                if (item.Selected)
                {
                    BasePrice -= BasePrice * (decimal)view.Table.Rows[0][item.Value];
                }
            }
            foreach (ListItem item in ScuffCheckl.Items)
            {
                if (item.Selected)
                {
                    BasePrice -= BasePrice * (decimal)view.Table.Rows[0][item.Value];
                }
            }
            foreach (ListItem item in LiquidCheckl.Items)
            {
                if (item.Selected)
                {
                    BasePrice -= BasePrice * (decimal)view.Table.Rows[0][item.Value];
                }
            }
            foreach (ListItem item in FindCheckl.Items)
            {
                if (item.Selected)
                {
                    BasePrice -= BasePrice * (decimal)view.Table.Rows[0][item.Value];
                }
            }
            foreach (ListItem item in GmailCheckl.Items)
            {
                if (item.Selected)
                {
                    BasePrice -= BasePrice * (decimal)view.Table.Rows[0][item.Value];
                }
            }
            foreach (ListItem item in PowerCheckl.Items)
            {
                if (item.Selected)
                {
                    BasePrice -= BasePrice * (decimal)view.Table.Rows[0][item.Value];
                }
            }

            BuybackText.Text = decimal.Round(BasePrice, 2).ToString();
        }

        protected void AdminPageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuybackAdmin.aspx");
        }

        protected void PresetDeviceDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (PresetDeviceDropdown.SelectedValue != "None")
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
                    MakeText.Text = table.Rows[0]["Make"].ToString();
                    ModelText.Text = table.Rows[0]["Model"].ToString();
                    DeviceTypeDropdown.SelectedValue = table.Rows[0]["DeviceType"].ToString();
                    BaseText.Text = ((decimal)table.Rows[0]["BasePrice"]).ToString("#.##");
                }
                    
            }
        }

        protected void DefaultScreenButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultScreen.aspx");
        }
    }
}