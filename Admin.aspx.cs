using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Rail_BD
{
    public partial class Admin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) {

            }

        }

        protected void signoutbuttonid_Click(object sender, EventArgs e)
        {
            Session["AdminLoggedIn"] = null;

            // Check if the login cookie exists
            if (Request.Cookies["AdminLogin"] != null)
            {
                // Delete the login cookie
                HttpCookie loginCookie = new HttpCookie("AdminLogin");
                loginCookie.Expires = DateTime.Now.AddDays(-1); // Set the expiration date to a past date to remove the cookie
                Response.Cookies.Add(loginCookie);
            }
            Response.Redirect("home.aspx");
        }

        protected void addtrainshowid_Click(object sender, EventArgs e)
        {
            if (adddatashow.Visible == true) { adddatashow.Visible = false;
                addtrainshowid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
            }
            else if(adddatashow.Visible == false) { 
                adddatashow.Visible = true;
                addtrainshowid.BackColor = System.Drawing.Color.Red;
                trainnameid.Visible = true;
                sourceid.Visible = true;
                destinationid.Visible = true;
                timeid.Visible = true;
                addtrainbuttonid.Visible = true;
                lable1.Visible = true;
                lable2.Visible = true;
                lable3.Visible = true;
                Label0.Visible = true;
            }


        }

        protected void addtrainbuttonid_Click(object sender, EventArgs e)
        {
            try
            {
                if (trainnameid.Text == "")
                {
                    Response.Write("<script>alert('Train Name Required');</script>");
                }
                else if (sourceid.Text == "")
                {
                    Response.Write("<script>alert('Train Source Required');</script>");
                }
                else if (destinationid.Text == "")
                {
                    Response.Write("<script>alert('Train Destination Required');</script>");
                }
                else if (timeid.Text == "")
                {
                    Response.Write("<script>alert('Train Time Required');</script>");
                }
                else
                {
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO traininformation ([trainname],[source],[destination],[time]) VALUES(@trainname, @source, @destination,@time)", con);

                    cmd.Parameters.AddWithValue("@trainname", trainnameid.Text.Trim());
                    cmd.Parameters.AddWithValue("@source", sourceid.Text.Trim());
                    cmd.Parameters.AddWithValue("@destination", destinationid.Text.Trim());
                    cmd.Parameters.AddWithValue("@time", timeid.Text.Trim());


                    cmd.ExecuteNonQuery();


                    con.Close();
                    Response.Write("<script>alert('Added');</script>");
                    trainnameid.Text = "";
                    sourceid.Text = "";
                    destinationid.Text = "";
                    timeid.Text = "";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");



            }
        }

        protected void showticketid_Click(object sender, EventArgs e)
        {
            if (ticketshow.Visible == true)
            {
                ticketshow.Visible = false;
                showticketid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
            }
            else if (ticketshow.Visible == false)
            {
                ticketshow.Visible = true;
                showticketid.BackColor = System.Drawing.Color.Red;
            }
          
            try { 
            SqlConnection con2 = new SqlConnection(strcon);
            con2.Open();
            SqlDataAdapter sda1 = new SqlDataAdapter("SELECT [ticketnumber],[fromto],[date],[time],[class],[seatno],[fare],[username] FROM seatbooking", con2);
            DataTable dtbl = new DataTable();
            sda1.Fill(dtbl);
            ticketgridview.DataSource = dtbl;
            ticketgridview.DataBind();
            con2.Close();
            }
            catch (Exception ex) {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

        }

        protected void showtrainid_Click(object sender, EventArgs e)
        {
            if (trainshow.Visible == true)
            {
                trainshow.Visible = false;
                showtrainid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
            }
            else if (ticketshow.Visible == false)
            {
                trainshow.Visible = true;
                showtrainid.BackColor = System.Drawing.Color.Red;
            }
            
            try
            {
                SqlConnection con1 = new SqlConnection(strcon);
                con1.Open();

                SqlDataAdapter sda = new SqlDataAdapter("SELECT [trainname],[source],[destination],[time] FROM traininformation", con1);
                DataTable dtbl = new DataTable();
                sda.Fill(dtbl);
                trainGridView.DataSource = dtbl;
                trainGridView.DataBind();
                con1.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}