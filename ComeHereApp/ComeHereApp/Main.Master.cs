using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComeHereApp
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["user"] as string))
            {
                linkBtnLogout.Visible = false;
            }
            else
            {
                linkBtnLogout.Visible = true;
            }
        }

        

        protected void linkBtnLogout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Abandon();
            Response.Redirect("index.aspx");
        }



    }
}