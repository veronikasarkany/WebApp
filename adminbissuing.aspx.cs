using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    
    public partial class adminbissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }


        // Gazdi Keres gomb - működik
        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            string sql = "select* from Gazdik where GazdiID = '" + TextBox2.Text + "' ";

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader myreader;

            try
            {
                con.Open();
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    
                    string Gazdiname = myreader.GetString(1);

                    TextBox3.Text = Gazdiname;
                    
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert(' Gaidi ID rossz');</script>");
            }
        }
        // Kiskedvenc keres gomb -működik
        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            string sql = "select* from Allatok where AllatID = '" + TextBox1.Text + "' ";

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader myreader2;

            try
            {
                con.Open();
                myreader2 = cmd.ExecuteReader();
                while (myreader2.Read())
                {

                    string Allatname = myreader2.GetString(1);

                    TextBox4.Text = Allatname;

                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert(' Kiskedvenc ID rossz');</script>");
            }
        }
            

        // go button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }




        // user defined function


         
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
