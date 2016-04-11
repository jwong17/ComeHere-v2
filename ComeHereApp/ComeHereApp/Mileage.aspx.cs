using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ComeHereApp
{
    public partial class Mileage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["user"] as string))
            {
                Response.Redirect("Login.aspx?redirect=" + Server.UrlEncode(Request.Url.AbsoluteUri));
            }
            if (!((Page)System.Web.HttpContext.Current.CurrentHandler).IsPostBack)
            {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand com = new SqlCommand("SELECT Make + Model , id from Cars where cars.id = ANY (Select carID from UsersCars where userID = (Select [user].Id from dbo.[User] where [user].username = '"+Session["user"].ToString()+"'))", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            selectCarDDL.DataTextField = ds.Tables[0].Columns[0].ToString();
            selectCarDDL.DataSource = ds.Tables[0];
            selectCarDDL.DataValueField = ds.Tables[0].Columns["id"].ToString();

            selectCarDDL.DataBind();

            refreshLabels();
            Table3.Visible = true;
            }
        }

        private void refreshLabels()
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand com = new SqlCommand("SELECT totalDist,totalLitres from UsersCars where UsersCars.carID = " + selectCarDDL.SelectedValue.ToString() + " and UsersCars.userID = (Select [user].Id from dbo.[User] where [user].username = '"+Session["user"].ToString()+"')", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            totalDist.Text =  ds.Tables[0].Rows[0]["totalDist"].ToString() + "km";
            totalLitres.Text = ds.Tables[0].Rows[0]["totalLitres"].ToString() + "litres";
            avgMileage.Text = "Avg: " + Math.Round(((Double.Parse(ds.Tables[0].Rows[0]["totalDist"].ToString()) / Double.Parse(ds.Tables[0].Rows[0]["totalLitres"].ToString()))) , 2).ToString() +"km/litre" ;
            
           
        }

        protected void selectCarDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            refreshLabels();
            //Table3.Visible = true;

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand com = new SqlCommand("UPDATE UsersCars SET totalDist = totalDist + " + tripDist.Text.ToString() + ", totalLitres = totalLitres + " + tripLitres.Text.ToString() + " WHERE userID = (Select [user].Id from dbo.[User] where [user].username = '"+Session["user"].ToString()+"') and carID = " + selectCarDDL.SelectedValue.ToString(), con);
            com.ExecuteNonQuery();

            //adding to pumpdetails table
            com = new SqlCommand("INSERT INTO pumpDetails(userID, carID, pumpDateTime, tripLitres, tripMileage) VALUES ((Select [user].Id from dbo.[User] where [user].username = '" + Session["user"].ToString() + "'),'" + selectCarDDL.SelectedValue.ToString() + "','" + System.DateTime.Now + "','" + tripLitres.Text.ToString() + "','" + tripDist.Text.ToString() + "')", con);
            com.ExecuteNonQuery();



            refreshLabels();
            tripDist.Text = "";
            tripLitres.Text = "";
            newTripLbl.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + newTripLbl.ClientID + "').style.display='none'\",2000)</script>");
        }

        protected void addTrip_Click(object sender, ImageClickEventArgs e)
        {
            if(Panel1.Visible)
            {
                Panel1.Visible = false;
            }
            else
            {
                Panel1.Visible = true;
            }
        }
    }
}