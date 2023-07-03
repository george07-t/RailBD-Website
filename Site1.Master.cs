using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Rail_BD
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                if(Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    showdropdownloaditem();
                }
                dropdownid.Visible = Session["LoggedIn"] != null && (bool)Session["LoggedIn"];
                loginLink.Visible = Session["LoggedIn"] == null || !(bool)Session["LoggedIn"];
                verifticketlink.Visible = Session["LoggedIn"] != null && (bool)Session["LoggedIn"];
                registerlink.Visible = Session["LoggedIn"] == null || !(bool)Session["LoggedIn"];
                string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
                if (currentPage.Equals("Admin.aspx", StringComparison.InvariantCultureIgnoreCase))
                {
                navbarshowid.Visible = false;
                }
                if (Request.QueryString["signout"] == "true")
                {
                    SignOut();
                }

            }
        }

        private void showdropdownloaditem()
        {
            string usernameid = Session["username"].ToString();
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                SqlDataAdapter sda = new SqlDataAdapter("SELECT [name], [mobile] FROM signinup WHERE username = @username", con);
                sda.SelectCommand.Parameters.AddWithValue("@username", usernameid);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    usernameLabel.Text = dt.Rows[0]["name"].ToString();
                    usernameDropdownLabel.Text = dt.Rows[0]["name"].ToString();
                    mobileDropdownLabel.Text = dt.Rows[0]["mobile"].ToString();
                }

                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

        }

        protected void SignOut()
        {
            Session.Clear();

            // Clear cookie
            if (Request.Cookies["LoggedIn"] != null)
            {
                HttpCookie cookie = new HttpCookie("LoggedIn");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }

            // Redirect to login page
            Response.Redirect("login.aspx");
        }
    }
}