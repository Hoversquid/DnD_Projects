using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using Codaxy.WkHtmlToPdf;
using System.Diagnostics;
using System.Drawing.Imaging;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Security.Permissions;
using System.Windows.Forms;
using System.Threading.Tasks;

namespace QuoteLogin
{
    public partial class OpeningClosingProcedures : System.Web.UI.Page
    {
        public string ProcedureType
        {
            get { return qcs.ProcedureType; }
        }
        public int DepositID
        {
            get { return qcs.DepositID; }
        }
        public int StoreID
        {
            get { return qcs.StoreID; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                qcs.StoreID = 0;
                DateLabel.Text = DateTime.Now.ToString("d");
            }
        }
        private void SelectBankDepositByStore()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["QuoteDBConnection"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("GetMostRecentBankDeposit", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@StoreID", qcs.StoreID);
                DataTable table = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                con.Open();
                adapter.Fill(table);
                con.Close();
                if (table.Rows.Count > 0)
                {
                    qcs.DepositID = Convert.ToInt32(table.Rows[0]["DepositID"].ToString().Trim());
                    cmd = new SqlCommand("SELECT * FROM [Bank_Deposit] WHERE [DepositID] = @DepositID", con);
                    cmd.Parameters.AddWithValue("@DepositID", qcs.DepositID);
                    con.Open();
                    DataTable dataTable = new DataTable();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                    sqlDataAdapter.Fill(dataTable);
                    DataRow row = dataTable.Rows[0];
                    WriteDBToControlText(RepairsMon, row["RepairsMon"]);
                    WriteDBToControlText(RepairsTues, row["RepairsTues"]);
                    WriteDBToControlText(RepairsWed, row["RepairsWed"]);
                    WriteDBToControlText(RepairsThur, row["RepairsThur"]);
                    WriteDBToControlText(RepairsFri, row["RepairsFri"]);
                    WriteDBToControlText(RepairsSat, row["RepairsSat"]);
                    WriteDBToControlText(RepairsTotal, row["RepairsTotal"]);
                    WriteDBToControlText(AccessMon, row["AccessMon"]);
                    WriteDBToControlText(AccessTues, row["AccessTues"]);
                    WriteDBToControlText(AccessWed, row["AccessWed"]);
                    WriteDBToControlText(AccessThur, row["AccessThur"]);
                    WriteDBToControlText(AccessFri, row["AccessFri"]);
                    WriteDBToControlText(AccessSat, row["AccessSat"]);
                    WriteDBToControlText(AccessTotal, row["AccessTotal"]);
                    WriteDBToControlText(PreownMon, row["PreownMon"]);
                    WriteDBToControlText(PreownTues, row["PreownTues"]);
                    WriteDBToControlText(PreownWed, row["PreownWed"]);
                    WriteDBToControlText(PreownThur, row["PreownThur"]);
                    WriteDBToControlText(PreownFri, row["PreownFri"]);
                    WriteDBToControlText(PreownSat, row["PreownSat"]);
                    WriteDBToControlText(PreownTotal, row["PreownTotal"]);
                    WriteDBToControlText(CreditMon, row["CreditMon"]);
                    WriteDBToControlText(CreditTues, row["CreditTues"]);
                    WriteDBToControlText(CreditWed, row["CreditWed"]);
                    WriteDBToControlText(CreditThur, row["CreditThur"]);
                    WriteDBToControlText(CreditFri, row["CreditFri"]);
                    WriteDBToControlText(CreditSat, row["CreditSat"]);
                    WriteDBToControlText(CreditTotal, row["CreditTotal"]);
                    WriteDBToControlText(CashMon, row["CashMon"]);
                    WriteDBToControlText(CashTues, row["CashTues"]);
                    WriteDBToControlText(CashWed, row["CashWed"]);
                    WriteDBToControlText(CashThur, row["CashThur"]);
                    WriteDBToControlText(CashFri, row["CashFri"]);
                    WriteDBToControlText(CashSat, row["CashSat"]);
                    WriteDBToControlText(CashTotal, row["CashTotal"]);
                    WriteDBToControlText(AvgMon, row["AvgMon"]);
                    WriteDBToControlText(AvgTues, row["AvgTues"]);
                    WriteDBToControlText(AvgWed, row["AvgWed"]);
                    WriteDBToControlText(AvgThur, row["AvgThur"]);
                    WriteDBToControlText(AvgFri, row["AvgFri"]);
                    WriteDBToControlText(AvgSat, row["AvgSat"]);
                    WriteDBToControlText(AvgTotal, row["AvgTotal"]);
                    WriteDBToControlText(ReturnMon, row["ReturnMon"]);
                    WriteDBToControlText(ReturnTues, row["ReturnTues"]);
                    WriteDBToControlText(ReturnWed, row["ReturnWed"]);
                    WriteDBToControlText(ReturnThur, row["ReturnThur"]);
                    WriteDBToControlText(ReturnFri, row["ReturnFri"]);
                    WriteDBToControlText(ReturnSat, row["ReturnSat"]);
                    WriteDBToControlText(ReturnTotal, row["ReturnTotal"]);
                }
                else
                {
                    cmd = new SqlCommand("NewBankDeposit", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@StoreID", qcs.StoreID);
                    table = new DataTable();
                    adapter = new SqlDataAdapter(cmd);
                    con.Open();
                    adapter.Fill(table);
                    con.Close();
                    qcs.DepositID = Convert.ToInt32(table.Rows[0]["DepositID"].ToString().Trim());
                }
            }
        }
        private void WriteDBToControlText(WebControl ctrl, object entryValue)
        {
            string strVal;
            if (entryValue is DateTimeOffset dto)
            {
                strVal = dto.ToString("d");
            }
            else if (entryValue is decimal money)
            {
                strVal = String.Format("{0:N}", money);
            }
            else
            {
                strVal = entryValue.ToString().Trim();
            }
            if (ctrl is System.Web.UI.WebControls.TextBox tb)
            {
                tb.Text = strVal;
            }
            else if (ctrl is System.Web.UI.WebControls.Label lb)
            {
                lb.Text = strVal;
            }
            else if (ctrl is DropDownList ddl)
            {
                foreach (ListItem li in ddl.Items)
                {
                    if (li.Value == strVal)
                    {
                        ddl.SelectedValue = li.Value;
                        ddl.Enabled = false;
                    }
                }
            }
        }
        public static string RemoveWhitespace(string input)
        {
            return new string(input.ToCharArray()
                .Where(c => !Char.IsWhiteSpace(c))
                .ToArray());
        }
        private int GetNumberValue(string text)
        {
            String newTxt = text.Replace(" ", "");
            if (newTxt == String.Empty)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(newTxt);
            }

        }
        private double GetMoneyValue(string text)
        {
            String newTxt= text.Replace(" ", "");
            if (newTxt == String.Empty)
            {
                return 0;
            }
            else
            {
                return Convert.ToDouble(newTxt);
            }
        }

