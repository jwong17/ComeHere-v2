using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComeHereApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUpBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand com = new SqlCommand("SELECT * from dbo.[USER] WHERE dbo.[User].username = '" + userNameTxt.Text.ToString() + "'", con); // table name 

            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count != 0) //if username exist
            {
                if ((passWordTxt.Text.ToString().Equals(ds.Tables[0].Rows[0]["password"].ToString().Trim()))) //if password is correct
                {
                    //todo setup session
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Invalid Password";
                }
            }
            else //if username doesnt exist
            {
                Label1.Visible = true;
                Label1.Text = "Invalid User";
            }
        }
    }
}