using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.IO;




namespace Rail_BD
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                signoutLink.Visible = Session["LoggedIn"] != null && (bool)Session["LoggedIn"];
                loginLink.Visible = Session["LoggedIn"] == null || !(bool)Session["LoggedIn"];
                string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
                if (currentPage.Equals("Admin.aspx", StringComparison.InvariantCultureIgnoreCase))
                {
                    // You are on the adminpanel.aspx page
                    // Add your specific code here for the admin panel functionality
                navbarshowid.Visible = false;
                }
               // navbarshowid.Visible= Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"];
                // Check if the sign-out link was clicked
                if (Request.QueryString["signout"] == "true")
                {
                    SignOut();
                }

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