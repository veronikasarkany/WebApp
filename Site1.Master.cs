using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["role"] == null)
                {
                   
                    LinkButton1.Visible = true; // user login link button
                    LinkButton2.Visible = true; // sign up link button
                    LinkButton3.Visible = false; // logout link button
                    LinkButton4.Visible = false; // Gazdi Adatok
                    LinkButton5.Visible = false; // Befizetési Adatok

                    LinkButton7.Visible = false; // hello user link button

                    LinkButton6.Visible = true; // admin login link button
                    LinkButton11.Visible = false; // Admin:Kiskedvenc Módosítás link button
                    LinkButton8.Visible = false; // Kiskedvenc adatok link button
                    LinkButton9.Visible = false; // Gazid-Allatok adatok link button
                    LinkButton10.Visible = false; // Gazdi felhasználói adatok link button
                    



                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton4.Visible = true; // Gazdi Adatok
                    LinkButton5.Visible = true; // Befizetési Adatok
                    LinkButton1.Visible = false; // user login link button
                    LinkButton2.Visible = false; // sign up link button

                    LinkButton3.Visible = true; // logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();


                    LinkButton6.Visible = true; // admin login link button
                    LinkButton11.Visible = false; // Admin:Kiskedvenc Módosítás link button
                    
                    LinkButton8.Visible = false; // Kiskedvenc adatok link button
                    LinkButton9.Visible = false; // Gazid-Allatok adatok link button
                    LinkButton10.Visible = false; // Gazdi felhasználói adatok link button

                }

                else if (Session["role"].Equals("admin"))
                {
                    LinkButton4.Visible = true; // Gazdi Adatok
                    LinkButton5.Visible = true; // Befizetési Adatok
                    LinkButton1.Visible = false; // user login link button
                    LinkButton2.Visible = false; // sign up link button

                    LinkButton3.Visible = true; // logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "Hello Admin";


                    LinkButton6.Visible = false; // admin login link button
                    LinkButton11.Visible = true; // Admin:Kiskedvenc Módosítás link button
                    
                    LinkButton8.Visible = true; // Kiskedvenc adatok link button
                    LinkButton9.Visible = true; // Gazid-Allatok adatok link button
                    LinkButton10.Visible = true; // Gazdi felhasználói adatok link button
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            //Admin Belépés

            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            //Admin:Kiskedvenc Módosítás
            Response.Redirect("adminanimalmanagement.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            //Gazdi felhasználói adatok
            Response.Redirect("adminmembermanagement.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            //Gazid-Allatok adatok
            Response.Redirect("adminbissuing.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            //Kiskedvenc adatok
            Response.Redirect("adminbinventory.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            // Gazdi Adatok
            Response.Redirect("userprofile.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //User login
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            //User register
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            //logout button

            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true; // user login link button
            LinkButton2.Visible = true; // sign up link button

            LinkButton3.Visible = false; // logout link button
            LinkButton7.Visible = false; // hello user link button


            LinkButton6.Visible = true; // admin login link button
            LinkButton11.Visible = false; // Admin:Kiskedvenc Módosítás link button

            LinkButton8.Visible = false; // Kiskedvenc adatok link button
            LinkButton9.Visible = false; // Gazid-Allatok adatok link button
            LinkButton10.Visible = false; // Gazdi felhasználói adatok link button

            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            // view profile
            Response.Redirect("userprofile.aspx");

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            //Gazdi Befizetések
            Response.Redirect("OwnerPaymentDetails.aspx");
        }
    }
}