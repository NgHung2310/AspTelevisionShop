using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaleTelevisionWeb.Common
{
    public partial class Contact : System.Web.UI.Page
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
        }
    }
}