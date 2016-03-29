using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComeHereApp
{
    public partial class Registeration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            //todo: validation
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand com = new SqlCommand("INSERT INTO dbo.[User] (username, password) VALUES ('" + usernameTxt.Text.ToString() + "','" + passwordTxt.Text.ToString() + "')", con);
            com.ExecuteNonQuery();

        }
    }
}