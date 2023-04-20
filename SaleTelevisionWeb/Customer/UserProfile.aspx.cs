using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Customer
{
    public partial class UserInfomation : System.Web.UI.Page
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
                InitPage();
            if (!Page.IsPostBack)
            {
                InitForm();
            }
        }

        void InitPage()
        {
            if (header.FindControl("lbContentTitle") != null)
            {
                Label lbContentTitle = (Label)header.FindControl("lbContentTitle");
                lbContentTitle.Text = title.Text;
            }
            lbtnBackToHome.Click += LbtnBackToHome_Click;
            lbtnSaveChanges.Click += LbtnSaveChanges_Click;
        }

        void InitForm()
        {
            UserAccount user = (UserAccount)HttpContext.Current.Session["CurrentUser"];
            string usn = "";
            int count = 0;
            foreach (char c in user.Username)
                if (count < 4) { usn += c; count++; }
                else usn += "*";
            txtUsername.Text = usn;
            txtUsername.Enabled = false;
            txtName.Text = user.Name;
            txtAddress.Text = user.Address;
            txtPhone.Text = user.Phone;
        }

        private void LbtnSaveChanges_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string address = txtAddress.Text;
            string phone = txtPhone.Text;
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string currentPassword = txtCurrentPassword.Text;
            if (!CheckFieldsIsValid())
                return;
            UserAccount user = (UserAccount)HttpContext.Current.Session["CurrentUser"];
            if(txtCurrentPassword.Text!= user.Password)
            {
                Response.Write("<script>alert('Current password does not correct!')</script>");
                txtConfirmPassword.Focus();
                return;
            }
            UserAccount newUser = new UserAccount();
            newUser.Id = user.Id;
            newUser.Username = user.Username;
            newUser.Password = string.IsNullOrEmpty(newPassword) ? user.Password : newPassword;
            newUser.Name = name;
            newUser.Address = address;
            newUser.Phone = phone;
            newUser.Role = user.Role;
            user.UpdateDb(newUser);
            HttpContext.Current.Session["CurrentUser"] = UserAccount.GetUserById(user.Id.ToString());
            Response.Write("<script>alert('Saved!')</script>");
            InitForm();
        }

        private void LbtnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/TelevisionList.aspx");
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
            if (String.IsNullOrEmpty(txtCurrentPassword.Text.Trim()))
            {
                Response.Write("<script>alert('Password is required!')</script>");
                txtCurrentPassword.Focus();
                return false;
            }            
            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                Response.Write("<script>alert('Confirm password does not match!')</script>");
                txtConfirmPassword.Focus();
                return false;
            }
            return true;
        }
    }
}