using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Common
{
    public partial class Header : System.Web.UI.UserControl
    {
        DbContext db = new DbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            InitPage();
            LoadShoppingCart();
        }

        void InitPage()
        {
            lbtnShopping.Click += LbtnShopping_Click;
            lbtnCart.Click += LbtnCart_Click;
            lbtnLogout.Click += LbtnLogout_Click;
            lbtnHome.Click += LbtnHome_Click;
            lbtnPurchaseHistory.Click += LbtnPurchaseHistory_Click;
            lbtnUserProfile.Click += LbtnUserProfile_Click;
            lbtnContact.Click += LbtnContact_Click;
            lbtnAboutShop.Click += LbtnAboutShop_Click;
            lbtnMember.Click += LbtnMember_Click;
        }

        private void LbtnMember_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Common/Member.aspx");
        }

        private void LbtnAboutShop_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Common/AboutShop.aspx");
        }

        private void LbtnContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Common/Contact.aspx");
        }

        private void LbtnUserProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/UserProfile.aspx");
        }

        private void LbtnPurchaseHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/PurchaseHistory.aspx");
        }

        public void LoadShoppingCart()
        {
            UserAccount userAccount = (UserAccount)HttpContext.Current.Session["CurrentUser"];
            if (userAccount != null)
            {
                string sql = $"select * from CustomerCart where CustomerId={userAccount.Id} and State=N'In cart'";
                DataTable dt = db.GetDataBySql(sql);
                int quantity = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    quantity += int.Parse(dr["Quantity"].ToString());
                }

                lbQuantity.Text = quantity.ToString();
            }
            else
            {
                lbQuantity.Text = "0";
            }
        }

        private void LbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/TelevisionList.aspx");
        }

        private void LbtnLogout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Remove("CurrentUser");
            //HttpContext.Current.Session["CurrentUser"] = null;
            Response.Redirect("~/Common/Login.aspx");
        }

        private void LbtnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/Cart.aspx");
        }

        private void LbtnShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/TelevisionList.aspx");
        }
    }
}