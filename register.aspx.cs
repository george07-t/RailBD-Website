using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rail_BD
{
    public partial class register : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        String encrypwd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup_Click(object sender, EventArgs e)
        {
            Console.WriteLine("button clicked");
            try
            {
                encryption1();
                Console.WriteLine("inside try");
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO signinup ([username],[mobile],[pass]) VALUES(@username, @mobile, @pass)", con);

                cmd.Parameters.AddWithValue("@username", usernametextbox.Text.Trim());
                cmd.Parameters.AddWithValue("@mobile", mobiletextbox.Text.Trim());
                cmd.Parameters.AddWithValue("@pass", encrypwd);

                cmd.ExecuteNonQuery();

                Console.WriteLine("qeuery exec");


                con.Close();
                if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    Session.Clear();

                    // Clear cookie
                    if (Request.Cookies["LoginStatus"] != null)
                    {
                        HttpCookie cookie = new HttpCookie("LoginStatus");
                        cookie.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(cookie);
                    }

                    // Redirect to login page
                    Response.Redirect("login.aspx");
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
               // Response.Redirect("~/login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        public void encryption1()
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[passwordtextbox.Text.ToString().Length];
            encode = Encoding.UTF8.GetBytes(passwordtextbox.Text);
            strmsg = Convert.ToBase64String(encode);
            encrypwd = strmsg;
        }


    }
}