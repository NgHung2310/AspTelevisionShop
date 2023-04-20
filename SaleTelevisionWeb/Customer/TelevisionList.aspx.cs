using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Customer
{
    public partial class TelevisionList : System.Web.UI.Page
    {
        DbContext db = new DbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            InitPage();
            LoadDataList();
        }

        /// <summary>
        /// My page load
        /// </summary>
        void InitPage()
        {
            if (header.FindControl("lbContentTitle") != null)
            {
                Label lbContentTitle = (Label)header.FindControl("lbContentTitle");
                lbContentTitle.Text = title.InnerText;
            }
            lbtnSearch.Click += LbtnSearch_Click;  
            
        }

        private void LbtnSearch_Click(object sender, EventArgs e)
        {
            string sql = $@"
select * from Television 
where Title like N'%{txtSearch.Text}%'
or Size like N'%{txtSearch.Text}%'
or Resolution like N'%{txtSearch.Text}%'
or Brandname like N'%{txtSearch.Text}%'
or Type like N'%{txtSearch.Text}%'
or Description like N'%{txtSearch.Text}%'";
            dtLstTelevision.DataSource = db.GetDataBySql(sql);
            dtLstTelevision.DataBind();
        }

        /// <summary>
        /// Load data for main page
        /// </summary>
        void LoadDataList()
        {
            if (HttpContext.Current.Session["Sql"] != null)
            {
                dtLstTelevision.DataSource = db.GetDataBySql(HttpContext.Current.Session["sql"].ToString());
                dtLstTelevision.DataBind();
                HttpContext.Current.Session["Sql"] = null;
            }
            else
            {
                dtLstTelevision.DataSource = db.GetDataBySql("select * from Television ");
                dtLstTelevision.DataBind();
            }
        }


    }
}
