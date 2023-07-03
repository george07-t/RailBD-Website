using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;

namespace Rail_BD
{
    public partial class afterpurchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["username"] != null)
                {
                    string username = Request.QueryString["username"];
                    usernameLabel.Text = username;
                }

                if (Request.QueryString["seatbookno"] != null)
                {
                    string seatbookno = Request.QueryString["seatbookno"];
                    seatNoLabel.Text = seatbookno;
                }

                if (Request.QueryString["trainnamefor"] != null)
                {
                    string trainnamefor = Request.QueryString["trainnamefor"];
                    trainNameLabel.Text = trainnamefor;
                }

                if (Request.QueryString["fromtoshow"] != null)
                {
                    string fromtoshow = Request.QueryString["fromtoshow"];
                    fromtoLabel.Text = fromtoshow;
                }

                if (Request.QueryString["timesshow"] != null)
                {
                    string timesshow = Request.QueryString["timesshow"];
                    timeLabel.Text = timesshow;
                }

                if (Request.QueryString["dateid"] != null)
                {
                    string dateid = Request.QueryString["dateid"];
                    journeyDateLabel.Text = dateid;
                }

                if (Request.QueryString["classshow"] != null)
                {
                    string classshow = Request.QueryString["classshow"];
                    classLabel.Text = classshow;
                }

                if (Request.QueryString["fares"] != null)
                {
                    string fares = Request.QueryString["fares"];
                    fareLabel.Text = fares+" BDT";
                }

                if (Request.QueryString["ticketsNumber"] != null)
                {
                    string ticketsNumber = Request.QueryString["ticketsNumber"];
                    ticketNumberLabel.Text = ticketsNumber;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
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
            Response.Redirect("~/home.aspx");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}