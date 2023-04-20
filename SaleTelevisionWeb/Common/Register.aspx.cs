using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Common
{
    public partial class Register : System.Web.UI.Page
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
            btnRegister.Click += BtnRegister_Click;
            lbtnSignIn.Click += LbtnSignIn_Click;
        }

        private void LbtnSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Common/Login.aspx");
        }

        private void BtnRegister_Click(object sender, EventArgs e)
        {
            if (!CheckFieldsIsValid())
                return;
            if (!CheckPhoneNumberIsValid())
            {
                Response.Write("<script>alert('Phone number is not valid!')</script>");
                txtPhone.Focus();
                return;
            }
            if (UserAccount.GetUserByUsername(txtUsername.Text) != null)
            {
                Response.Write("<script>alert('Username is already exist!')</script>");
                txtUsername.Focus();
                return;
            }
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                Response.Write("<script>alert('Confirm password does not match!')</script>");
                txtConfirmPassword.Focus();
                return;
            }
            UserAccount user = new UserAccount();
            user.Username = txtUsername.Text;
            user.Password = txtPassword.Text;
            user.Name = txtName.Text;
            user.Address = txtAddress.Text;
            user.Phone = txtPhone.Text;
            user.Role = "customer";
            user.InsertDb();
            string script = $"<script>alert('Register successfully!');";
            script += "window.location='../Common/Login.aspx';</script>";
            Response.Write(script);
        }
        
        bool CheckPhoneNumberIsValid()
        {
            foreach(char chr in txtPhone.Text)
            {
                if (Char.IsLetter(chr))
                    return false;
            }
            return true;
        }

        bool CheckFieldsIsValid()
        {
            if (String.IsNullOrEmpty(txtName.Text.Trim()))
            {
                Response.Write("<script>alert('Name is required!')</script>");
                txtName.Focus();
                return false;
            }
            if (String.IsNullOrEmpty(txtAddress.Text.Trim()))
            {
                Response.Write("<script>alert('Address is required!')</script>");
                txtAddress.Focus();
                return false;
            }
            if (String.IsNullOrEmpty(txtPhone.Text.Trim()))
            {
                Response.Write("<script>alert('Phone is required!')</script>");
                txtPhone.Focus();
                return false;
            }
            if (String.IsNullOrEmpty(txtUsername.Text.Trim()))
            {
                Response.Write("<script>alert('Username is required!')</script>");
                txtUsername.Focus();
                return false;
            }
            if (String.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
                Response.Write("<script>alert('Password is required!')</script>");
                txtPassword.Focus();
                return false;
            }
            return true;
        }
    }
}


