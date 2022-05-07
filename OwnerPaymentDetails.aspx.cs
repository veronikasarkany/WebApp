using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class OwnerPaymentDetails : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('A munkamenet lejárt Bejelentkezés újra');</script>");
                    Response.Redirect("userlogin.aspx");

                }
                else
                {

                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();

                        getOwnerPayment();
                    }
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('A munkamenet lejárt Bejelentkezés újra');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        // - user defined function -

        //(belépett)Gazdi adatokat betölti - Működik
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Gazdik where AllatID='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox1.Text = dt.Rows[0]["Nev"].ToString();
                TextBox2.Text = dt.Rows[0]["GazdiID"].ToString();
                TextBox7.Text = dt.Rows[0]["Iranyitoszam"].ToString();
                TextBox6.Text = dt.Rows[0]["Varos"].ToString();
                TextBox5.Text = dt.Rows[0]["Utca"].ToString();

                TextBox3.Text = dt.Rows[0]["Telefonszam"].ToString();
                TextBox4.Text = dt.Rows[0]["Email"].ToString();
                

                Label1.Text = dt.Rows[0]["account_status"].ToString();

                if (dt.Rows[0]["account_status"].ToString() == "active")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["account_status"].ToString() == "pending")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString() == "deactive")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-info");
                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //Befizetések

        void getOwnerPayment()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Befizetesek where GazdiID='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                
                TextBox13.Text = dt.Rows[0]["Datum"].ToString();
                TextBox14.Text = dt.Rows[0]["BefizetesekOssz"].ToString();
                TextBox15.Text = dt.Rows[0]["KezelesiKoltseg"].ToString();
                TextBox16.Text = dt.Rows[0]["RendelkezesreAllo"].ToString();

                //TextBox14.Text = string.Format(CultureInfo.CreateSpecificCulture("hu-HUF"), "{0:C}");
                //Thread.CurrentThread.CurrentCulture = new CultureInfo("fr-FR");



            }
            catch (Exception)
            {

                Response.Write("<script>alert('Befizetési adatokat nem sikerült betölteni');</script>");
            }
        }
    }
}