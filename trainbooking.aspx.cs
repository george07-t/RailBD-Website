using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;
using Label = System.Web.UI.WebControls.Label;

namespace Rail_BD
{
    public partial class trainbooking : System.Web.UI.Page
    {
        static int seatbookno = -1;
        private static string trainnamefor;
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        public string date, classes;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                seatbookingid.Visible = false;
                seatshowid.Visible = false;
                string fromStation = Request.QueryString["from"];
                string toStation = Request.QueryString["to"];
                 date = Request.QueryString["date"];
                classes = Request.QueryString["classes"];
                Label2.Text = fromStation+"-"+toStation;
                Label6.Text = date;
                Label8.Text = classes;
                dateshowid.Text = date;
                try {
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    SqlDataAdapter sda = new SqlDataAdapter("SELECT [trainname], [source], [destination], [time] FROM traininformation WHERE source=@source AND destination=@destination ", con);
                    sda.SelectCommand.Parameters.AddWithValue("@source", fromStation);
                    sda.SelectCommand.Parameters.AddWithValue("@destination", toStation);
                    DataTable dtbl = new DataTable();
                    sda.Fill(dtbl);

                    availabletrainshowid.DataSource = dtbl;
                    availabletrainshowid.DataBind();


                    if (dtbl.Rows.Count == 0)
                    {
                        Label3.Text = "No train available";
                        Label3.Visible = true;
                    }
                    else
                    {
                        Label3.Visible = false;
                    }
                    // Close the connection
                    con.Close();
                }
                catch(Exception ex) {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            
            }
        }

        /*private void seatstatus()
        {string dateid = Request.QueryString["date"];

            string trainseatdateid = trainnamefor + " " + dateid;
            
            try {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                // Query to insert
                SqlCommand cmd = new SqlCommand("SELECT * FROM seatbooking WHERE trainseatdate = @trainseatdate", con);
                cmd.Parameters.AddWithValue("@trainseatdate", trainseatdateid);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                int rows = ds.Tables[0].Rows.Count;
                int i = 0;
                while(i<rows)
                {
                    string status;
                    status = ds.Tables[0].Rows[i]["status"].ToString();
                    if (status == null)
                    {
                        if(i==0 && seatbookno-1 != i)
                        {
                            Button1.BackColor = System.Drawing.Color.Gray;
                        }
                        if (i == 1 && seatbookno - 1 != i)
                        {
                            Button2.BackColor = System.Drawing.Color.Gray;
                        }
                        if (i == 2 && seatbookno - 1 != i)
                        {
                            Button3.BackColor = System.Drawing.Color.Gray;
                        }
                        if (i == 3 && seatbookno - 1 != i)
                        {
                            Button4.BackColor = System.Drawing.Color.Gray;
                        }
                        if (i == 4 && seatbookno - 1 != i)
                        {
                            Button8.BackColor = System.Drawing.Color.Gray;
                        }
                        if (i == 5 && seatbookno - 1 != i)
                        {
                            Button7.BackColor = System.Drawing.Color.Gray;
                        }
                        if (i == 6 && seatbookno - 1 != i)
                        {
                            Button5.BackColor = System.Drawing.Color.Gray;
                        }
                        if (i == 7 && seatbookno - 1 != i)
                        {
                            Button6.BackColor = System.Drawing.Color.Gray;
                        }
                        if (i == 8 && seatbookno - 1 != i)
                        {
                            Button9.BackColor = System.Drawing.Color.Gray;
                        }
                        if (i == 9 && seatbookno - 1 != i)
                        {
                            Button10.BackColor = System.Drawing.Color.Gray;
                        }
                    }
                    if (status == "B")
                    {
                            if(i== 0)
                        {
                            Button1.BackColor = System.Drawing.Color.Red;
                            Button1.Enabled = false;
                        }
                        if (i == 1)
                        {
                            Button2.BackColor = System.Drawing.Color.Red;
                            Button2.Enabled = false;
                        }
                        if (i == 2)
                        {
                            Button3.BackColor = System.Drawing.Color.Red;
                            Button3.Enabled = false;
                        }
                        if (i == 3)
                        {
                            Button4.BackColor = System.Drawing.Color.Red;
                            Button4.Enabled = false;
                        }
                        if (i == 4)
                        {
                            Button8.BackColor = System.Drawing.Color.Red;
                            Button8.Enabled = false;
                        }
                        if (i == 5)
                        {
                            Button7.BackColor = System.Drawing.Color.Red;
                            Button7.Enabled = false;
                        }
                        if (i == 6)
                        {
                            Button5.BackColor = System.Drawing.Color.Red;
                            Button5.Enabled = false;
                        }
                        if (i == 7)
                        {
                            Button6.BackColor = System.Drawing.Color.Red;
                            Button6.Enabled = false;
                        }
                        if (i == 8)
                        {
                            Button9.BackColor = System.Drawing.Color.Red;
                            Button9.Enabled = false;
                        }
                        if (i == 9)
                        {
                            Button10.BackColor = System.Drawing.Color.Red;
                            Button10.Enabled = false;
                        }
                    }
                    i=i+1;

                }

            }
            catch (Exception ex) { Response.Write("<script>alert('Error2: " + ex.Message + "');</script>"); }
        }*/

