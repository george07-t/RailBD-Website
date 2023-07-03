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
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net;
using System.Reflection.Emit;

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
            string email = emailtextbox.Text;
            bool isValidEmail;
            try
            {
                var mailAddress = new MailAddress(email);
                isValidEmail = true;
            }
            catch (FormatException)
            {
                isValidEmail = false;
            }

            if (isValidEmail==false)
            {
                Response.Write("<script>alert('Enter a valid email');</script>");
            }
            else
            {


                try
                {
                    encryption1();
                    Console.WriteLine("inside try");
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO signinup ([username],[mobile],[pass],[name],[email]) VALUES(@username, @mobile, @pass,@name,@email)", con);

                    cmd.Parameters.AddWithValue("@username", usernametextbox.Text.Trim());
                    cmd.Parameters.AddWithValue("@mobile", mobiletextbox.Text.Trim());
                    cmd.Parameters.AddWithValue("@pass", encrypwd);
                    cmd.Parameters.AddWithValue("@name", nametextbox.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", emailtextbox.Text.Trim());


                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
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

                            sendemail();
                            Response.Redirect("login.aspx");
                        }
                        else
                        {
                            sendemail();
                            Response.Redirect("login.aspx");
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('User Not Created!');</script>");
                    }
                    con.Close();


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error1: " + ex.Message + "');</script>");
                }
            }
        }

        private void sendemail()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("k19roy@gmail.com", "gttmowoyzjhoqirv");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Hello " + nametextbox.Text + "  Thanks for Register at Rail.BD";
            msg.Body = "Hi, Thanks For Your Registration at Rail.BD, We will Provide You The Latest Update of Train. Thanks";
            string toaddress = emailtextbox.Text;
            msg.To.Add(toaddress);
            string fromaddress = "Rail.BD <k19roy@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);

            }
            catch
            {
                throw;
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