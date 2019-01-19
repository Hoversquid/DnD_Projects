using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuoteLogin
{
    public partial class CommissionPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ActivitiesGridView_RowCreated(object sender, GridViewRowEventArgs e)
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

                ComissionGridView.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        protected void ComissionGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(ComissionGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }
    }
}