        protected void ProcedureTypeDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ProcedureTypeDropDown.SelectedValue == "Opening")
            {
                qcs.ProcedureType = "Opening";
                DateLabel.Text = "Opening Procedures - " + DateTime.Now.ToString("d");
                OpeningProcedurePanel.Visible = true;
                ClosingProcedurePanel.Visible = false;
                DepositPanel.Visible = false;
                OpenSubmitPanel();
            }
            else if (ProcedureTypeDropDown.SelectedValue == "Closing")
            {
                qcs.ProcedureType = "Closing";
                DateLabel.Text = "Closing Procedures - " + DateTime.Now.ToString("d");
                if (qcs.StoreID != 0)
                {
                    DepositPanel.Visible = true;
                }
                OpeningProcedurePanel.Visible = false;
                ClosingProcedurePanel.Visible = true;
                OpenSubmitPanel();
            }
            else
            {
                qcs.ProcedureType = "";
                DateLabel.Text = DateTime.Now.ToString("d");
                OpeningProcedurePanel.Visible = false;
                ClosingProcedurePanel.Visible = false;
                DepositPanel.Visible = false;
                SubmitPanel.Visible = false;
            }
        }

        protected void PrintButton_Click(object sender, EventArgs e)
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Print", "alert('You clicked YES!')", true);
        }

        private void SubmitToDB()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["QuoteDBConnection"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("UpdateBankDeposit", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@DepositID", qcs.DepositID);
                cmd.Parameters.AddWithValue("@RepairsMon", RepairsMon.Text.Trim());
                cmd.Parameters.AddWithValue("@RepairsTues", RepairsTues.Text.Trim());
                cmd.Parameters.AddWithValue("@RepairsWed", RepairsWed.Text.Trim());
                cmd.Parameters.AddWithValue("@RepairsThur", RepairsThur.Text.Trim());
                cmd.Parameters.AddWithValue("@RepairsFri", RepairsFri.Text.Trim());
                cmd.Parameters.AddWithValue("@RepairsSat", RepairsSat.Text.Trim());
                cmd.Parameters.AddWithValue("@RepairsTotal", RepairsTotal.Text.Trim());
                cmd.Parameters.AddWithValue("@AccessMon", AccessMon.Text.Trim());
                cmd.Parameters.AddWithValue("@AccessTues", AccessTues.Text.Trim());
                cmd.Parameters.AddWithValue("@AccessWed", AccessWed.Text.Trim());
                cmd.Parameters.AddWithValue("@AccessThur", AccessThur.Text.Trim());
                cmd.Parameters.AddWithValue("@AccessFri", AccessFri.Text.Trim());
                cmd.Parameters.AddWithValue("@AccessSat", AccessSat.Text.Trim());
                cmd.Parameters.AddWithValue("@AccessTotal", AccessTotal.Text.Trim());
                cmd.Parameters.AddWithValue("@PreownMon", PreownMon.Text.Trim());
                cmd.Parameters.AddWithValue("@PreownTues", PreownTues.Text.Trim());
                cmd.Parameters.AddWithValue("@PreownWed", PreownWed.Text.Trim());
                cmd.Parameters.AddWithValue("@PreownThur", PreownThur.Text.Trim());
                cmd.Parameters.AddWithValue("@PreownFri", PreownFri.Text.Trim());
                cmd.Parameters.AddWithValue("@PreownSat", PreownSat.Text.Trim());
                cmd.Parameters.AddWithValue("@PreownTotal", PreownTotal.Text.Trim());
                cmd.Parameters.AddWithValue("@CreditMon", CreditMon.Text.Trim());
                cmd.Parameters.AddWithValue("@CreditTues", CreditTues.Text.Trim());
                cmd.Parameters.AddWithValue("@CreditWed", CreditWed.Text.Trim());
                cmd.Parameters.AddWithValue("@CreditThur", CreditThur.Text.Trim());
                cmd.Parameters.AddWithValue("@CreditFri", CreditFri.Text.Trim());
                cmd.Parameters.AddWithValue("@CreditSat", CreditSat.Text.Trim());
                cmd.Parameters.AddWithValue("@CreditTotal", CreditTotal.Text.Trim());
                cmd.Parameters.AddWithValue("@CashMon", CashMon.Text.Trim());
                cmd.Parameters.AddWithValue("@CashTues", CashTues.Text.Trim());
                cmd.Parameters.AddWithValue("@CashWed", CashWed.Text.Trim());
                cmd.Parameters.AddWithValue("@CashThur", CashThur.Text.Trim());
                cmd.Parameters.AddWithValue("@CashFri", CashFri.Text.Trim());
                cmd.Parameters.AddWithValue("@CashSat", CashSat.Text.Trim());
                cmd.Parameters.AddWithValue("@CashTotal", CashTotal.Text.Trim());
                cmd.Parameters.AddWithValue("@AvgMon", AvgMon.Text.Trim());
                cmd.Parameters.AddWithValue("@AvgTues", AvgTues.Text.Trim());
                cmd.Parameters.AddWithValue("@AvgWed", AvgWed.Text.Trim());
                cmd.Parameters.AddWithValue("@AvgThur", AvgThur.Text.Trim());
                cmd.Parameters.AddWithValue("@AvgFri", AvgFri.Text.Trim());
                cmd.Parameters.AddWithValue("@AvgSat", AvgSat.Text.Trim());
                cmd.Parameters.AddWithValue("@AvgTotal", AvgTotal.Text.Trim());
                cmd.Parameters.AddWithValue("@ReturnMon", ReturnMon.Text.Trim());
                cmd.Parameters.AddWithValue("@ReturnTues", ReturnTues.Text.Trim());
                cmd.Parameters.AddWithValue("@ReturnWed", ReturnWed.Text.Trim());
                cmd.Parameters.AddWithValue("@ReturnThur", ReturnThur.Text.Trim());
                cmd.Parameters.AddWithValue("@ReturnFri", ReturnFri.Text.Trim());
                cmd.Parameters.AddWithValue("@ReturnSat", ReturnSat.Text.Trim());
                cmd.Parameters.AddWithValue("@ReturnTotal", ReturnTotal.Text.Trim());
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            };

        }
        protected void OpeningButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                EmailPanel.Visible = true;
                SelectionTable.Visible = false;
                CalcOpening();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "SubmitOpening", "PrintCanvas();", true);
                SubmitToDB();
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            Page.Validate("CashTableValidGroup");
            Page.Validate("DepositValid");
            if (Page.IsValid)
            {
                if (qcs.ProcedureType == "Opening")
                {
                    CalcOpening();
                    CalcDeposit();
                }
                else if (qcs.ProcedureType == "Closing")
                {
                    CalcClosing();
                    CalcDeposit();
                }
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "SubmitProcedures", "PrintCanvas();", true);


                /*
                System.Web.UI.WebControls.Image renderedImg = new System.Web.UI.WebControls.Image();
                renderedImg.ImageUrl = ImageString.Value;
                renderedImg.Visible = true;
                renderedImg.ID = "RenderedImg";
                ImagePlaceHolder.Controls.Add(renderedImg);
                */

                EmailPanel.Visible = true;
                SelectionTable.Visible = false;
                SubmitPanel.Visible = false;
                SubmitToDB();
            }
        }
        private MailMessage GetMailWithImg(System.Drawing.Image img, string type, string addressList)
        {
            var stream = new MemoryStream();
            img.Save(stream, ImageFormat.Jpeg);
            stream.Position = 0;

            MailMessage mail = new MailMessage
            {
                IsBodyHtml = true
            };
            mail.AlternateViews.Add(GetEmbeddedImage(stream));
            //mail.From = new MailAddress("xhenos76@gmail.com");
            mail.From = new MailAddress("hashtagautoemailer@gmail.com");
            //mail.From = new MailAddress("cbrooks@hashtagifixit.com");
            //mail.To.Add("xhenos76@gmail.com");
            //mail.To.Add("cbrooks@hashtagifixit.com");
            mail.To.Add(addressList);
            mail.Subject = DateTime.Today.DayOfWeek + ": " + type + " Procedure Checklist";
            mail.Priority = MailPriority.Normal;
            return mail;
        }
        private AlternateView GetEmbeddedImage(Stream stream)
        {
            LinkedResource res = new LinkedResource(stream)
            {
                ContentId = Guid.NewGuid().ToString()
            };
            string htmlBody = @"<img src='cid:" + res.ContentId + @"'/>";
            AlternateView alternateView = AlternateView.CreateAlternateViewFromString(htmlBody, null, MediaTypeNames.Text.Html);
            alternateView.LinkedResources.Add(res);
            return alternateView;
        }

        private void TrimAmountTextBoxes(Table tbl)
        {
            foreach (TableRow row in tbl.Rows)
            {
                foreach (TableCell cell in row.Cells)
                {
                    foreach (System.Web.UI.Control ctrl in cell.Controls)
                    {
                        if (ctrl is System.Web.UI.WebControls.TextBox)
                        {
                            System.Web.UI.WebControls.TextBox txt = (System.Web.UI.WebControls.TextBox)ctrl;
                            RemoveWhitespace(txt.Text);
                        }
                    }
                }
            }
        }

        private void SendWithStmpClient(MailMessage msg)
        {
            var MailClient = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,

                Credentials = new NetworkCredential(msg.From.Address, "mynzuamhjkiocmue")
                //Credentials = new NetworkCredential(msg.From.Address, "wcdupiqwyprfhwae")
                //Credentials = new NetworkCredential(msg.From.Address, "znynowvcqsvuhkug")
            };
            MailClient.Send(msg);
        }
        protected void EmailButton_Click(object sender, EventArgs e)
        {
            System.Drawing.Image attachedImg = Base64ToImage(ImageString.Value);
            if (qcs.ProcedureType == "Opening")
            {
                MailMessage mailWithImg = GetMailWithImg(attachedImg, "Opening", EmailPrimaryAddress.Text);
                SendWithStmpClient(mailWithImg);
            }
            else if (qcs.ProcedureType == "Closing")
            {
                MailMessage mailWithImg = GetMailWithImg(attachedImg, "Closing", EmailPrimaryAddress.Text);
                SendWithStmpClient(mailWithImg);
            }
            Response.Redirect("DefaultScreen.aspx");
        }

        // Summary: goes back to the procedures page that was selected
        protected void BackButton_Click(object sender, EventArgs e)
        {

            OpeningProcedurePanel.Visible = false;
            ClosingProcedurePanel.Visible = true;
            ProcedureTypeDropDown.Visible = true;
            SelectionTable.Visible = true;
        }

        protected void CalcClosingButton_Click(object sender, EventArgs e)
        {
            CalcClosing();
        }
        private void CalcClosing()
        {
            if (Page.IsValid)
            {
                TrimAmountTextBoxes(CashClosingTable1);
                TrimAmountTextBoxes(CashClosingTable2);

                PennyTotal2.Text = (GetMoneyValue(PennyAmt2.Text) * 0.01).ToString("F");
                NickelTotal2.Text = (GetMoneyValue(NickelAmt2.Text) * 0.05).ToString("F");
                DimeTotal2.Text = (GetMoneyValue(DimeAmt2.Text) * 0.10).ToString("F");
                QuarterTotal2.Text = (GetMoneyValue(QuarterAmt2.Text) * 0.25).ToString("F");
                HalfDollarTotal2.Text = (GetMoneyValue(HalfDollarAmt2.Text) * 0.50).ToString("F");
                PennyRollTotal2.Text = (GetMoneyValue(PennyRollAmt2.Text) * 0.50).ToString("F");
                NickelRollTotal2.Text = (GetMoneyValue(NickelRollAmt2.Text) * 2).ToString("F");
                DimeRollTotal2.Text = (GetMoneyValue(DimeRollAmt2.Text) * 5).ToString("F");
                QuarterRollTotal2.Text = (GetMoneyValue(QuarterRollAmt2.Text) * 10).ToString("F");
                DollarCoinsTotal2.Text = GetMoneyValue(DollarCoinsAmt2.Text).ToString("F");
                OneDollarTotal2.Text = GetMoneyValue(OneDollarAmt2.Text).ToString("F");
                TwoDollarTotal2.Text = (GetMoneyValue(TwoDollarAmt2.Text) * 2).ToString("F");
                FiveDollarTotal2.Text = (GetMoneyValue(FiveDollarAmt2.Text) * 5).ToString("F");
                TenDollarTotal2.Text = (GetMoneyValue(TenDollarAmt2.Text) * 10).ToString("F");
                TwentyDollarTotal2.Text = (GetMoneyValue(TwentyDollarAmt2.Text) * 20).ToString("F");
                FiftyDollarTotal2.Text = (GetMoneyValue(FiftyDollarAmt2.Text) * 50).ToString("F");
                HundredDollarTotal2.Text = (GetMoneyValue(HundredDollarAmt2.Text) * 100).ToString("F");
                CashCountTotal2.Text = (GetMoneyValue(PennyTotal2.Text) + GetMoneyValue(NickelTotal2.Text) + GetMoneyValue(DimeTotal2.Text) + GetMoneyValue(QuarterTotal2.Text) +
                                  GetMoneyValue(HalfDollarTotal2.Text) + GetMoneyValue(PennyRollTotal2.Text) + GetMoneyValue(NickelRollTotal2.Text) + GetMoneyValue(DimeRollTotal2.Text) +
                                  GetMoneyValue(QuarterRollTotal2.Text) + GetMoneyValue(DollarCoinsTotal2.Text) + GetMoneyValue(OneDollarTotal2.Text) + GetMoneyValue(TwoDollarTotal2.Text) +
                                  GetMoneyValue(FiveDollarTotal2.Text) + GetMoneyValue(TenDollarTotal2.Text) + GetMoneyValue(TwentyDollarTotal2.Text) + GetMoneyValue(FiftyDollarTotal2.Text) +
                                  GetMoneyValue(HundredDollarTotal2.Text)).ToString("F");
            }
        }

        protected void CalcOpeningButton_Click(object sender, EventArgs e)
        {
            CalcOpening();
        }
        private void CalcOpening()
        {
            if (Page.IsValid)
            {
                TrimAmountTextBoxes(CashOpeningTable1);
                TrimAmountTextBoxes(CashOpeningTable2);
                PennyTotal.Text = (GetMoneyValue(PennyAmt.Text) * 0.01).ToString("F");
                NickelTotal.Text = (GetMoneyValue(NickelAmt.Text) * 0.05).ToString("F");
                DimeTotal.Text = (GetMoneyValue(DimeAmt.Text) * 0.10).ToString("F");
                QuarterTotal.Text = (GetMoneyValue(QuarterAmt.Text) * 0.25).ToString("F");
                HalfDollarTotal.Text = (GetMoneyValue(HalfDollarAmt.Text) * 0.50).ToString("F");
                PennyRollTotal.Text = (GetMoneyValue(PennyRollAmt.Text) * 0.50).ToString("F");
                NickelRollTotal.Text = (GetMoneyValue(NickelRollAmt.Text) * 2).ToString("F");
                DimeRollTotal.Text = (GetMoneyValue(DimeRollAmt.Text) * 5).ToString("F");
                QuarterRollTotal.Text = (GetMoneyValue(QuarterRollAmt.Text) * 10).ToString("F");
                DollarCoinsTotal.Text = GetMoneyValue(DollarCoinsAmt.Text).ToString("F");
                OneDollarTotal.Text = GetMoneyValue(OneDollarAmt.Text).ToString("F");
                TwoDollarTotal.Text = (GetMoneyValue(TwoDollarAmt.Text) * 2).ToString("F");
                FiveDollarTotal.Text = (GetMoneyValue(FiveDollarAmt.Text) * 5).ToString("F");
                TenDollarTotal.Text = (GetMoneyValue(TenDollarAmt.Text) * 10).ToString("F");
                TwentyDollarTotal.Text = (GetMoneyValue(TwentyDollarAmt.Text) * 20).ToString("F");
                FiftyDollarTotal.Text = (GetMoneyValue(FiftyDollarAmt.Text) * 50).ToString("F");
                HundredDollarTotal.Text = (GetMoneyValue(HundredDollarAmt.Text) * 100).ToString("F");
                CashCountTotal.Text = (GetMoneyValue(PennyTotal.Text) + GetMoneyValue(NickelTotal.Text) + GetMoneyValue(DimeTotal.Text) + GetMoneyValue(QuarterTotal.Text) +
                                  GetMoneyValue(HalfDollarTotal.Text) + GetMoneyValue(PennyRollTotal.Text) + GetMoneyValue(NickelRollTotal.Text) + GetMoneyValue(DimeRollTotal.Text) +
                                  GetMoneyValue(QuarterRollTotal.Text) + GetMoneyValue(DollarCoinsTotal.Text) + GetMoneyValue(OneDollarTotal.Text) + GetMoneyValue(TwoDollarTotal.Text) +
                                  GetMoneyValue(FiveDollarTotal.Text) + GetMoneyValue(TenDollarTotal.Text) + GetMoneyValue(TwentyDollarTotal.Text) + GetMoneyValue(FiftyDollarTotal.Text) +
                                  GetMoneyValue(HundredDollarTotal.Text)).ToString("F");
            }
        }

        protected void CalcDepositButton_Click(object sender, EventArgs e)
        {
            CalcDeposit();
        }
        private void CalcDeposit()
        {
            if (Page.IsValid)
            {
                RepairsTotal.Text = (GetNumberValue(RepairsMon.Text) + GetNumberValue(RepairsTues.Text) + GetNumberValue(RepairsWed.Text) + GetNumberValue(RepairsThur.Text) + GetNumberValue(RepairsFri.Text) + GetNumberValue(RepairsSat.Text)).ToString();
                AccessTotal.Text = (GetMoneyValue(AccessMon.Text) + GetMoneyValue(AccessTues.Text) + GetMoneyValue(AccessWed.Text) + GetMoneyValue(AccessThur.Text) + GetMoneyValue(AccessFri.Text) + GetMoneyValue(AccessSat.Text)).ToString();
                PreownTotal.Text = (GetNumberValue(PreownMon.Text) + GetNumberValue(PreownTues.Text) + GetNumberValue(PreownWed.Text) + GetNumberValue(PreownThur.Text) + GetNumberValue(PreownFri.Text) + GetNumberValue(PreownSat.Text)).ToString("F");
                CreditTotal.Text = (GetMoneyValue(CreditMon.Text) + GetMoneyValue(CreditTues.Text) + GetMoneyValue(CreditWed.Text) + GetMoneyValue(CreditThur.Text) + GetMoneyValue(CreditFri.Text) + GetMoneyValue(CreditSat.Text)).ToString("F");
                CashTotal.Text = (GetMoneyValue(CashMon.Text) + GetMoneyValue(CashTues.Text) + GetMoneyValue(CashWed.Text) + GetMoneyValue(CashThur.Text) + GetMoneyValue(CashFri.Text) + GetMoneyValue(CashSat.Text)).ToString("F");
                AvgTotal.Text = (GetMoneyValue(AvgMon.Text) + GetMoneyValue(AvgTues.Text) + GetMoneyValue(AvgWed.Text) + GetMoneyValue(AvgThur.Text) + GetMoneyValue(AvgFri.Text) + GetMoneyValue(AvgSat.Text)).ToString("F");
                ReturnTotal.Text = (-(GetMoneyValue(ReturnMon.Text) + GetMoneyValue(ReturnTues.Text) + GetMoneyValue(ReturnWed.Text) + GetMoneyValue(ReturnThur.Text) + GetMoneyValue(ReturnFri.Text) + GetMoneyValue(ReturnSat.Text))).ToString("F");
            }
        }

        protected void SubmitBackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultScreen.aspx");
        }

        protected void PageBackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultScreen.aspx");
        }

        protected void OpeningChecklistValid_ServerValidate(object source, ServerValidateEventArgs args)
        {
            foreach (ListItem cb in OpeningChecklist.Items)
            {
                if (!cb.Selected)
                {
                    args.IsValid = false;
                    return;
                }
            }
        }

        protected void ClosingChecklistValid_ServerValidate(object source, ServerValidateEventArgs args)
        {
            foreach (ListItem cb in ClosingChecklist.Items)
            {
                if (!cb.Selected)
                {
                    args.IsValid = false;
                    return;
                }
            }
        }

        protected void OpeningPeopleValid_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (OpeningPerson1.Text == String.Empty || OpeningPerson2.Text == String.Empty)
            {
                args.IsValid = false;
            }
        }

        protected void ClosingStaffValid_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (ClosingPerson1.Text == String.Empty || ClosingPerson2.Text == String.Empty)
            {
                args.IsValid = false;
            }
        }

        protected void EmailAddCCButton_Click(object sender, EventArgs e)
        {
            TableRow tRow = new TableRow();
            TableCell tCell = new TableCell();
            tCell.Font.Size = FontUnit.Large;
            tCell.Text = "Add Address: ";
            System.Web.UI.WebControls.TextBox tBox = new System.Web.UI.WebControls.TextBox();
            tBox.CssClass = "AddedTextBox";
            tCell.Controls.Add(tBox);
            tRow.Cells.Add(tCell);
            EmailTable.Rows.Add(tRow);
        }

        private System.Drawing.Image Base64ToImage(string base64String)
        {
            base64String = base64String.Remove(0, 22);
            byte[] imageBytes = Convert.FromBase64String(base64String);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);
            System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
            return image;
        }

        protected void EmailBack_Click(object sender, EventArgs e)
        {
            SelectionTable.Visible = true;
            if (qcs.ProcedureType == "Opening")
            {
                OpeningProcedurePanel.Visible = true;
                ClosingProcedurePanel.Visible = false;
                DepositPanel.Visible = false;
                SubmitPanel.Visible = true;
            }
            else if (qcs.ProcedureType == "Closing")
            {
                OpeningProcedurePanel.Visible = false;
                ClosingProcedurePanel.Visible = true;
                DepositPanel.Visible = true;
                SubmitPanel.Visible = true;
            }
            else
            {
                Response.Redirect("DefaultScreen.aspx");
            }
            EmailPanel.Visible = false;
        }

        protected void StoreNameDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (StoreNameDropdown.SelectedValue == "--")
            {
                qcs.StoreID = 0;
                DepositPanel.Visible = false;
                SubmitPanel.Visible = false;
                StoreNameLabel.Text = String.Empty;
            }
            else
            {
                if (qcs.ProcedureType == "Closing")
                {
                    DepositPanel.Visible = true;
                }
                qcs.StoreID = Convert.ToInt32(StoreNameDropdown.SelectedValue);
                StoreNameLabel.Text = StoreNameDropdown.SelectedItem.Text;
                SelectBankDepositByStore();
                OpenSubmitPanel();
            }
        }

        private void OpenSubmitPanel()
        {
            if (qcs.ProcedureType == "Opening" || qcs.ProcedureType == "Closing")
            {
                if (qcs.StoreID > 0)
                {
                    SubmitPanel.Visible = true;
                }
            }
        }
    }
}
