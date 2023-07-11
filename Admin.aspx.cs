using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
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
            if (!IsPostBack) {
              
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
                Div1.Visible = false;
                Div2.Visible = false;
                deletetrainid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
                updatetrainid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
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


        protected void deleteid_Click(object sender, EventArgs e)
        {
            if (trainnamedelid.Text == "") {
                Response.Write("<script>alert('Enter Train Name');</script>");
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    SqlCommand cmd = new SqlCommand("Delete FROM traininformation WHERE trainname=@trainname", con);

                    cmd.Parameters.AddWithValue("@trainname", trainnamedelid.Text.Trim());
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0) {
                        try {
                            SqlConnection con1 = new SqlConnection(strcon);
                            con1.Open();

                            SqlCommand cmd1 = new SqlCommand("Delete FROM seatbooking WHERE trainname=@trainname", con1);

                            cmd1.Parameters.AddWithValue("@trainname", trainnamedelid.Text.Trim());
                            int rowsAffected1 = cmd1.ExecuteNonQuery();
                            if (rowsAffected1 > 0) { Response.Write("<script>alert('Train Deleted');</script>");
                                trainnamedelid.Text = "";
                            }
                            else { Response.Write("<script>alert('Train Not Deleted');</script>"); }
                            con1.Close();
                        }
                        catch(Exception ex) { Response.Write("<script>alert('Error: " + ex.Message + "');</script>"); }
                    }
                    else
                    {
                        Response.Write("<script>alert('Train Delete error');</script>");
                    }
                    con.Close();

                }
                catch(Exception ex) { Response.Write("<script>alert('Error: " + ex.Message + "');</script>"); }
                
            }
        }

        protected void deletetrainid_Click1(object sender, EventArgs e)
        {
            if (Div1.Visible == true)
            {
                Div1.Visible = false;
                deletetrainid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
            }
            else if (Div1.Visible == false)
            {
                Div1.Visible = true;
                Div2.Visible = false;
                adddatashow.Visible = false;
                addtrainshowid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
                updatetrainid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
                deletetrainid.BackColor = System.Drawing.Color.Red;
                Label1.Visible = true;
                trainnamedelid.Visible = true;
                deleteid.Visible = true;
            }
        }

        protected void updatetrainid_Click(object sender, EventArgs e)
        {
            if (Div2.Visible == true)
            {
                Div2.Visible = false;
                updatetrainid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
            }
            else if (Div2.Visible == false)
            {
                Div2.Visible = true;
                Div1.Visible = false;
              
                adddatashow.Visible = false;
                addtrainshowid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
                deletetrainid.BackColor = System.Drawing.Color.FromArgb(0, 103, 71);
                updatetrainid.BackColor = System.Drawing.Color.Red;
                Label6.Visible= true;
               
                Label3.Visible = true;
                Label4.Visible = true;
                Label5.Visible = true;
                trainnameidtodel.Visible = true;
               
                TextBox3.Visible = true;
                TextBox2.Visible = true;
                TextBox4.Visible = true;
                update.Visible = true;

            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string oldTrain = trainnameidtodel.Text.Trim();
     
            string newSource = TextBox2.Text.Trim();
            string newDestination = TextBox3.Text.Trim();
            string newTime = TextBox4.Text.Trim();

            string query = "SELECT [trainname], [source], [destination], [time] FROM [traininformation] WHERE [trainname] = @trainName";

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@trainName", oldTrain);

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string trainName = reader["trainname"].ToString();
                            string source = reader["source"].ToString();
                            string destination = reader["destination"].ToString();
                            string time = reader["time"].ToString();

                           
                            string nSource = string.IsNullOrEmpty(newSource) ? source : newSource;
                            string nDestination = string.IsNullOrEmpty(newDestination) ? destination : newDestination;
                            string nTime = string.IsNullOrEmpty(newTime) ? time : newTime;

                            string query2 = "UPDATE [traininformation] SET [source] = @newSource, [destination] = @newDestination, [time] = @newTime WHERE [trainname] = @oldTrainName; ";

                            try
                            {
                                using (SqlConnection connection2 = new SqlConnection(strcon))
                                {
                                    using (SqlCommand command2 = new SqlCommand(query2, connection2))
                                    {
                                       
                                        command2.Parameters.AddWithValue("@newSource", nSource);
                                        command2.Parameters.AddWithValue("@newDestination", nDestination);
                                        command2.Parameters.AddWithValue("@newTime", nTime);
                                        command2.Parameters.AddWithValue("@oldTrainName", oldTrain);

                                        connection2.Open();
                                        int rowsAffected2 = command2.ExecuteNonQuery();

                                        if (rowsAffected2 > 0)
                                        {
                                          
                                            string queryUpdateSeatBooking = "UPDATE [seatbooking] SET [fromto]=@fromto ,[time] = @newTime WHERE [trainname] = @oldTrainName";

                                            try
                                            {
                                                using (SqlConnection connection3 = new SqlConnection(strcon))
                                                {
                                                    using (SqlCommand command3 = new SqlCommand(queryUpdateSeatBooking, connection3))
                                                    {
                                                        command3.Parameters.AddWithValue("@fromto", nSource+nDestination);
                                                        command3.Parameters.AddWithValue("@newTime", nTime);
                                                        command3.Parameters.AddWithValue("@oldTrainName", oldTrain);

                                                        connection3.Open();
                                                        int rowsAffected3 = command3.ExecuteNonQuery();

                                                        if (rowsAffected3 > 0)
                                                        {
                                                          Response.Write("<script>alert('Train information updated successfully.');</script>");}
                                                        else
                                                        {
                                                            Response.Write("<script>alert('Train not found or no changes made in the seat booking information.');</script>");
                                                        }
                                                    }
                                                }
                                            }
                                            catch (Exception ex)
                                            {
                                                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                                            }
                                        }
                                        else
                                        {
                                            Response.Write("<script>alert('Train not found or no changes made.');</script>");
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                            }

                        }
                        else
                        {
                            Response.Write("<script>alert('Not Found');</script>");
                        }
                    }
                }
            }

        }
    }
}