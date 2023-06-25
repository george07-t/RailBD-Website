﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rail_BD
{
    public partial class login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        String encrypwd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void log_Click(object sender, EventArgs e)
        {
            try
            {
                encryption1();
                //create new sqlconnection and connection to database by using connection string from web.config file  
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                // Query to insert
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM signinup WHERE username = @username AND pass = @pass", con);

                cmd.Parameters.AddWithValue("@username", username.Text.Trim());
                cmd.Parameters.AddWithValue("@pass", encrypwd);
                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    // Login successful
                    Response.Write("<script>alert('Login successful');</script>");
                    // Set session variable indicating user is logged in
                    Session["LoggedIn"] = true;

                    // Create a cookie to remember login status
                    HttpCookie cookie = new HttpCookie("LoggedIn");
                    cookie.Value = "true";
                    cookie.Expires = DateTime.Now.AddMinutes(1);
                    //cookie.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(cookie);

                    // Redirect to home page
                    Response.Redirect("~/home.aspx");
                }
                else
                {
                    // Login failed
                    Response.Write("<script>alert('Invalid username or password');</script>");
                   // lblErrorMessage.Text = "Invalid username or password.";
                }

                // Close the connection
                con.Close();
            }
            catch (Exception ex)
            {
                // Error message in alerts
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

        }
        public void encryption1()
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[password.Text.ToString().Length];
            encode = Encoding.UTF8.GetBytes(password.Text);
            strmsg = Convert.ToBase64String(encode);
            encrypwd = strmsg;
        }

    }
}