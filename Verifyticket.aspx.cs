﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;

namespace Rail_BD
{
    public partial class Verifyticket : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                trainhave.Visible = false;
            }
        }

        protected void srcticket_Click(object sender, EventArgs e)
        {
            string ticketnumberid = searchticket.Text.Trim();
            if (string.IsNullOrEmpty(ticketnumberid))
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Enter the ticket number";
            }
            else
            {int ticketnumberget=int.Parse(ticketnumberid);
                Label1.Visible = false;
                notrain.Visible = false;
                trainhave.Visible = true;
                Label11.Visible = false;
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    SqlDataAdapter sda = new SqlDataAdapter("SELECT [ticketnumber],[trainname],[fromto],[date],[time],[class],[seatno] FROM seatbooking WHERE ticketnumber = @ticketnumber", con);
                    sda.SelectCommand.Parameters.AddWithValue("@ticketnumber", ticketnumberget);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        Label21.Text = dt.Rows[0]["ticketnumber"].ToString();
                        Label22.Text = dt.Rows[0]["ticketnumber"].ToString();
                        Label23.Text = dt.Rows[0]["trainname"].ToString();
                        Label24.Text = dt.Rows[0]["fromto"].ToString();
                        Label25.Text = dt.Rows[0]["date"].ToString();
                        Label26.Text = dt.Rows[0]["time"].ToString();
                        Label27.Text = dt.Rows[0]["class"].ToString();
                        Label28.Text = dt.Rows[0]["seatno"].ToString();

                    }
                    else
                    {

                        trainhave.Visible = false;
                        Label11.Visible = true;
                        Label11.ForeColor = System.Drawing.Color.Red;
                        Label11.Text = "No Such Ticket Available";
                    }

                    con.Close();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        protected void downloadbuttonid_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=TicketInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
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
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}