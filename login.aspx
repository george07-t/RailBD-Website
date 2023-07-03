<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Rail_BD.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login|Rail.BD</title>
    <style>
        .bg-image {
            background-image: url('images/login-page-bg.svg');
            background-size: cover;
            height: 100vh;
            overflow: hidden;
        }

        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 450px;
            background: white;
            border-radius: 10px;
            padding-bottom: 30px;
            padding-top: 30px;
        }

        .center form {
            box-sizing: border-box;
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

        .pass {
            margin-bottom: 10px;
        }

            .pass a {
                margin-left: 5px;
                color: #a6a6a6;
                cursor: pointer;
                text-decoration: none;
            }

                .pass a:hover {
                    text-decoration: underline;
                    color: #006747;
                }

        .btn-primary {
            background-color: rgba(21,135,108,255);
        }
        .custom-button {
    background-color:rgba(21,135,108,255);
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <main class="bg-image">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="text-center" style="color: rgba(21,135,108,255); font-size: 50px; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">Login</h1>
                    <form method="post">
                        <div class="from-group text_field">
                            <asp:TextBox ID="username" CssClass="form-control" runat="server" Required="true"></asp:TextBox>
                            <label for="username">Enter your Username</label>
                            <span></span>
                        </div>
                        <div class="from-group text_field">
                            <asp:TextBox ID="password" TextMode="Password" CssClass="form-control" runat="server" Required="true"></asp:TextBox>
                            <label for="password">Enter your Password</label>
                            <span></span>
                        </div>
                        <div class="pass">
                            <a href="Forgotpass">Forgot password?</a>
                        </div>
                        <asp:Button CssClass="m-4 btn btn-block btn-info text-white mx-auto custom-button" ID="log" runat="server" Text="LogIn" Width="224px" OnClick="log_Click" />
                        <div class="text-center mt-2">or</div>
                        <div class="text-center mt-2">
                            <a href="register.aspx">Register</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
