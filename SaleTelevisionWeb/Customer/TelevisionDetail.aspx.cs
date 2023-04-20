using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Customer
{
    public partial class TelevisionDetail : System.Web.UI.Page
    {
        DbContext db = new DbContext();
        protected System.Data.DataTable dtTelevision;
        string idTelevision;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            InitPage();
        }

        void InitPage()
        {
            if (header.FindControl("lbContentTitle") != null)
            {
                Label lbContentTitle = (Label)header.FindControl("lbContentTitle");
                lbContentTitle.Text = title.Text;
            }
            idTelevision = Request.QueryString["Id"];
            LoadDetailById(idTelevision);
            LoadDtSimilar();
            lbtnAddToCart.Click += LbtnAddToCart_Click;
        }

        private void LbtnAddToCart_Click(object sender, EventArgs e)
        {
            //string televisionId = idTelevision;
            //Television television = Television.GetTelevisionById(idTelevision);
            //CookieCart.AddTelevisionToCart(television);
            //if (header.FindControl("lbQuantity") != null)
            //{
            //    Label lbQuantity = (Label)header.FindControl("lbQuantity");
            //    lbQuantity.Text = CookieCart.GetTelevisionQuantity().ToString();
            //}
            if (HttpContext.Current.Session["CurrentUser"]==null)
            {
                Response.Redirect("~/Common/Login.aspx");
                return;
            }
            UserAccount userAccount = (UserAccount)HttpContext.Current.Session["CurrentUser"];
            Television television = Television.GetTelevisionById(idTelevision);
            DataTable dataTable = db.GetDataBySql($"select * from CustomerCart where CustomerId={userAccount.Id} and State=N'In cart'");
            foreach(DataRow dr in dataTable.Rows)
            {
                if (dr["TelevisionId"].ToString()== idTelevision)
                {
                    int total = int.Parse(dr["Total"].ToString()) + int.Parse(television.Price);
                    string sql = $"update CustomerCart set Quantity=Quantity+1, Total='{total}' where Id={dr["Id"]}";
                    db.ExecNonQuery(sql);
                    header.LoadShoppingCart();
                    return;
                }
            }
            CustomerCart customerCart = new CustomerCart();
            customerCart.CustomerId = userAccount.Id;
            customerCart.TelevisionId = idTelevision;
            customerCart.Quantity = 1;
            customerCart.Total = (customerCart.Quantity * int.Parse(television.Price)).ToString();
            customerCart.Time = DateTime.Now;
            customerCart.State = "In cart";
            string sqll = $@"INSERT INTO CustomerCart(CustomerId, TelevisionId, Quantity, Time, Total, State) VALUES({customerCart.CustomerId}, '{customerCart.TelevisionId}', {customerCart.Quantity}, '{customerCart.Time}', '{customerCart.Total}', N'{customerCart.State}')";
            db.ExecNonQuery(sqll);
            header.LoadShoppingCart();
        }

        void LoadDetailById(string id)
        {
            Television television = Television.GetTelevisionById(id);
            lbDescription.Text = television.Description;
            lbPrice.Text = int.Parse(television.Price).ToString("n0") + "đ";
            System.Data.DataTable dt = new System.Data.DataTable();
            dt.Clear();
            dt.Columns.Add("Id");
            dt.Columns.Add("Title");
            dt.Columns.Add("Image");
            dt.Columns.Add("Size");
            dt.Columns.Add("Resolution");
            dt.Columns.Add("Brandname");
            dt.Columns.Add("Type");
            dt.Columns.Add("Price");
            dt.Columns.Add("Description");
            for (int i = 0; i < 3; i++)
            {
                System.Data.DataRow dr = dt.NewRow();
                dr["Id"] = television.Id;
                dr["Title"] = television.Title;
                dr["Image"] = television.Image;
                dr["Size"] = television.Size;
                dr["Resolution"] = television.Resolution;
                dr["Brandname"] = television.Brandname;
                dr["Type"] = television.Type;
                dr["Price"] = television.Price;
                dr["Description"] = television.Description;
                dt.Rows.Add(dr);
            }
            dtTelevision = dt;
            //dtLstImgSlider.DataSource = dt;
            //dtLstImgSlider.DataBind();
            //dtLstImgSliderPicker.DataSource = dt;
            //dtLstImgSliderPicker.DataBind();
        }

        void LoadDtSimilar()
        {
            string sql = @"SELECT TOP 3 * FROM Television ORDER BY NEWID()";
            dtLstSimilar.DataSource = db.GetDataBySql(sql);
            dtLstSimilar.DataBind();
        }
    }
}