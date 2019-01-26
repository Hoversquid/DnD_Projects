using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace QuoteLogin
{
    public partial class CommissionPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void ActivitiesGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            /*
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Repairs";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Accessories";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Preowned";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "TnD";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "TnDC";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                ActivitiesGridView.Controls[0].Controls.AddAt(0, HeaderGridRow);

                DataTable dt = new DataTable();
                GridViewRow totalsRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal);
            }
            */
        }

        protected void ActivitiesGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(ActivitiesGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void CommissionEmployeeGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(CommissionEmployeeGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this accessory entry.";
            }
        }

        protected void EmployeeSelectGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(EmployeeSelectGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void EmployeeSelectGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            qcs.SelectedEmpID = (int)EmployeeSelectGridView.SelectedValue;
            qcs.TrackerID = 0;
        }

        protected void CommissionEmployeeGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            qcs.TrackerID = (int)CommissionEmployeeGridView.SelectedValue;
        }

        protected void TimeRangeStartButton_Click(object sender, EventArgs e)
        {

        }

        protected void TimeRangeEndButton_Click(object sender, EventArgs e)
        {

        }

        protected void QuotaBoardPanelButton_Click(object sender, EventArgs e)
        {
            QuotaBoardPanel.Visible = true;
            CommissionPanel.Visible = false;
            StoreTotalsPanel.Visible = false;
            LabelPanel.Visible = true;
            BoardLabel.Text = "Quota Board -";
        }

        protected void AccessoriesBoardPanelButton_Click(object sender, EventArgs e)
        {
            QuotaBoardPanel.Visible = false;
            CommissionPanel.Visible = true;
            StoreTotalsPanel.Visible = false;
            LabelPanel.Visible = true;
            BoardLabel.Text = "Accessories Board -";
        }

        protected void StoreTotalsPanelButton_Click(object sender, EventArgs e)
        {
            QuotaBoardPanel.Visible = false;
            CommissionPanel.Visible = false;
            StoreTotalsPanel.Visible = true;
            LabelPanel.Visible = true;
            BoardLabel.Text = "Store Totals -";
        }

        private void SetVisibility()
        {

        }

        protected void StoreTotalsGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            /*
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "Repairs";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Accessories";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Preowned";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "TnD";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "TnDC";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                /*
                HeaderCell = new TableCell();
                HeaderCell.Text = "Totals";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                StoreTotalsGridView.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
            */
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(StoreQuotasGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void SelectedStoreDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            qcs.StoreID = Convert.ToInt32(SelectedStoreDropdown.SelectedValue);
            if (qcs.StoreID == 0)
            {
                ButtonMenuPanel.Visible = false;
                QuotaBoardPanel.Visible = false;
                StoreTotalsPanel.Visible = false;
                CommissionPanel.Visible = false;
                LabelPanel.Visible = false;
            }
            else
            {
                ButtonMenuPanel.Visible = true;
                StoreLabel.Text = SelectedStoreDropdown.SelectedItem.Text;
            }
        }
    }
}