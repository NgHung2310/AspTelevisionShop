using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Admin
{
    public partial class ManageTelevision : System.Web.UI.Page
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
            lbtnClear.Click += LbtnClear_Click;
            lbtnAdd.Click += LbtnAdd_Click;
            lbtnSearch.Click += LbtnSearch_Click;
            ddlType.DataSource = new string[] { "Smart TV", "Basic TV" };
            ddlType.DataBind();
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
            lbHolder.Text = sql;
            DataTable dt = db.GetDataBySql(sql);
            gv.DataSource = dt;
            gv.DataBind();
        }

        void ClearForm()
        {
            txtId.Text = "";
            txtTitle.Text = "";
            fulImage.Dispose();
            txtSize.Text = "";
            txtResolution.Text = "";
            txtBrandname.Text = "";
            ddlType.SelectedIndex = 0;
            txtPrice.Text = "";
            txtDescription.Text = "";
        }

        private void LbtnAdd_Click(object sender, EventArgs e)
        {
            if (!FieldIsValid())
                return;
            string id = txtId.Text;
            string title = txtTitle.Text;
            string image = fulImage.FileName;
            int size = int.Parse(txtSize.Text);
            string resolution = txtResolution.Text;
            string brandname = txtBrandname.Text;
            string type = ddlType.SelectedValue;
            string price = txtPrice.Text;
            string description = txtDescription.Text;
            Television television = new Television();
            television.Id = id;
            television.Title = title;
            television.Image = image;
            fulImage.SaveAs(Server.MapPath("~/Image/" + fulImage.FileName));
            television.Size = size;
            television.Resolution = resolution;
            television.Brandname = brandname;
            television.Type = type;
            television.Price = price;
            television.Description = description;
            television.InsertDb();
            ClearForm();
            LoadGv();
        }

        private void LbtnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
            txtId.Focus();
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
                    DropDownList ddlType = (DropDownList)e.Row.FindControl("ddlType");
                    ddlType.DataSource = new string[] { "Smart TV", "Basic TV" };
                    ddlType.DataBind();
                    string id = gv.DataKeys[e.Row.DataItemIndex].Value.ToString();
                    ddlType.SelectedValue = db.GetDataBySql($@"select Type from Television where Id='{id}'").Rows[0]["Type"].ToString();
                }
            }
        }

        protected void Gv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = gv.DataKeys[e.RowIndex].Value.ToString();
            Television televisionOld = Television.GetTelevisionById(id);
            Television televisionNew = new Television();
            televisionNew.Title = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtTitle")).Text;
            televisionNew.Image = "";
            FileUpload fulanh = (FileUpload)gv.Rows[e.RowIndex].FindControl("fulImage");
            if (string.IsNullOrEmpty(fulanh.FileName))
            {
                televisionNew.Image = ((HtmlImage)gv.Rows[e.RowIndex].FindControl("imgTelevision")).Src.Split('/').Last();
            }
            else
            {
                televisionNew.Image = fulanh.FileName;
                fulanh.SaveAs(Server.MapPath("~/Image/" + fulanh.FileName));
                string oldImg = ((HtmlImage)gv.Rows[e.RowIndex].FindControl("imgTelevision")).Src.Split('/').Last();
                string filePath = Server.MapPath("~/Image/" + oldImg);
                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                }
            }
            televisionNew.Size = int.Parse(((TextBox)gv.Rows[e.RowIndex].FindControl("txtSize")).Text);
            televisionNew.Resolution = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtResolution")).Text;
            televisionNew.Brandname = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtBrandname")).Text;
            televisionNew.Type= ((DropDownList)gv.Rows[e.RowIndex].FindControl("ddlType")).SelectedValue;
            televisionNew.Price = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtPrice")).Text;
            televisionNew.Description = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtDescription")).Text;
            televisionOld.UpdateDb(televisionNew);
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
                sql = $@"select * from Television";
            else
                sql = lbHolder.Text;
            gv.DataSource = db.GetDataBySql(sql);
            gv.DataBind();
            if (gv.FooterRow == null) return;           
        }

        protected void Gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gv.DataKeys[e.RowIndex].Value.ToString();
            Television television = Television.GetTelevisionById(id);
            string sql = $@"select * from CustomerCart where TelevisionId='{television.Id}'";
            if (db.GetDataBySql(sql).Rows.Count > 0)
            {
                Response.Write("<script>alert('This television is being referenced!');</script>");
                return;
            }
            string img = television.Image;
            string filePath = Server.MapPath("~/Image/" + img);
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
            television.DeleteDb();
            LoadGv();
        }

        bool FieldIsValid()
        {
            if (string.IsNullOrEmpty(txtId.Text))
            {
                Response.Write("<script>alert('Id is required!');</script>");
                txtId.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtTitle.Text))
            {
                Response.Write("<script>alert('Title is required!');</script>");
                txtTitle.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(fulImage.FileName))
            {
                Response.Write("<script>alert('Image is required!');</script>");
                fulImage.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtSize.Text))
            {
                Response.Write("<script>alert('Size is required!');</script>");
                txtSize.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtResolution.Text))
            {
                Response.Write("<script>alert('Resolution is required!');</script>");
                txtResolution.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtBrandname.Text))
            {
                Response.Write("<script>alert('Brandname is required!');</script>");
                txtBrandname.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtPrice.Text))
            {
                Response.Write("<script>alert('Price is required!');</script>");
                txtPrice.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtDescription.Text))
            {
                Response.Write("<script>alert('Description is required!');</script>");
                txtDescription.Focus();
                return false;
            }
            return true;
        }
    }
}

