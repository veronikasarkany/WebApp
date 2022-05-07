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
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // sign up button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {

                Response.Write("<script>alert('Már létezik ez a tagazonosító, próbálkozzon másik azonosítóval');</script>");
            }
            else
            {
                signUpNewMember();
            }
        }


        // user defined method

        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Gazdik where GazdiID='" + TextBox8.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }


        }



        void signUpNewMember()
        {
            //Response.Write("<script>alert('Testing');</script>");

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Gazdik(GazdiID,Nev,Iranyitoszam,Varos,Utca,Telefonszam,Email,AllatID,Password,account_status) values(@GazdiID,@Nev,@Iranyitoszam,@Varos,@Utca,@Telefonszam,@Email,@AllatID,@Password,@account_status)", con);

                
                cmd.Parameters.AddWithValue("@GazdiID", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Nev", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Iranyitoszam", TextBox7.Text.Trim());
                //cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Varos", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Utca", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Telefonszam", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", TextBox4.Text.Trim());                
                cmd.Parameters.AddWithValue("@AllatID", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sikeres regisztráció. A bejelentkezéshez lépjen a bejelentkezés menüpontra');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}