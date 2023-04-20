using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Customer
{
    public partial class Cart : System.Web.UI.Page
    {
        DbContext db = new DbContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGvCart();
            }
            InitPage();
        }

        void InitPage()
        {
            if (header.FindControl("lbContentTitle") != null)
            {
                Label lbContentTitle = (Label)header.FindControl("lbContentTitle");
                lbContentTitle.Text = title.Text;
            }
            LoadDtSimilar();
            lbtnPlaceTheOrder.Click += LbtnPlaceTheOrder_Click;
        }


        void LoadGvCart()
        {
            if (HttpContext.Current.Session["CurrentUser"] == null)
            {
                Response.Redirect("~/Common/Login.aspx");
                return;
            }
            UserAccount userAccount = (UserAccount)HttpContext.Current.Session["CurrentUser"];
            string sql = $@"select CustomerCart.Id,CustomerCart.CustomerId,CustomerCart.TelevisionId,Television.Image,Television.Title,CustomerCart.Quantity,Television.Price,CustomerCart.Total 
                            from Television,CustomerCart,UserAccount
                            where Television.Id=CustomerCart.TelevisionId
                            and UserAccount.Id=CustomerCart.CustomerId
                            and CustomerCart.State=N'In cart'
                            and UserAccount.Id={userAccount.Id}";
            gvCart.DataSource = db.GetDataBySql(sql);
            gvCart.DataBind();
            if (gvCart.FooterRow == null) return;
            string sqlGetTotalBill = $@"SELECT SUM(CAST(Total as int)) as TotalBill 
                                        from Television,CustomerCart,UserAccount
                                        where Television.Id=CustomerCart.TelevisionId
                                        and UserAccount.Id=CustomerCart.CustomerId
                                        and CustomerCart.State=N'In cart'
                                        and UserAccount.Id={userAccount.Id}";
            Label lbTotalBill = (Label)gvCart.FooterRow.FindControl("lbTotalBill");
            if (lbTotalBill != null)
            {
                System.Data.DataTable dt = db.GetDataBySql(sqlGetTotalBill);
                if (dt.Rows.Count > 0)
                {
                    lbTotalBill.Text = int.Parse(dt.Rows[0]["TotalBill"].ToString()).ToString("n0") + "đ";
                }
                else
                {
                    lbTotalBill.Text= 0.ToString() + "đ";
                }
                lbShipSumary.Text = 0.ToString() + "đ";
                lbTotalSumary.Text = lbTotalBill.Text;
                lbVatSumary.Text = 0.ToString() + "đ";
                lbTotalBillSumary.Text = lbTotalBill.Text;
            }
        }

        private void LbtnPlaceTheOrder_Click(object sender, EventArgs e)
        {
            string script = "";
            if (gvCart.Rows.Count <= 0)
            {
                script = $"<script>alert('Have nothing in cart!');";
                script += "</script>";
                Response.Write(script);
                return;
            }
            string sql = "";
            foreach (DataKey dtk in gvCart.DataKeys)
            {
                sql = $@"update CustomerCart set Time='{DateTime.Now}' ,State='Shipping'
                            from CustomerCart
                            where CustomerCart.Id={dtk.Value.ToString()}";
                db.ExecNonQuery(sql);              
            }
            script = $"<script>alert('Order success!');";
            script += "window.location='../Customer/TelevisionList.aspx';</script>";
            Response.Write(script);
        }

        protected void lbtnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string id = btn.CommandName;
            string sql = $"delete from CustomerCart where Id={id}";
            db.ExecNonQuery(sql);
            Response.Redirect("~/Customer/Cart.aspx");
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string id = gvCart.DataKeys[rowIndex].Value.ToString();
            if(int.Parse(((TextBox)sender).Text)<1)   
                    ((TextBox)sender).Text = 1.ToString();
            string newQuantity = ((TextBox)sender).Text;
            string sql = $@"update CustomerCart set Quantity={newQuantity} ,Total=Television.Price*{newQuantity}
                            from Television,CustomerCart,UserAccount
                            where Television.Id=CustomerCart.TelevisionId
                            and UserAccount.Id=CustomerCart.CustomerId
                            and CustomerCart.Id={id}";
            db.ExecNonQuery(sql);
            LoadGvCart();
        }

        void LoadDtSimilar()
        {
            string sql = @"SELECT TOP 3 * FROM Television ORDER BY NEWID()";
            dtLstSimilar.DataSource = db.GetDataBySql(sql);
            dtLstSimilar.DataBind();
        }
    }
}