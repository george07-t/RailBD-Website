using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rail_BD
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void search_Click(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"]) {
                String fromstation = fromstationtextbox.Text.Trim();
                String tostation = tostationtextbox.Text.Trim();
                String dates = journeydate.Value;
                String classes = class_id.SelectedValue;
                Response.Redirect("trainbooking.aspx?from=" + fromstation + "&to=" + tostation + "&date=" + dates + "&classes=" + classes);
            }
            else {
                Response.Write("<script>alert('Must Login');</script>");
                Response.Redirect("~/login.aspx");
            }

        }
    }
}