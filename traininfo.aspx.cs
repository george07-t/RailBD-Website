using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Rail_BD
{
    public partial class traininfo : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                trainhave.Visible = false;
            }
        }

        protected void srcterain_Click(object sender, EventArgs e)
        {
           string trainname= search.Text.Trim();
            if (string.IsNullOrEmpty(trainname))
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Enter the train name";
            }
            else
            {
                Label1.Visible = false;
                notrain.Visible = false;
                trainhave.Visible = true;
                Label11.Visible = false;
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    SqlDataAdapter sda = new SqlDataAdapter("SELECT [trainname],[source],[destination],[time] FROM traininformation WHERE trainname = @trainname", con);
                    sda.SelectCommand.Parameters.AddWithValue("@trainname", trainname);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        Label8.Text = dt.Rows[0]["trainname"].ToString();
                        Label3.Text = dt.Rows[0]["trainname"].ToString();
                        Label5.Text = dt.Rows[0]["source"].ToString();
                        Label7.Text = dt.Rows[0]["destination"].ToString();
                        Label10.Text = dt.Rows[0]["time"].ToString();
                    }
                    else {
                        
                        trainhave.Visible= false;
                        Label11.Visible = true;
                        Label11.ForeColor = System.Drawing.Color.Red;
                        Label11.Text = "No Such Train Available";
                    }

                    con.Close();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}