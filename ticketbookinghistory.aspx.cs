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
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;

namespace Rail_BD
{
    public partial class ticketbookinghistory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                invoicePanel.Visible = false;
                try
                {
                    string usernameid = Session["name"].ToString();
                    SqlConnection con1 = new SqlConnection(strcon);
                    con1.Open();

                    SqlDataAdapter sda = new SqlDataAdapter("SELECT [ticketnumber],[trainname],[fromto],[date],[time],[class],[seatno],[fare] FROM seatbooking Where username=@username", con1);
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
              
                invoicePanel.Visible = true;
                usernameLabel.Text= Session["name"].ToString();
                fareLabel.Text = "500 BDT";
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = tickethistory.Rows[rowIndex];
                string ticketnumber = row.Cells[0].Text;
                string trainnames= row.Cells[1].Text;
                string fromto = row.Cells[2].Text; 
                string date = row.Cells[3].Text; 
                string time = row.Cells[4].Text;
                string classes = row.Cells[5].Text;
                string seatno = row.Cells[6].Text;
                ticketNumberLabel.Text = ticketnumber;
                fromtoLabel.Text = fromto;
                journeyDateLabel.Text = date;
                timeLabel.Text = time;
                classLabel.Text = classes;
                seatNoLabel.Text = seatno;
                trainNameLabel.Text = trainnames;
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=TicketInvoice.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                invoicePanel.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());
                Document pdfDoc = new Document(PageSize.A4, 10, 10, 0, 0);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.Write(pdfDoc);
                Response.End();

            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}