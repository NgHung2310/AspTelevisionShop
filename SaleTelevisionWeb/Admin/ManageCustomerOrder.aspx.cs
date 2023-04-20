using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Admin
{
    public partial class ManageCustomerCart : System.Web.UI.Page
    {
        DbContext db = new DbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            UserAccount user = (UserAccount)HttpContext.Current.Session["CurrentUser"];
            if (user == null)
            {
                Response.Redirect("~/Common/Login.aspx");
                return;
            }
            if (user.Role != "admin")
            {
                Response.Redirect("~/Common/Login.aspx");
                return;
            }
            InitPage();
            if (!Page.IsPostBack)
            {
                LoadGv();
            }
        }

        void InitPage()
        {
            if (header.FindControl("lbContentTitle") != null)
            {
                Label lbContentTitle = (Label)header.FindControl("lbContentTitle");
                lbContentTitle.Text = title.Text;
            }
            gv.RowEditing += Gv_RowEditing;
            gv.RowCancelingEdit += Gv_RowCancelingEdit;
            gv.RowUpdating += Gv_RowUpdating;
            gv.RowDeleting += Gv_RowDeleting;
            gv.RowDataBound += Gv_RowDataBound;
            gv.PageIndexChanging += Gv_PageIndexChanging;
            lbtnSearch.Click += LbtnSearch_Click;
        }

        private void LbtnSearch_Click(object sender, EventArgs e)
        {
            string sql = $@"
select CustomerCart.Id, UserAccount.Username as Customer, Television.Title as Television, CustomerCart.Quantity, CustomerCart.Time, CustomerCart.Total, CustomerCart.State
from CustomerCart, Television, UserAccount
where CustomerCart.CustomerId=UserAccount.Id
and CustomerCart.TelevisionId=Television.Id
and (UserAccount.Username like '%{txtSearch.Text}%' 
or Television.Title like '%{txtSearch.Text}%'
or CustomerCart.Time like '%{txtSearch.Text}%'
or CustomerCart.State like '%{txtSearch.Text}%')
order by Time desc";
            lbHolder.Text = sql;
            gv.DataSource = db.GetDataBySql(sql);
            gv.DataBind();
        }

        protected void Gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadGv();
            gv.PageIndex = e.NewPageIndex;
            gv.DataBind();
        }

        private void Gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //set selected ddlType
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlState = (DropDownList)e.Row.FindControl("ddlState");
                    ddlState.DataSource = new string[] { "In cart", "Shipping", "Completed" };
                    ddlState.DataBind();
                    string id = gv.DataKeys[e.Row.DataItemIndex].Value.ToString();
                    ddlState.SelectedValue = db.GetDataBySql($@"select State from CustomerCart where Id='{id}'").Rows[0]["State"].ToString();
                }
            }
        }

        protected void Gv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = gv.DataKeys[e.RowIndex].Value.ToString();
            string total = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtTotal")).Text;
            string state = ((DropDownList)gv.Rows[e.RowIndex].FindControl("ddlState")).SelectedValue;
            string sql = $@"update CustomerCart set Total={total}, State=N'{state}' where Id='{id}'";
            db.ExecNonQuery(sql);
            gv.EditIndex = -1;
            LoadGv();
        }

        protected void Gv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv.EditIndex = -1;
            LoadGv();
        }

        protected void Gv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv.EditIndex = e.NewEditIndex;
            LoadGv();
        }

        void LoadGv()
        {
            string sql = "";
            if (string.IsNullOrEmpty(lbHolder.Text))
                sql = $@"select CustomerCart.Id, UserAccount.Username as Customer, Television.Title as Television, CustomerCart.Quantity, CustomerCart.Time, CustomerCart.Total, CustomerCart.State
from CustomerCart, Television, UserAccount
where CustomerCart.CustomerId=UserAccount.Id
and CustomerCart.TelevisionId=Television.Id";
            else
                sql = lbHolder.Text;
            gv.DataSource = db.GetDataBySql(sql);
            gv.DataBind();
            if (gv.FooterRow == null) return;
        }

        protected void Gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gv.DataKeys[e.RowIndex].Value.ToString();
            string sql = $@"delete from CustomerCart where Id = '{id}'";
            db.ExecNonQuery(sql);
            LoadGv();
        }

    }
}

