using SaleTelevisionWeb.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Customer
{
    public partial class Sidebar : System.Web.UI.UserControl
    {
        DbContext db = new DbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitPage();
            }
            InitEventSideBar();
            InitCbxSidebar();
        }

        /// <summary>
        /// My page load
        /// </summary>
        void InitPage()
        {
            dtLstResolution.DataSource = db.GetDataBySql("select distinct Resolution from Television");
            dtLstResolution.DataBind();
            dtLstBrandname.DataSource = db.GetDataBySql("select distinct Brandname from Television");
            dtLstBrandname.DataBind();
            dtLstType.DataSource = db.GetDataBySql("select distinct Type from Television");
            dtLstType.DataBind();
        }

        /// <summary>
        /// Set event for controls in sidebar
        /// </summary>
        void InitEventSideBar()
        {
            lbtnApplyFilter.Click += LbtlFilter_Click;
            lbtnClearFilter.Click += LbtnClearFilter_Click;
            lbtnPriceHighToLow.Click += LbtnPriceHighToLow_Click;
            lbtnPriceLowToHigh.Click += LbtnPriceLowToHigh_Click;
        }


        private void LbtnPriceLowToHigh_Click(object sender, EventArgs e)
        {
            string sql = GetSqlFilterByCbx() + " order by Price asc";
            HttpContext.Current.Session["Sql"] = sql;
            Response.Redirect("~/Customer/TelevisionList.aspx");
        }

        private void LbtnPriceHighToLow_Click(object sender, EventArgs e)
        {
            string sql = GetSqlFilterByCbx() + " order by Price desc";
            HttpContext.Current.Session["Sql"] = sql;
            Response.Redirect("~/Customer/TelevisionList.aspx");
        }

        /// <summary>
        /// Set checkbox status when postback 
        /// </summary>
        void InitCbxSidebar()
        {
            if (HttpContext.Current.Session["CbxSidebarStatus"] != null)
            {
                List<KeyValuePair<HtmlInputCheckBox, bool>> cbxSidebarStatus = (List<KeyValuePair<HtmlInputCheckBox, bool>>)HttpContext.Current.Session["CbxSidebarStatus"];
                foreach (DataListItem item in dtLstResolution.Items)
                {
                    HtmlInputCheckBox cbxResolution = (HtmlInputCheckBox)item.FindControl("cbxResolution");
                    cbxSidebarStatus.ForEach(x =>   {
                        if (x.Key.ClientID == cbxResolution.ClientID)
                        {
                            cbxResolution.Checked = x.Value;
                        }
                    });
                }
                foreach (DataListItem item in dtLstBrandname.Items)
                {
                    HtmlInputCheckBox cbxBrandname = (HtmlInputCheckBox)item.FindControl("cbxBrandname");
                    cbxSidebarStatus.ForEach(x =>   {
                        if (x.Key.ClientID == cbxBrandname.ClientID)
                        {
                            cbxBrandname.Checked = x.Value;
                        }
                    });
                }
                foreach (DataListItem item in dtLstType.Items)
                {
                    HtmlInputCheckBox cbxType = (HtmlInputCheckBox)item.FindControl("cbxType");
                    cbxSidebarStatus.ForEach(x =>   {
                        if (x.Key.ClientID == cbxType.ClientID)
                        {
                            cbxType.Checked = x.Value;
                        }
                    });
                }
                HttpContext.Current.Session["CbxSidebarStatus"] = null;
            }
        }

        private void LbtnClearFilter_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in dtLstType.Items)
            {
                HtmlInputCheckBox cbxType = (HtmlInputCheckBox)item.FindControl("cbxType");
                cbxType.Checked = false;
            }
            foreach (DataListItem item in dtLstBrandname.Items)
            {
                HtmlInputCheckBox cbxBrandname = (HtmlInputCheckBox)item.FindControl("cbxBrandname");
                cbxBrandname.Checked = false;
            }
            foreach (DataListItem item in dtLstResolution.Items)
            {
                HtmlInputCheckBox cbxResolution = (HtmlInputCheckBox)item.FindControl("cbxResolution");
                cbxResolution.Checked = false;
            }
            //Response.Redirect(Path.GetFileName(Request.PhysicalPath));
            Response.Redirect("~/Customer/TelevisionList.aspx");
        }

        private void LbtlFilter_Click(object sender, EventArgs e)
        {
            string sql = GetSqlFilterByCbx();
            HttpContext.Current.Session["Sql"] = sql;            
            Response.Redirect("~/Customer/TelevisionList.aspx");
        }


        protected void cbxResolution_CheckedChanged(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void cbxBrandname_CheckedChanged(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void cbxType_CheckedChanged(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Return sql filter string by checkbox in this sidebar and get checkbox status for auto postback  
        /// </summary>
        /// <returns></returns>
        private string GetSqlFilterByCbx()
        {
            string sql = "select * from Television where 1=1 ";
            List<KeyValuePair<HtmlInputCheckBox, bool>> cbxSidebarStatus = new List<KeyValuePair<HtmlInputCheckBox, bool>>();

            List<string> conditionResolution = new List<string>();
            foreach (DataListItem item in dtLstResolution.Items)
            {
                HtmlInputCheckBox cbxResolution = (HtmlInputCheckBox)item.FindControl("cbxResolution");
                if (cbxResolution.Checked)
                {
                    conditionResolution.Add(cbxResolution.Value);
                    cbxSidebarStatus.Add(new KeyValuePair<HtmlInputCheckBox, bool>(cbxResolution, true));
                }
            }
            string sqlResolution = conditionResolution.Count > 0 ? $@" and Resolution in ('{string.Join("','", conditionResolution)}')" : "";

            List<string> conditionBrandname = new List<string>();
            foreach (DataListItem item in dtLstBrandname.Items)
            {
                HtmlInputCheckBox cbxBrandname = (HtmlInputCheckBox)item.FindControl("cbxBrandname");
                if (cbxBrandname.Checked)
                {
                    conditionBrandname.Add(cbxBrandname.Value);
                    cbxSidebarStatus.Add(new KeyValuePair<HtmlInputCheckBox, bool>(cbxBrandname, true));
                }
            }
            string sqlBrandname = conditionBrandname.Count > 0 ? $@" and Brandname in ('{string.Join("','", conditionBrandname)}')" : "";

            List<string> conditionType = new List<string>();
            foreach (DataListItem item in dtLstType.Items)
            {
                HtmlInputCheckBox cbxType = (HtmlInputCheckBox)item.FindControl("cbxType");
                if (cbxType.Checked)
                {
                    conditionType.Add(cbxType.Value);
                    cbxSidebarStatus.Add(new KeyValuePair<HtmlInputCheckBox, bool>(cbxType, true));
                }
            }
            string sqlType = conditionType.Count > 0 ? $@" and Type in ('{string.Join("','", conditionType)}')" : "";

            sql += sqlResolution + sqlBrandname + sqlType;
            HttpContext.Current.Session["CbxSidebarStatus"] = cbxSidebarStatus;
            return sql;
        }
    }
}