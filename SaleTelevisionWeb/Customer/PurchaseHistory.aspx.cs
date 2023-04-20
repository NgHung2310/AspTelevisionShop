using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Customer
{
    public partial class PurchaseHistory1 : System.Web.UI.Page
    {
        DbContext db = new DbContext();
        int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserAccount user = (UserAccount)HttpContext.Current.Session["CurrentUser"];
            if (user == null)
            {
                Response.Redirect("~/Common/Login.aspx");
                return;
            }
            InitPage();
            userId = user.Id;
            if (!Page.IsPostBack)
            {
                LoadGvById(userId);
            }
        }

        void InitPage()
        {
            if (header.FindControl("lbContentTitle") != null)
            {
                Label lbContentTitle = (Label)header.FindControl("lbContentTitle");
                lbContentTitle.Text = title.Text;
            }
            gv.PageIndexChanging += Gv_PageIndexChanging;
            lbtnSearch.Click += LbtnSearch_Click;
        }

        private void LbtnSearch_Click(object sender, EventArgs e)
        {
            string sql = $@"
select CustomerCart.Id, UserAccount.Username as Customer, Television.Image as TelevisionImage, Television.Title as TelevisionTitle, CustomerCart.Quantity, CustomerCart.Time, CustomerCart.Total, CustomerCart.State, Television.Id as TelevisionId
from CustomerCart, Television, UserAccount
where CustomerCart.CustomerId=UserAccount.Id
and CustomerCart.TelevisionId=Television.Id
and CustomerCart.State != 'In cart'
and UserAccount.Id={userId}
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
            LoadGvById(userId);
            gv.PageIndex = e.NewPageIndex;
            gv.DataBind();
        }
        
        void LoadGvById(int id)
        {
            string sql = "";
            if (string.IsNullOrEmpty(lbHolder.Text))
                sql = $@"
select CustomerCart.Id, UserAccount.Username as Customer, Television.Image as TelevisionImage, Television.Title as TelevisionTitle, CustomerCart.Quantity, CustomerCart.Time, CustomerCart.Total, CustomerCart.State, Television.Id as TelevisionId
from CustomerCart, Television, UserAccount
where CustomerCart.CustomerId=UserAccount.Id
and CustomerCart.TelevisionId=Television.Id
and CustomerCart.State != 'In cart'
and UserAccount.Id={id}
order by Time desc";
            else
                sql = lbHolder.Text;
            gv.DataSource = db.GetDataBySql(sql);
            gv.DataBind();
            if (gv.FooterRow == null) return;
        }
    }
}

