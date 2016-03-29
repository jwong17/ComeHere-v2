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
            if (!((Page)System.Web.HttpContext.Current.CurrentHandler).IsPostBack)
            {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand com = new SqlCommand("SELECT Make + Model , id from Cars where cars.id = ANY (Select carID from UsersCars where userID = 1)", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            selectCarDDL.DataTextField = ds.Tables[0].Columns[0].ToString();
            selectCarDDL.DataSource = ds.Tables[0];
            selectCarDDL.DataValueField = ds.Tables[0].Columns["id"].ToString();

            selectCarDDL.DataBind();

            refreshLabels();
            }
        }

        private void refreshLabels()
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand com = new SqlCommand("SELECT totalDist,totalLitres from UsersCars where UsersCars.carID = " + selectCarDDL.SelectedValue.ToString() + " and UsersCars.userID = 1", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            totalDist.Text = "Total Distance: " + ds.Tables[0].Rows[0]["totalDist"].ToString() + "km";
            totalLitres.Text = "Total Litres: " + ds.Tables[0].Rows[0]["totalLitres"].ToString() + "litres";
            avgMileage.Text = "Average Mileage: " + (Int32.Parse(ds.Tables[0].Rows[0]["totalDist"].ToString()) / Int32.Parse(ds.Tables[0].Rows[0]["totalLitres"].ToString())).ToString() +"km/litre" ;
            
           
        }

        protected void selectCarDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            refreshLabels();

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand com = new SqlCommand("UPDATE UsersCars SET totalDist = totalDist + " + tripDist.Text.ToString() + ", totalLitres = totalLitres + " + tripLitres.Text.ToString() + " WHERE userID = 1 and carID = "+selectCarDDL.SelectedValue.ToString(), con);
            com.ExecuteNonQuery();

            refreshLabels();
            tripDist.Text = "";
            tripLitres.Text = "";
        }
    }
}