﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Rail_BD.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .admin-panel {
            width: 100%;
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

        .add-train-form {
            border: 1px solid #000;
            padding: 20px;
            margin-top: 30px;
            padding-left: 90px;
            padding-right: 90px;
            margin-left: 350px;
            margin-right: 350px;
            margin-bottom: 30px;
            background-color: cornflowerblue;
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

        .center-textbox {
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="admin-panel">
        <h1><strong>Admin Panel</strong></h1>

        <asp:Button ID="addtrainshowid" runat="server" Text="Add Train" CssClass="btn btn-primary custom-button" OnClick="addtrainshowid_Click" />
        <asp:Button ID="deletetrainid" runat="server" Text="Delete Train" CssClass="btn btn-primary custom-button" OnClick="deletetrainid_Click1" />
        <asp:Button ID="updatetrainid" runat="server" Text="Update Train" CssClass="btn btn-primary custom-button" OnClick="updatetrainid_Click" />
        <asp:Button ID="showtrainid" runat="server" Text="show Train" CssClass="btn btn-primary custom-button" OnClick="showtrainid_Click" />
        <asp:Button ID="showticketid" runat="server" Text="Show Tickets" CssClass="btn btn-primary custom-button" OnClick="showticketid_Click" />

        <div id="adddatashow" runat="server" visible="false" class="add-train-form">
            <div class="form-group">
                <label for="trainnameid" id="Label0" runat="server" visible="false" class="control-label" style="font-size: 20px;"><strong>Train Name</strong></label>
                <asp:TextBox ID="trainnameid" Visible="false" TextMode="SingleLine" CssClass="form-control center-textbox" runat="server" placeholder="Train Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="sourceid" id="lable1" runat="server" visible="false" class="control-label" style="font-size: 20px;"><strong>source</strong></label>
                <asp:TextBox ID="sourceid" Visible="false" TextMode="SingleLine" CssClass="form-control center-textbox" runat="server" placeholder="Source"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="destinationid" id="lable2" runat="server" visible="false" class="control-label" style="font-size: 20px;"><strong>Destination</strong></label>
                <asp:TextBox ID="destinationid" Visible="false" TextMode="SingleLine" CssClass="form-control center-textbox" runat="server" placeholder="Destination"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="timeid" id="lable3" runat="server" visible="false" class="control-label" style="font-size: 20px;"><strong>Time</strong></label>
                <asp:TextBox ID="timeid" Visible="false" TextMode="Time" CssClass="form-control center-textbox" runat="server" placeholder="Time"></asp:TextBox>
            </div>
            <asp:Button ID="addtrainbuttonid" runat="server" Visible="false" Text="Add Train Info" CssClass="btn btn-primary custom-button" OnClick="addtrainbuttonid_Click" />
        </div>
        <div id="Div1" visible="false" runat="server" class="add-train-form">
            <div class="form-group">
                <label for="trainnameid" id="Label1" runat="server" visible="false" class="control-label" style="font-size: 20px;"><strong>Train Name to Delete</strong></label>
                <asp:TextBox ID="trainnamedelid" Visible="false" TextMode="SingleLine" CssClass="form-control center-textbox" runat="server" placeholder="Train Name to Delete"></asp:TextBox>
            </div>

            <asp:Button ID="deleteid" runat="server" Visible="false" Text="Delete Train Info" CssClass="btn btn-primary custom-button" OnClick="deleteid_Click" />
        </div>
        <div id="Div2" runat="server" visible="false" class="add-train-form">
            <div class="form-group">
                <label for="trainnameidtodel" id="Label6" runat="server" visible="false" class="control-label" style="font-size: 20px;"><strong>Train Name To Update</strong></label>
                <asp:TextBox ID="trainnameidtodel" Visible="false" TextMode="SingleLine" CssClass="form-control center-textbox" runat="server" placeholder="Train Name To Update"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="sourceid" id="Label3" runat="server" visible="false" class="control-label" style="font-size: 20px;"><strong>source</strong></label>
                <asp:TextBox ID="TextBox2" Visible="false" TextMode="SingleLine" CssClass="form-control center-textbox" runat="server" placeholder="Source"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="destinationid" id="Label4" runat="server" visible="false" class="control-label" style="font-size: 20px;"><strong>Destination</strong></label>
                <asp:TextBox ID="TextBox3" Visible="false" TextMode="SingleLine" CssClass="form-control center-textbox" runat="server" placeholder="Destination"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="timeid" id="Label5" runat="server" visible="false" class="control-label" style="font-size: 20px;"><strong>Time</strong></label>
                <asp:TextBox ID="TextBox4" Visible="false" TextMode="Time" CssClass="form-control center-textbox" runat="server" placeholder="Time"></asp:TextBox>
            </div>
            <asp:Button ID="update" runat="server" Visible="false" Text="Update Train Info" CssClass="btn btn-primary custom-button" OnClick="update_Click" />
        </div>
        <div class="d-flex">
            <div class="col-6">
                <div id="trainshow" runat="server" visible="false">
                    <h3>Train Name Show</h3>
                    <div class="row">
                        <div class="col-md-8 mx-auto">
                            <asp:GridView ID="trainGridView" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="trainname" HeaderText="Train Name" />
                                    <asp:BoundField DataField="source" HeaderText="Source" />
                                    <asp:BoundField DataField="destination" HeaderText="Destination" />
                                    <asp:BoundField DataField="time" HeaderText="Time" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div id="ticketshow" runat="server" visible="false">
                    <h3>Ticket Show</h3>
                    <div class="row">
                        <div class="col-md-8 mx-auto">
                            <asp:GridView ID="ticketgridview" CssClass="table" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                                <Columns>
                                    <asp:BoundField DataField="ticketnumber" HeaderText="Ticket Number" />
                                    <asp:BoundField DataField="fromto" HeaderText="From-To" />
                                    <asp:BoundField DataField="date" HeaderText="Date" />
                                    <asp:BoundField DataField="time" HeaderText="Time" />
                                    <asp:BoundField DataField="class" HeaderText="Class" />
                                    <asp:BoundField DataField="seatno" HeaderText="Seat No" />
                                    <asp:BoundField DataField="fare" HeaderText="Fare" />
                                    <asp:BoundField DataField="username" HeaderText="Passenger" />
                                </Columns>
                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#33276A" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <asp:Button ID="signoutbuttonid" runat="server" Text="Admin Signout" CssClass="btn btn-primary custom-button" OnClick="signoutbuttonid_Click" />

    </div>


</asp:Content>
