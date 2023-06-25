using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rail_BD
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void adminloginid_Click(object sender, EventArgs e)
        {
            String code = admincode.Text.Trim();
            if (code == "admin123")
            {
                Session.Clear();

                // Clear cookie
                if (Request.Cookies["LoggedIn"] != null)
                {
                    HttpCookie cookie = new HttpCookie("LoggedIn");
                    cookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(cookie);
                }
                // Set session variable indicating user is logged in
                Session["AdminLoggedIn"] = true;

                // Create a new cookie
                HttpCookie loginCookie = new HttpCookie("AdminLogin");
                loginCookie.Value = "true";
                loginCookie.Expires = DateTime.Now.AddHours(1); // Set the expiration date to 7 days from now

                // Add the cookie to the response
                Response.Cookies.Add(loginCookie);

                // Redirect to Admin.aspx
                Response.Redirect("Admin.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Admin Key');</script>");
            }
        }
    }
}