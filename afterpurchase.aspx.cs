using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

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
            DownloadInvoiceAsPDF();
        }

        [Obsolete]
        protected void DownloadInvoiceAsPDF()
        {
            using (MemoryStream ms = new MemoryStream())
            {
                Document document = new Document();
                PdfWriter writer = PdfWriter.GetInstance(document, ms);
                document.Open();

                // Create a HTMLWorker to render the panel content
                using (StringWriter sw = new StringWriter())
                {
                    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                    {
                        invoicePanel.RenderControl(hw);
                        StringReader sr = new StringReader(sw.ToString());

                        // Parse the HTML and generate the PDF document
                        HTMLWorker htmlParser = new HTMLWorker(document);
                        htmlParser.Parse(sr);
                    }
                }

                document.Close();

                // Set the response headers to force download the PDF file
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=invoice.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(ms.ToArray());
                Response.End();
            }
        }
    }
}