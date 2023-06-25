﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="traininfo.aspx.cs" Inherits="Rail_BD.traininfo" %>

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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <section class="nidverify">
        <h1>Train Information</h1>
        <hr style="margin-left: 20px; margin-right: 20px;">
    </section>
    <section>
        <div style="display: flex; height: 400px;">
            <div style="width: 50%; margin-left: 40px; background-color: beige; margin-right: 5px;">
                <div class="traininfo">
                    <label for="search">Select Your Preferred Train</label>
                    <asp:TextBox ID="search" CssClass="form-control" runat="server" Required="true" Width="357px"></asp:TextBox>


                </div>
                <div class="verifys">
                    <asp:Button CssClass="m-4 btn btn-block btn-info text-white mx-auto custom-button" ID="srcterain" runat="server" Text="Search Train" Width="224px" />
                </div>

            </div>
            <div style="text-align: center; width: 50%; background-color: beige; margin-right: 15px; margin-left: 5px;">
                <img src="images\train-information-illustration.svg">
                <br>
                <p>
                    Please select your preferred train to see the
                    <br>
                    detailed information of your selected train.
                </p>
            </div>
        </div>

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
