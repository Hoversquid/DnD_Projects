using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuoteLogin
{
    public partial class ActivitiesTracker : System.Web.UI.Page
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
                HeaderCell.Text = "Department";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Employee";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                ActivitiesGridView.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        protected void ActivitiesGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}