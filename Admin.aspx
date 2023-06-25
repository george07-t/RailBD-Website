<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Rail_BD.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-panel {
            width: 100%;
            margin: 0 auto;
            padding: 20px;
            background-color: mediumpurple;
            border-radius: 5px;
            text-align: center;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .admin-panel button {
            margin: 10px;
            background-color: rebeccapurple;
        }
 
        .add-train-form{
            width=500px;
        }
        .add-train-form button {
            margin: 10px;
            background-color: green;
            color: white;
        }

        .add-train-form label {
            margin-top: 20px;
        }

        .custom-button {
            background-color: rgba(0, 103, 71, 255);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="admin-panel">
        <h1>Admin Panel</h1>
        <asp:Button ID="addtrainshowid" runat="server" Text="Add Train" CssClass="btn btn-primary custom-button" OnClick="addtrainshowid_Click" />
        <asp:Button ID="showtrainid" runat="server" Text="show Train" CssClass="btn btn-primary custom-button" OnClick="showtrainid_Click" />
        <asp:Button ID="showticketid" runat="server" Text="Show Tickets" CssClass="btn btn-primary custom-button" OnClick="showticketid_Click" />
        
        <div runat="server" id-="ShowID" class="add-train-form">
            <div class="form-group">
                <label for="sourceid" id="Label0" runat="server" visible="false" class="control-label">Source</label>
                <asp:TextBox ID="trainnameid" Visible="false" TextMode="SingleLine" CssClass="form-control" runat="server" placeholder="Train Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="sourceid" id="lable1" runat="server" visible="false" class="control-label">Source</label>
                <asp:TextBox ID="sourceid" Visible="false" TextMode="SingleLine" CssClass="form-control" runat="server" placeholder="Source"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="destinationid" id="lable2" runat="server" visible="false" class="control-label">Destination</label>
                <asp:TextBox ID="destinationid" Visible="false" TextMode="SingleLine" CssClass="form-control" runat="server" placeholder="Destination"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="timeid" id="lable3" runat="server" visible="false" class="control-label">Time</label>
                <asp:TextBox ID="timeid" Visible="false" TextMode="SingleLine" CssClass="form-control" runat="server" placeholder="Time"></asp:TextBox>
            </div>
            <asp:Button ID="addtrainbuttonid" runat="server" Visible="false" Text="Add Train Info" CssClass="btn btn-primary custom-button" OnClick="addtrainbuttonid_Click" />
        </div>
        <div class="d-flex">
            <div class="col-6">
                <h3>Train Name Show</h3>
                        <div class="row">
            <div class="col-md-8 mx-auto">
                <asp:GridView ID="trainGridView" CssClass="table" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="trainname" HeaderText="Train Name" />
                        <asp:BoundField DataField="source" HeaderText="Source" />
                        <asp:BoundField DataField="destination" HeaderText="Destination" />
                        <asp:BoundField DataField="time" HeaderText="Time" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
            </div>
            <div class="col-6">
                <h3>Ticket Show</h3>
            </div>
        </div>

        <br />
        <asp:Button ID="signoutbuttonid" runat="server" Text="Admin Signout" CssClass="btn btn-primary custom-button" OnClick="signoutbuttonid_Click" />

    </div>


</asp:Content>
