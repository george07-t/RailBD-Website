<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Rail_BD.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register|Rail.BD</title>
    <style>
        main {
            flex: 1;
        }

        .btn-primary {
            background-color: rgba(0, 103, 71, 255);
        }

        .nidverify {
            padding-top: 100px;
            margin-left: 20px;
        }

            .nidverify h1 {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 20px;
            }

            .nidverify p {
                text-align: center;
                color: #a6a6a6;
            }

            .nidverify img {
                display: block;
                margin: auto;
                margin-top: 30px;
            }

        .reg {
            text-align: center;
        }

        .center {
            top: 50%;
            left: 50%;
            border-radius: 10px;
            width: 400px;
            margin: 0 auto;
        }

        form {
            padding: 0 40px;
            box-sizing: border-box;
        }

            form .text_field {
                position: relative;
                border-bottom: 2px solid #006747;
                margin: 30px 0;
            }

        .text_field input {
            width: 100%;
            padding: 0 5px;
            height: 40px;
            font-size: 16px;
            border: none;
            background: none;
            outline: none;
        }

        .text_field label {
            position: absolute;
            top: -10px;
            left: 5px;
            color: #adadad;
            transform: rotateY(-50%);
            font-size: 16px;
            pointer-events: none;
            transition: .5s;
        }

        .text_field span::before {
            content: '';
            position: absolute;
            top: 40px;
            left: 0;
            width: 0%;
            height: 2px;
            background: #2691d9;
            transition: .5s;
        }

        .text_field input:focus ~ label,
        .text_field input:valid ~ label {
            top: -25px;
            color: #006747;
        }

        .text_fieldinput:focus ~ span ::before,
        .text_fieldinput:valid ~ span ::before {
            width: 100%;
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
        .custom-button {
    background-color: rgba(0, 103, 71, 255);
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

        <section class="nidverify">
            <h1>Registration</h1>
            <hr style="margin-left: 20px; margin-right: 20px;">
            <img src="images/verify-nid-illustration.svg" alt="nid verify" style="width: 200px; height: 200px;">
            <h2 style="color: #a6a6a6; text-align: center;">Please Verify Your Signup</h2>
            <p>
                Enter the information below to verify and register
                <hr style="width: 423px" />
            </p>
        </section>
        <section class="reg">
            <div class="center">
                <form method="post">

                  <div class="text_field">
                        <asp:TextBox ID="usernametextbox" CssClass="form-control" runat="server" Required="true"></asp:TextBox>
                        <span></span>
                        <label>Enter a Username</label>
                    </div>
                    <div class="text_field">
                        <asp:TextBox ID="mobiletextbox" CssClass="form-control" runat="server" Required="true"></asp:TextBox>
                        <span></span>
                        <label>Enter your mobile number </label>
                    </div>

                    <div class="text_field">
                       <asp:TextBox ID="passwordtextbox" TextMode="Password" CssClass="form-control" runat="server" Required="true"></asp:TextBox>
                        <span></span>
                        <label>Password</label>
                    </div>
                    <asp:Button CssClass="m-4 btn btn-block btn-info text-white mx-auto custom-button" ID="signup" runat="server" Text="SignUp" Width="224px" OnClick="signup_Click" />
                    <div class="signup">

                        <br />
                        <a href="login.aspx">Already Registered?</a>

                    </div>
                </form>
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
