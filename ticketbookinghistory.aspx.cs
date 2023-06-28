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

namespace Rail_BD
{
    public partial class ticketbookinghistory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string usernameid = Session["username"].ToString();
                    SqlConnection con1 = new SqlConnection(strcon);
                    con1.Open();

                    SqlDataAdapter sda = new SqlDataAdapter("SELECT [ticketnumber],[fromto],[date],[time],[class],[seatno],[fare] FROM seatbooking Where username=@username", con1);
                    sda.SelectCommand.Parameters.AddWithValue("@username",usernameid);
                    DataTable dtbl = new DataTable();
                    sda.Fill(dtbl);
                    tickethistory.DataSource = dtbl;
                    tickethistory.DataBind();
                    if (dtbl.Rows.Count == 0)
                    {
                        Label3.Text = "No train available";
                        Label3.Visible = true;
                    }
                    else
                    {
                        Label3.Visible = false;
                    }
                    con1.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }

        }
        protected void tickethistory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "print")
            {
                Response.Write("<script>alert('wait');</script>");

            }
        }
    }
}