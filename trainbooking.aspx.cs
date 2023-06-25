using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rail_BD
{
    public partial class trainbooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string fromStation = Request.QueryString["from"];
                string toStation = Request.QueryString["to"];
                string date = Request.QueryString["date"];
                string classes = Request.QueryString["classes"];
                Label2.Text = fromStation;
                Label4.Text = toStation;
                Label6.Text = date;
                Label8.Text = classes;

            }
        }
    }
}