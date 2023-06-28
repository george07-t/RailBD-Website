<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Verifyticket.aspx.cs" Inherits="Rail_BD.Verifyticket" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contacts {
            text-align: center;
        }

        .nidverify {
            padding-top: 50px;
            margin-left: 20px;
        }

            .nidverify h1 {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 20px;
            }

        .copy-right {
            background-color: rgba(0, 103, 71, 255);
            padding: 20px 0;
            color: #fff;
        }

            .copy-right p {
                margin: 0;
                font-size: 14px;
                text-align: center;
            }

        .container {
            text-align: center;
        }

        .terms {
            display: flex;
            justify-content: center;
        }

        .traininfo input[type="text"] {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid black;
            font-size: 18px;
            border-radius: 4px;
            box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
        }

        .traininfo {
            display: inline-block;
            padding: 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

            .traininfo label {
                font-weight: bold;
                font-size: 24px;
            }

        .center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .traininfo, .verifys {
            text-align: left;
        }

        .mx-auto {
        }

        .custom-button {
            background-color: rgba(0, 103, 71, 255);
        }

        .label {
            font-weight: bold;
            font-size: 16px;
            color: #333333;
        }
        .panelview{
            padding:20px;
            margin-bottom:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <section class="nidverify">
        <h1>Verify Tickets</h1>
        <hr style="margin-left: 20px; margin-right: 20px;">
    </section>
    <section>
        <div style="display: flex; height: 400px;">
            <div style="width: 50%; margin-left: 40px; background-color: beige; margin-right: 5px;">
                <div class="traininfo">
                    <label for="search">Enter Your Ticket Number</label>
                    <asp:TextBox ID="searchticket" CssClass="form-control" runat="server" Required="true" Width="357px"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>

                </div>
                <div class="verifys">
                    <asp:Button CssClass="m-4 btn btn-block btn-info text-white mx-auto custom-button" ID="srcticket" runat="server" Text="Search Ticket" Width="224px" OnClick="srcticket_Click" />
                </div>

            </div>
            <div style="text-align: center; width: 50%; background-color: beige; margin-right: 15px; margin-left: 5px;">
                <div id="notrain" runat="server">
                    <img src="images\detail.png">
                    <br>
                    <p>
                        Please enter your ticket number for geting the
                    <br>
                        detailed information of your ticket and download them.
                    </p>
                </div>
                <asp:Label ID="Label11" runat="server" Text="Label" Visible="false"></asp:Label>
                <div id="trainhave" runat="server" style="text-align: left; padding: 30px;">
                    <img src="images/ticket.png" width="50" height="50" />

                    <br />
                    <asp:Label ID="Label21" runat="server" Text="Label" ForeColor="#009933" Font-Bold="true" Font-Size="30px"></asp:Label>

                    <br />
                    <asp:Panel ID="Panel1" runat="server" CssClass="panelview" Height="361px">
                        <h3><strong>Ticket Invoice</strong></h3>
                        <asp:Label ID="Label2" runat="server" Text="Ticket Number: " CssClass="label" TextAlign="Left"></asp:Label>
                        <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label16" runat="server" Text="Train Name: " CssClass="label" TextAlign="Left"></asp:Label>
                        <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Source-Destination: " CssClass="label" TextAlign="Left"></asp:Label>
                        <asp:Label ID="Label24" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Date: " CssClass="label" TextAlign="Left"></asp:Label>
                        <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="Time: " CssClass="label" TextAlign="Left"></asp:Label>
                        <asp:Label ID="Label26" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label14" runat="server" Text="Class: " CssClass="label" TextAlign="Left"></asp:Label>
                        <asp:Label ID="Label27" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label12" runat="server" Text="Seat Number: " CssClass="label" TextAlign="Left"></asp:Label>
                        <asp:Label ID="Label28" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Fare: " CssClass="label" TextAlign="Left"></asp:Label>
                        <asp:Label ID="Label29" runat="server" Text="500 BDT"></asp:Label>
                           <asp:Button CssClass="m-4 btn btn-block btn-info text-white mx-auto custom-button" Width="180px" ID="downloadbuttonid" runat="server" Text="Download" OnClick="downloadbuttonid_Click" />
                
                    </asp:Panel>
                </div>




            </div>
        </div>
        <br />
        <<br />
    </section>
    <footer>
        <div class="copy-right">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p style="color: white; margin-bottom: 5px;">
                            &copy; 2023 Bangladesh Railway. All rights
                            reserved.
                        </p>
                        <div class="terms">
                            <a href="https://eticket.railway.gov.bd/terms-and-conditions" target="_blank"
                                style="color: white; margin-right: 10px; text-decoration: none;">Terms and Conditions
                            </a>
                            <p style="color: white;">| </p>
                            <a href="https://eticket.railway.gov.bd/privacy-policy" target="_blank"
                                style="color: white; margin-left: 10px; text-decoration: none;">Privacy Policy </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </footer>
</asp:Content>
