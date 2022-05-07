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
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["username"].ToString() =="" || Session["username"] ==null)
                {
                    Response.Write("<script>alert('A munkamenet lejárt Bejelentkezés újra');</script>");
                    Response.Redirect("userlogin.aspx");

                }
                else
                {
                    
                    if(!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                        
                        getAnimalDetails();
                    }
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('A munkamenet lejárt Bejelentkezés újra');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        // update button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();
                getAnimalDetails();

            }
        }


        // - user defined function -

        //user adatok frissítése
        void updateUserPersonalDetails()
        {
            string password = "";
            if (TextBox10.Text == "")
            {
                password = TextBox9.Text;
            }
            else
            {
                password = TextBox10.Text;
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update Gazdik set Nev=@Nev, Iranyitoszam=@Iranyitoszam, Varos=@Varos, Utca=@Utca, Telefonszam=@Telefonszam, Email=@Email, AllatID=@AllatID, password=@password, account_status=@account_status WHERE GazdiID='" + Session["username"].ToString() + "'", con);

                cmd.Parameters.AddWithValue("@Nev", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Iranyitoszam", TextBox7.Text);
                cmd.Parameters.AddWithValue("@Varos", TextBox6.Text);
                cmd.Parameters.AddWithValue("@Utca", TextBox5.Text);
                cmd.Parameters.AddWithValue("@Telefonszam", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Email", TextBox4.Text);
                cmd.Parameters.AddWithValue("@AllatID", TextBox8.Text);

                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Adatai sikeresen frissítve!');</script>");
                    getUserPersonalDetails();
                    getAnimalDetails();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

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
                TextBox8.Text = dt.Rows[0]["AllatID"].ToString();

                TextBox9.Text = dt.Rows[0]["password"].ToString();

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




        //jobb oldara betölti a Gazdihoz tartozó Állat adatokat - működik
        void getAnimalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Allatok where AllatID='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox11.Text = dt.Rows[0]["AllatID"].ToString();
                TextBox12.Text = dt.Rows[0]["Neve"].ToString();
                TextBox13.Text = dt.Rows[0]["SzuletesiIdo"].ToString();
                TextBox14.Text = dt.Rows[0]["Faj"].ToString();
                TextBox15.Text = dt.Rows[0]["Fajta"].ToString();
                TextBox16.Text = dt.Rows[0]["Ivar"].ToString();
                TextBox18.Text = dt.Rows[0]["Szine"].ToString();
                TextBox20.Text = dt.Rows[0]["KulonlegesIsmertetoJele"].ToString();
                TextBox17.Text = dt.Rows[0]["IvartalanitasIdopontja"].ToString();
                TextBox19.Text = dt.Rows[0]["Torzskonyvezett"].ToString();
                

               


            }
            catch (Exception )
            {

                Response.Write("<script>alert(' Kiskedvenc adatainak betöltése nem sikerült');</script>");
            }
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
        }
    }
}