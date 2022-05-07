using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class adminbinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }*/

            GridView1.DataBind();
        }

        // go button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            getBookByID();
        }


        // update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }
        // delete button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteBookByID();
        }


        // add button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('A felhasznló azonosító már létezik, próbálkozzon más azonosítóval');</script>");
            }
            else
            {
                addNewAllat();
            }
        }



        // user defined functions

        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Allatok WHERE AllatID='" + TextBox1.Text + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Kiskedvenc Törlése Megtörtént!');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Érvénytelen felhasználói ID');</script>");
            }
        }

        void updateBookByID()
        {
            // Frissítés mező működik

            if (checkIfBookExists())
            {
                try
                {

                    string filepath = "~/upload_img/logo.jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("upload_img/" + filename));
                        filepath = "~/upload_img/" + filename;
                    }



                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Allatok set Neve=@Neve, SzuletesiIdo=@SzuletesiIdo, Faj=@Faj, Fajta=@Fajta, Ivar=@Ivar, Szine=@Szine, KulonlegesIsmertetoJele=@KulonlegesIsmertetoJele, IvartalanitasIdopontja=@IvartalanitasIdopontja, Torzskonyvezett=@Torzskonyvezett,img_link=@img_link WHERE AllatID='" + TextBox1.Text + "'", con);

                    cmd.Parameters.AddWithValue("@Neve", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@SzuletesiIdo", TextBox9.Text);
                    cmd.Parameters.AddWithValue("@Faj", TextBox10.Text);
                    cmd.Parameters.AddWithValue("@Fajta", TextBox11.Text);
                    cmd.Parameters.AddWithValue("@Ivar", TextBox8.Text);
                    cmd.Parameters.AddWithValue("@Szine", TextBox12.Text);
                    cmd.Parameters.AddWithValue("@KulonlegesIsmertetoJele", TextBox6.Text);
                    cmd.Parameters.AddWithValue("@IvartalanitasIdopontja", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@Torzskonyvezett", TextBox13.Text);

                    cmd.Parameters.AddWithValue("@img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Kiskedvenc adatok frissítése megtörtént');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid ID');</script>");
            }
        }


        void getBookByID()
        {
            //ID alapu keresés , egyenlőre nem működik :-/ 


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

                    string name = myreader2.GetString(1);
                    string bdate = myreader2.GetString(2);
                    string faj = myreader2.GetString(3);
                    string fajta = myreader2.GetString(4);
                    string ivar = myreader2.GetString(5);
                    string szine = myreader2.GetString(6);
                    string KulonlegesIsmertetoJele = myreader2.GetString(7);
                    string IvartalanitasIdopontja = myreader2.GetString(8);
                    string Torzskonyvezett = myreader2.GetString(9);
                    string imglink = myreader2.GetString(10);


                    TextBox2.Text = name;
                    TextBox9.Text = bdate;
                    TextBox10.Text = faj;
                    TextBox11.Text = fajta;
                    TextBox8.Text = ivar;
                    TextBox12.Text = szine;
                    TextBox6.Text = KulonlegesIsmertetoJele;
                    TextBox3.Text = IvartalanitasIdopontja;
                    TextBox13.Text = Torzskonyvezett;

                    global_filepath = imglink;

                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert(' Kiskedvenc ID rossz');</script>");
            }
        }
            





            bool checkIfBookExists()
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * from Allatok where AllatID='" + TextBox1.Text.Trim() + "' OR Neve='" + TextBox2.Text.Trim() + "';", con);
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



            void addNewAllat()
            {
                try
                {
                    // Letárolja az új értékeket az adatbázisba - működik-

                    string filepath = "~/upload_img/logo.jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("upload_img/" + filename));
                    filepath = "~/upload_img/" + filename;


                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO Allatok(AllatID,Neve,SzuletesiIdo,Faj,Fajta,Ivar,Szine,KulonlegesIsmertetoJele,IvartalanitasIdopontja,Torzskonyvezett,img_link) values(@AllatID,@Neve,@SzuletesiIdo,@Faj,@Fajta,@Ivar,@Szine,@KulonlegesIsmertetoJele,@IvartalanitasIdopontja,@Torzskonyvezett,@img_link)", con);

                    cmd.Parameters.AddWithValue("@AllatID", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Neve", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@SzuletesiIdo", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@Faj", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@Fajta", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@Ivar", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@Szine", TextBox12.Text.Trim());
                    cmd.Parameters.AddWithValue("@KulonlegesIsmertetoJele", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@IvartalanitasIdopontja", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Torzskonyvezett", TextBox13.Text.Trim());
                    cmd.Parameters.AddWithValue("@img_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Kiskedvenc Rögzítése Adattáblába Megtörtént.');</script>");
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

        







    }
}



         
