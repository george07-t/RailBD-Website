<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="Rail_BD.adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-panel {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
            border-radius: 5px;
            text-align: center;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            background-color: #337ab7;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #286090;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="admin-panel">
        <h1>Admin Panel</h1>
        <div class="form-group">
            <asp:TextBox ID="admincode" runat="server" CssClass="form-control" TextMode="Password" placeholder="AdminKey"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="adminloginid" runat="server" Text="AdminLogin" CssClass="btn" OnClick="adminloginid_Click" />
        </div>
    </div>
</asp:Content>
