using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Common
{
    public partial class Login : System.Web.UI.Page
    {
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
            btnLogin.Click += BtnLogin_Click;
            lbtnRegister.Click += LbtnRegister_Click;
        }

        private void LbtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Common/Register.aspx");
        }

        private void BtnLogin_Click(object sender, EventArgs e)
        {
            UserAccount user = GetUserByLogin(txtUsername.Text, txtPassword.Text);
            if (user==null)
                Response.Write("<script>alert('Username or password is not correct!')</script>");
            else if (user.Role == "admin")
            {
                //Response.Write($"<script>alert('Welcome {user.Name}!')</script>");
                //Response.Redirect("~/Admin/ManageTelevision.aspx");
                HttpContext.Current.Session["CurrentUser"] = user;
                string script = $"<script>alert('Welcome {user.Name}!');";
                script += "window.location='../Admin/ManageTelevision.aspx';</script>";
                Response.Write(script);
            }
            else if (user.Role != "admin")
            {
                //Response.Redirect("~/Customer/TelevisionList.aspx");
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", script, true);
                HttpContext.Current.Session["CurrentUser"] = user;
                string script = $"<script>alert('Welcome {user.Name}!');";
                script += "window.location='../Customer/TelevisionList.aspx';</script>";
                Response.Write(script);            
            }
        }

        UserAccount GetUserByLogin(string username, string password)
        {
            UserAccount user = UserAccount.GetUserByUsername(username);
            if (user == null)
            {
                return null;
            }
            if (user.Password == password)
            {
                return user;
            }
            return null;
        } 
    }
}