        protected void confirmbuttonid_Click(object sender, EventArgs e)
        {
            try {
                
                string dateid = Request.QueryString["date"];
                string trainseatdateid = trainnamefor + dateid+ classlabelid.Text;
                string username = Session["username"].ToString();
                int fares = 500;
                string timesshow = timeshowid.Text;
                string classshow = classlabelid.Text;
                string fromtoshow= fromtoid.Text;
                Random random = new Random();
                int ticketsNumber = random.Next(10000, 100000);
                SqlConnection con = new SqlConnection(strcon);
                con.Open();


                // Query to insert
                SqlCommand cmd = new SqlCommand("INSERT INTO seatbooking([username],[trainseatdate],[seatno],[searstatus],[trainname],[fromto],[time],[date],[class],[fare],[ticketnumber]) VALUES(@username,@trainseatdate,@seatno,@searstatus,@trainname,@fromto,@time,@date,@class,@fare,@ticketnumber)", con);
                cmd.Parameters.AddWithValue("@trainseatdate", trainseatdateid);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@seatno", seatbookno);
                cmd.Parameters.AddWithValue("@searstatus", "B");
                cmd.Parameters.AddWithValue("@trainname", trainnamefor);
                cmd.Parameters.AddWithValue("@fromto", fromtoshow);
                cmd.Parameters.AddWithValue("@time", timesshow);
                cmd.Parameters.AddWithValue("@date", dateid);
                cmd.Parameters.AddWithValue("@class", classshow);
                cmd.Parameters.AddWithValue("@fare", fares);
                cmd.Parameters.AddWithValue("@ticketnumber", ticketsNumber);
                int rowsAffected = cmd.ExecuteNonQuery();
                con.Close();

                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('Seat booked');</script>");
                    string url = "afterpurchase.aspx";
                    url += "?username=" + HttpUtility.UrlEncode(username);
                    url += "&seatbookno=" + HttpUtility.UrlEncode(seatbookno.ToString());
                    url += "&trainnamefor=" + HttpUtility.UrlEncode(trainnamefor);
                    url += "&fromtoshow=" + HttpUtility.UrlEncode(fromtoshow);
                    url += "&timesshow=" + HttpUtility.UrlEncode(timesshow);
                    url += "&dateid=" + HttpUtility.UrlEncode(dateid);
                    url += "&classshow=" + HttpUtility.UrlEncode(classshow);
                    url += "&fares=" + HttpUtility.UrlEncode(fares.ToString());
                    url += "&ticketsNumber=" + HttpUtility.UrlEncode(ticketsNumber.ToString());

                    Response.Redirect(url);
                }
                else
                {
                    Response.Write("<script>alert('Failed to book the seat');</script>");
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error1: " + ex.Message + "');</script>");
            }
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 1; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "1";
            }

            UpdatePanel1.Update(); // Update the contents inside the UpdatePanel
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 2; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "2";
            }

            UpdatePanel2.Update();
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 3; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "3";
            }

            UpdatePanel3.Update();
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 4; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "4";
            }

            UpdatePanel4.Update();
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 5; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "5";
            }

            UpdatePanel5.Update();
        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 6; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "6";
            }

            UpdatePanel6.Update();
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 7; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "7";
            }

            UpdatePanel7.Update();
        }

        protected void Button17_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 8; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "8";
            }

            UpdatePanel8.Update();
        }

        protected void Button18_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 9; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "9";
            }

            UpdatePanel9.Update();
        }

        protected void Button19_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            if (button.BackColor == System.Drawing.Color.Green)
            {
                button.BackColor = System.Drawing.Color.Gray;
                seatbookno = -1; // Reset seatbookno to indicate no selection
            }
            else
            {
                button.BackColor = System.Drawing.Color.Green;
                seatbookno = 10; // Set seatbookno to indicate the selected seat
                seatslabelid.Text = "10";
            }

            UpdatePanel10.Update();
        }

        protected void availabletrainshowid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "book")
            {
                
                seatbookingid.Visible = true;
                seatshowid.Visible = true;
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = availabletrainshowid.Rows[rowIndex];

                // Get the values from the cells in the GridView row
                string trainName = row.Cells[0].Text; // Assuming trainname is the first column
                string source = row.Cells[1].Text; // Assuming source is the second column
                string destination = row.Cells[2].Text; // Assuming destination is the third column
                string time = row.Cells[3].Text; // Assuming time is the fourth column
                trainnamefor=trainName;
                // Use the retrieved data as needed
                trainnameid.Text = trainName;
                fromtoid.Text = source + "-" + destination;
                timeshowid.Text = time;
                dateshowid.Visible=true;
                dateshowid.Text = Request.QueryString["date"]; ;
                classlabelid.Text = Request.QueryString["classes"]; ;
            
            }
        }



    }
}