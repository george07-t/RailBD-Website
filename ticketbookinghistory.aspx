<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ticketbookinghistory.aspx.cs" Inherits="Rail_BD.ticketbookinghistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
        <h1>User Ticket Booing History</h1>
        <hr style="margin-left: 20px; margin-right: 20px;">
    </section>
    <div style="background-color: aqua;margin-left:40px;margin-right:20px;">
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <asp:GridView ID="tickethistory" CssClass="table" runat="server" AutoGenerateColumns="False" OnRowCommand="tickethistory_RowCommand" CellPadding="3" GridLines="None" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
            <Columns>
                <asp:BoundField DataField="ticketnumber" HeaderText="Ticket Number" />
                <asp:BoundField DataField="fromto" HeaderText="From-To" />
                <asp:BoundField DataField="date" HeaderText="Date" />
                <asp:BoundField DataField="time" HeaderText="Time" />
                <asp:BoundField DataField="class" HeaderText="Class" />
                <asp:BoundField DataField="seatno" HeaderText="Seat No" />
                <asp:BoundField DataField="fare" HeaderText="Fare" />
                <asp:TemplateField HeaderText="Options">
                    <ItemTemplate>
                        <asp:Button ID="printid" CssClass="btn btn-primary custom-button" runat="server" Text="Print" CommandName="print" CommandArgument='<%# Container.DataItemIndex %>' />

                    </ItemTemplate>
                </asp:TemplateField>
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
