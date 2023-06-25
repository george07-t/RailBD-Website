<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="Rail_BD.contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Us|Rail.BD</title>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <section class="nidverify">
        <h1>Contact Us</h1>
        <hr style="margin-left: 20px; margin-right: 20px;">
    </section>
    <section class="contacts">
        <div style="width: 500px; margin: 0 auto; background-color: #fcfcfc; border-radius: 10p;">
            <p style="color: #595757; padding: 10px;">
                For refund of unsuccessful purchases and card<br>
                charging issues
            </p>
            <hr style="color: #a6a6a6;">
            <p style="font-size: 30px; font-weight: bold;">
                bKash <span
                    style="margin-left: 300px; color: #da924e;">16247</span>
            </p>
            <hr style="color: #a6a6a6;">
            <p style="font-size: 30px; font-weight: bold;">
                Nagad <span
                    style="margin-left: 300px; color: #da924e;">16247</span>
            </p>
            <hr style="color: #a6a6a6;">
            <p style="font-size: 30px; font-weight: bold;">
                Rocket / DBBL Nexus <span
                    style="margin-left: 100px; color: #da924e;">16247</span>
            </p>
            <hr style="color: #a6a6a6;">
            <p style="font-size: 30px; font-weight: bold;">
                Visa / Mastercard <span
                    style="margin-left: 150px; color: #da924e;">16247</span>
            </p>
        </div>
        <div style="width: 500px; margin: 0 auto; background-color: #fcfcfc; border-radius: 10px; text-align: left;">
            <p style="color: #595757; margin-left: 10px; padding: 10px;">
                Reach out to our support team to report identity
                theft!
            </p>

            <p style="margin-left: 10px;">
                If any user has registered with someone else's NID using his/her mobile
                <br>
                number, the real/actual NID
                holder can claim the identity by following the
                <br>
                mentioned steps below :-
            </p>
            <p style="font-weight: bold; margin-left: 10px;">
                Send Email to:<span
                    style="color: #da924e;">support@eticket.railway.gov.bd</span>
            </p>
            <hr style="color: #a6a6a6;">
            <p style="color: #a6a6a6; margin-left: 10px;">Must attach the following documents with the email:</p>
            <ol style="font-size: 15px;">
                <li>A scanned copy of the ownership document for the SIM (mobile number)</li>
                <li>A scanned copy of the NID card</li>
            </ol>
        </div>
        <div
            style="width: 500px; margin-left: 10px; margin: 0 auto; background-color: #fcfcfc; border-radius: 10px; text-align: left;">
            <p style="color: #595757; padding: 10px;">Refund and Cancellation</p>
            <hr style="color: #a6a6a6;">
            <h2>Visit your originating station (departure station) and contact refund counter </h2>
            <a href="#" style="font-size: 25px; font-weight: bold; color: #da924e;">REFUND POLICY</a>
       
        </div>
        <div
            style="width: 500px; margin-left: 10px; margin: 0 auto; background-color: #fcfcfc; border-radius: 10px; text-align: left;">
            <p style="color: #595757; padding: 10px;">For Technical Support </p>
            <hr style="color: #a6a6a6;">
            <h4 style="margin-left: 10px;">Tech Support Team <span style="margin-left: 90px; color: #da924e;">support@eticket.railway.gov.bd</span></h4>
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
