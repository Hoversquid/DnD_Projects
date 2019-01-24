using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuoteLogin
{
    public partial class CommissionPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                qcs.StoreID = 0;

            }
        }

        protected void ActivitiesGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
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
            }
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
        }

        protected void AccessoriesBoardPanelButton_Click(object sender, EventArgs e)
        {
            QuotaBoardPanel.Visible = false;
            CommissionPanel.Visible = true;
            StoreTotalsPanel.Visible = false;
        }

        protected void StoreTotalsPanelButton_Click(object sender, EventArgs e)
        {
            QuotaBoardPanel.Visible = false;
            CommissionPanel.Visible = false;
            StoreTotalsPanel.Visible = true;
        }

        private void SetVisibility()
        {

        }

        protected void StoreTotalsGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
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

                HeaderCell = new TableCell();
                HeaderCell.Text = "Totals";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                StoreTotalsGridView.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(StoreTotalsGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void StoreSelectionGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(StoreSelectionGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this store.";
            }
        }

        protected void StoreSelectionGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            qcs.StoreID = (int)StoreSelectionGridView.SelectedValue;
        }
    }
}