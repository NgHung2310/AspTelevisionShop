using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Admin
{
    public partial class ManageUser : System.Web.UI.Page
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
select * from UserAccount 
where Username like '%{txtSearch.Text}%' 
or Name like N'%{txtSearch.Text}%' 
or Address like N'%{txtSearch.Text}%' 
or Phone like '%{txtSearch.Text}%' 
or Role like '%{txtSearch.Text}%' 
";
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
                    DropDownList ddlRole = (DropDownList)e.Row.FindControl("ddlRole");
                    ddlRole.DataSource = new string[] { "admin", "customer" };
                    ddlRole.DataBind();
                    string id = gv.DataKeys[e.Row.DataItemIndex].Value.ToString();
                    ddlRole.SelectedValue = db.GetDataBySql($@"select Role from UserAccount where Id='{id}'").Rows[0]["Role"].ToString();
                }
            }
        }

        protected void Gv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = gv.DataKeys[e.RowIndex].Value.ToString();
            string password = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtPassword")).Text;
            string role = ((DropDownList)gv.Rows[e.RowIndex].FindControl("ddlRole")).SelectedValue;
            string sql = $@"update UserAccount set Password='{password}', Role=N'{role}' where Id='{id}'";
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
                sql = $@"select * from UserAccount";
            else
                sql = lbHolder.Text;
            gv.DataSource = db.GetDataBySql(sql);
            gv.DataBind();
            if (gv.FooterRow == null) return;
        }

        protected void Gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gv.DataKeys[e.RowIndex].Value.ToString();
            UserAccount userAccount = UserAccount.GetUserById(id);
            string sql = $@"select * from CustomerCart where CustomerId='{userAccount.Id}'";
            if (db.GetDataBySql(sql).Rows.Count > 0)
            {
                Response.Write("<script>alert('This customer is being referenced!');</script>");
                return;
            }
            userAccount.DeleteDb();
            LoadGv();
        }

    }
}

