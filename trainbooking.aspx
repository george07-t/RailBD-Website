<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="trainbooking.aspx.cs" Inherits="Rail_BD.trainbooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nidverify h1 {
            font-family: Arial, Helvetica, sans-serif;
        }

        .show {
            background-color: burlywood;
            color: black;
            padding: 20px;
            padding-left: 40px;
        }

            .show label {
                tab-size: 20px;
                margin-bottom: 10px;
                font-weight: bold;
                font-size: 16px;
                color: #333333;
            }



        .custom-button {
            background-color: palevioletred;
            margin-top: 5px;
            margin-bottom: 5px;
            width: 100px;
        }

        .view {
            width: 1100px;
        }

        .table {
            text-align: center;
        }

        .lable3show {
            text-align: center;
            color: red;
            tab-size: 25px;
        }

        .container-fluid {
            background-color: antiquewhite;
        }

        .container hr {
            width: 300px;
            text-align: center;
            height: 3px;
            color: black;
        }

        .auto-style1 {
            width: 121px;
        }

        .auto-style2 {
            width: 14%;
            height: 189px;
        }

        .tableshow {
            display: flex;
            justify-content: center;
            background-color: antiquewhite;
        }

        td {
            text-align: center;
            padding: 10px;
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

        .container1 {
            text-align: center;
        }

        .terms {
            display: flex;
            justify-content: center;
        }

        .auto-style5 {
            width: 119px;
            text-align: left;
        }

        .auto-style6 {
            width: 29%
        }

        .auto-style8 {
            text-align: center;
            margin-right: 0px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="show">
        <section class="nidverify">
            <h1>User Ticket Booking History</h1>
        </section>
        <hr style="width: 500px; height: 3px; background-color: black; position: relative; border: none; margin: 0;">

        <div style="position: absolute; top: 0; right: 0;">
            <hr style="width: 250px; height: 3px; background-color: black; border: none; margin: 0;">
        </div>
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="From-To :"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Date :"></asp:Label>
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Class :"></asp:Label>
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text=""></asp:Label>
        <br />
    </div>
    <div class="container-fluid">
        <h1 class="text-center"><strong>Available Trains</strong></h1>
        <hr style="width: 350px; height: 3px; background-color: black; text-align: right;" />
        <asp:Label ID="Label3" CssClass="lable3show text-center" runat="server" Text=""></asp:Label>
        <br />
        <div class="row">
            <div class="col-md-6 mx-auto view">
                <asp:GridView ID="availabletrainshowid" CssClass="table" runat="server" AutoGenerateColumns="False" OnRowCommand="availabletrainshowid_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="trainname" HeaderText="Train Name" />
                        <asp:BoundField DataField="source" HeaderText="Train Source" />
                        <asp:BoundField DataField="destination" HeaderText="Train Destination" />
                        <asp:BoundField DataField="time" HeaderText="Train time" />
                        <asp:TemplateField HeaderText="Options">
                            <ItemTemplate>
                                <asp:Button ID="bookbuttonid" CssClass="btn btn-primary custom-button" runat="server" Text="Book Ticket" CommandName="book" CommandArgument='<%# Container.DataItemIndex %>' />

                            </ItemTemplate>
                        </asp:TemplateField>
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
    <section id="seatbookingid" runat="server" style="background-color: antiquewhite;">
        <h1 class="auto-style8"><strong>Seat Booking</strong></h1>
        <div style="display: flex; justify-content: center;">
            <hr style="width: 50%; height: 3px; background-color: black; position: relative; border: none; margin: 0;">
        </div>
        <div style="position: absolute; top: 0; right: 0;">
            <hr style="width: 250px; height: 3px; background-color: antiquewhite; border: none; margin: 0;">
        </div>
        <br />
        <br />
    </section>
    <div id="seatshowid" runat="server" class="tableshow d-flex">
        <div class="col-6" style="text-align: center;">
            <h4><strong>Seat Select</strong></h4>
            <div style="display: flex; justify-content: center;">
                <hr style="width: 200px; height: 3px; background-color: black; border: none; margin: 0;">
            </div>
            <br />
            <div style="display: flex; flex-direction: column; align-items: center;">
                <div> 
                    <asp:Label ID="Labelno" CssClass="lable3show text-center" runat="server" Text="NB: Only one seat can be booked at a time!"></asp:Label>
                </div>
                <div style="display: flex; align-items: center;">
                    <span class="info-label">Booked Tickets:</span>
                    <asp:Label ID="bookedticket" CssClass="lable3show text-center" runat="server" Text="asd"></asp:Label>
                </div>
                <div style="display: flex; justify-content: center;">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <table class="auto-style2" id="showseatstableid" runat="server">
                        <tr>
                            <td class="auto-style1">



                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons11" runat="server" BackColor="Gray" Text="1" OnClick="Buttons11_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons11" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>

                            </td>
                            <td class="auto-style1">


                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons12" runat="server" BackColor="Gray" Text="2" OnClick="Buttons12_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons12" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">


                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons13" runat="server" BackColor="Gray" Text="3" OnClick="Buttons13_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons13" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>

                            </td>
                            <td class="auto-style1">


                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons14" runat="server" BackColor="Gray" Text="4" OnClick="Buttons14_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons14" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">


                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons15" runat="server" BackColor="Gray" Text="5" OnClick="Buttons15_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons15" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td class="auto-style1">


                                <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons16" runat="server" BackColor="Gray" Text="6" OnClick="Buttons16_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons16" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">


                                <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons17" runat="server" BackColor="Gray" Text="7" OnClick="Buttons17_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons17" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td class="auto-style1">


                                <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons18" runat="server" BackColor="Gray" Text="8" OnClick="Buttons18_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons18" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">


                                <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons19" runat="server" BackColor="Gray" Text="9" OnClick="Buttons19_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons19" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td class="auto-style1">


                                <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="Buttons20" runat="server" BackColor="Gray" Text="10" OnClick="Buttons20_Click" Height="50px" Width="50px" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Buttons20" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-6">
            <section id="showseatid" runat="server" class="text-left">
                <h4><strong>Seat Details</strong></h4>
                <hr style="width: 200px; height: 3px; background-color: black; position: relative; border: none; margin: 0;">

                <div style="position: absolute; top: 0; right: 0;">
                    <hr style="width: 100px; height: 3px; background-color: antiquewhite; border: none; margin: 0;">
                </div>
                <br />
                <asp:Label ID="Label16" runat="server" Font-Bold="True" Text=" Train Name :"></asp:Label>
                <asp:Label ID="trainnameid" runat="server" Font-Bold="True" Text=""></asp:Label>
                <br />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text=" From-To :"></asp:Label>
                <asp:Label ID="fromtoid" runat="server" Font-Bold="True" Text=""></asp:Label>
                <br />
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Date :"></asp:Label>
                <asp:Label ID="dateshowid" runat="server" Font-Bold="True" Text=""></asp:Label>
                <br />
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="Time :"></asp:Label>
                <asp:Label ID="timeshowid" runat="server" Font-Bold="True" Text=""></asp:Label>
                <br />
                <table class="auto-style6">
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Class" runat="server" Font-Bold="True" Text="Class"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <asp:Label ID="Seats" runat="server" Font-Bold="True" Text="Seats"></asp:Label></td>
                        <td class="text-left">
                            <asp:Label ID="Fare" runat="server" Font-Bold="True" Text="Fare"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="classlabelid" runat="server" Text="KA"></asp:Label></td>
                        <td class="auto-style5">
                            <asp:Label ID="seatslabelid" runat="server" Text="1"></asp:Label></td>
                        <td class="text-left">
                            <asp:Label ID="farelabelid" runat="server" Text="500"></asp:Label></td>
                    </tr>
                </table>
                <asp:Label ID="Label14" runat="server" Text="Total: "></asp:Label>
                <asp:Label ID="Label15" runat="server" Text="500tk"></asp:Label>
                <br />
                <br />


                <asp:Button ID="confirmbuttonid" CssClass="btn btn-primary" runat="server" Text="Confirm Purchase" BackColor="#55B155" OnClick="confirmbuttonid_Click" />


            </section>
        </div>

    </div>
    <footer>
        <div class="copy-right">
            <div class="container1">
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
