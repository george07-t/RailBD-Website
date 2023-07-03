<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Rail_BD.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .container {
            text-align: center;
        }

        .text-center {
            text-align: center;
        }

        .search-train {
            background-color: rgba(21,135,108,255);
            padding: 60px 40px;
            padding-top: 70px;
            text-align: center;
        }

            .search-train h2 {
                margin-top: 0;
                font-size: 32px;
                color: #ffffff;
            }


        .box {
            width: 33.33%;
            box-sizing: border-box;
            padding: 10px;
            background-color: white;
            float: left;
        }

        .box1 {
            height: 350px;
        }

        .box2 {
            height: 350px;
        }

        .box3 {
            height: 350px;
        }

        .clearfix {
            clear: both;
        }

        .ins {
            width: 50%;
            box-sizing: border-box;
            padding: 10px;
            background-color: white;
            float: left;
        }

        .ins2 {
            height: 900px;
            text-align: left;
            margin-bottom: 40px;
        }

        .ins1 {
            margin-bottom: 40px;
            height: 900px;
        }

        .lists ol {
            list-style: none;
            counter-reset: li;
            padding: 0;
        }

        .lists li {
            position: relative;
            margin-bottom: 10px;
            padding-left: 40px;
        }

            .lists li:before {
                content: counter(li);
                counter-increment: li;
                position: absolute;
                top: 0;
                left: 0;
                width: 30px;
                height: 30px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
                border-radius: 50%;
                background: #ccc;
            }

            .lists li img {
                position: absolute;
                top: 5px;
                left: 5px;
                width: 20px;
                height: 20px;
            }

            .lists li span {
                display: inline-block;
                margin-left: 10px;
                font-weight: bold;
            }

        .terms {
            display: flex;
            justify-content: center;
        }

        .copy-right {
            background-color: rgba(21,135,108,255);
            padding: 20px 0;
            color: #fff;
        }

            .copy-right p {
                margin: 0;
                font-size: 14px;
                text-align: center;
            }

        footer {
            background-color: #ffffff;
            padding: 50px 0;
        }

            footer h3 {
                text-align: center;
                font-size: 24px;
                margin-bottom: 10px;
                color: #333;
            }

            footer ul li {
                color: black;
            }

            footer p {
                text-align: center;
                line-height: 1.8;
                font-size: 14px;
                color: #555;
            }

        .social-media {
            text-align: center;
            list-style: none;
            margin: 0;
            padding: 0;
        }

            .social-media li {
                display: inline-block;
                margin-right: 10px;
                color: black;
            }

                .social-media li:last-child {
                    margin-right: 0;
                }

            .social-media a {
                color: #555;
                font-size: 14px;
            }

        .btn-primary {
            background-color: rgba(0, 103, 71, 255);
        }
        .imageslider{
            border:2px solid white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <section class="search-train">
        <div class="d-flex">

            <div class="col-6 mx-auto">
                <h2 class="text-center"><strong>Search Train</strong></h2>
                <hr style="width: 300px; height: 3px; background-color: white; text-align: right;" />

                <div class="text-center">
                    <form action="#" method="POST">
                        <div class="form-group">
                            <label for="from-station" class="text-white">
                                <h5>From Station</h5>
                            </label>
                            <asp:TextBox ID="fromstationtextbox" runat="server" Width="690px" Height="40px"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="to-station" class="text-white">
                                <h5>To Station</h5>
                            </label>
                            <asp:TextBox ID="tostationtextbox" runat="server" Width="690px" Height="40px"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="journeydate" class="text-white">
                                <h5>Journey Date</h5>
                            </label>
                            <input type="date" id="journeydate" runat="server" name="journey-date" class="form-control">
                        </div>

                        <div class="form-group">
                            <label for="classid" class="text-white">
                                <h5>Select a Class</h5>
                            </label>
                            <asp:DropDownList ID="class_id" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Ka" Value="Ka"></asp:ListItem>
                                <asp:ListItem Text="Kha" Value="Kha"></asp:ListItem>
                                <asp:ListItem Text="GA" Value="Ga"></asp:ListItem>
                                <asp:ListItem Text="Gha" Value="Gha"></asp:ListItem>
                                <asp:ListItem Text="Uma" Value="Uma"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div>
                            <asp:Button CssClass="m-4 btn btn-block btn-info text-white mx-auto" ID="search" runat="server" Text="Search" Width="224px" OnClick="search_Click" />
                        </div>
                    </form>
                </div>
            </div>


            <div class="col-6" style=" background-size: cover;padding-top:40px; text-align: right;">
                <div style="display: flex; flex-direction: column; align-items: flex-end;">
                 <h4 style="color:white; text-align:center;margin-right:5px;">Our Train is Our Pride</h4>
                <div id="imageSlider" class="carousel slide imageslider" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/owners.png" class="d-block w-100" alt="Slide 1">
                        </div>
                        <div class="carousel-item">
                            <img src="images/rail2.jpg" class="d-block w-100" alt="Slide 2">
                        </div>
                        <div class="carousel-item">
                            <img src="images/rail3.jpg" class="d-block w-100" alt="Slide 3">
                        </div>
                        <div class="carousel-item">
                            <img src="images/rail4.jpg" class="d-block w-100" alt="Slide 4">
                        </div>
                        <div class="carousel-item">
                            <img src="images/rail5.jpg" class="d-block w-100" alt="Slide 5">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#imageSlider" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#imageSlider" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
               </div>
            </div>
        </div>
    </section>
    <section>
    </section>
    <section style="margin-top: 40px; margin-bottom: 40px;">
        <div class="container">
            <div class="box box1">
                <img src="images/search.svg" alt="Serach">
                <h2>Search
                </h2>
                <p>
                    Choose your origin, destination,<br>
                    journey dates and search for trains
                </p>

            </div>
            <div class="box box2">
                <img src="images/select.svg" alt="select">
                <h2 style="margin-top: 50px;">Select
                </h2>
                <p>
                    Select your desired trip and choose
                    <br>
                    your seats
                </p>
            </div>
            <div class="box box3">
                <img src="images/pay.svg" alt="pay">
                <h2 style="margin-top: 50px;">Pay
                </h2>
                <p>
                    Pay for the tickets via Debit / Credit
                    <br>
                    Cards or MFS
                </p>
            </div>
        </div>


    </section>

    <section style="margin-top: 40px; margin-bottom: 40px;">
        <div class="container">
            <div class="ins ins1">
                <img src="images/instruction-secion-image.png" alt="instruction-secion-image" style="margin-top: 150px;">
            </div>
            <div class="ins ins2">
                <h1 style="color: rgba(21,135,108,255); font-weight: bold; margin-left: 5px; font-size: 30px;">Instructions to Purchase Tickets
                </h1>
                <div class="lists">
                    <ol>
                        <li>
                            <img src="images/right-arrow.png" alt="Custom Image">
                            <span>Tickets can be bought online five days in advance.</span>
                        </li>
                        <li>
                            <img src="images/right-arrow.png" alt="Custom Image"><span>You can pay for the tickets using mobile financial
                services: bKash, Nagad, Rocket
                                <br>
                                or debit/credit cards: Mastercard, Visa, DBBL Nexus. Other payment
                options will
                                <br>
                                be available soon.</span> </li>
                        <li>
                            <img src="images/right-arrow.png" alt="Custom Image">
                            <span>In case of payment or transaction failure, the deducted
                amount would be
                                <br>
                                refunded by your bank or MFS provider within 8 business days.</span>
                        </li>
                        <li>
                            <img src="images/right-arrow.png" alt="Custom Image">
                            <span>In case of payment or transaction failure, the
                deducted
                amount would be refunded by your bank or MFS
                provider within 8 business days.</span>
                        </li>
                        <li>
                            <img src="images/right-arrow.png" alt="Custom Image">
                            <span>In case money has been deducted from your card /
                mobile
                wallet but you have not<br>
                                received a ticket
                confirmation, the deducted amount would be refunded by your<br>
                                bank or MFS provider within 8 business
                days.
                            </span>
                        </li>
                        <li>
                            <img src="images/right-arrow.png" alt="Custom Image">
                            <span>If you have not received your ticket copy in
                email,
                kindly check your Spam / Junk<br>
                                folder. You can also
                download your ticket copy from the purchase history of your
                                <br>
                                account after you login.</span>
                        </li>
                        <li>
                            <img src="images/right-arrow.png" alt="Custom Image">
                            <span>Download the official <span
                                style="font-weight: bold;">Rail.BD</span> app published by Bangladesh Railway
                from
                <br>
                                <a href="https://drive.google.com/file/d/1aLdhdNxwoeAhcNPUAbaTAwhL_tsEgSBA/view?usp=sharing"
                                    target="_blank" style="color: rgba(0,103,71,255); text-decoration: none; font-weight: bold;">Google
                  Play</a>.</span>

                        </li>
                        <li>
                            <img src="images/right-arrow.png" alt="Custom Image">
                            <span>In case of passengers downloading fake apps or any
                other app from Google Play
                                <br>
                                which claim to sell
                train
                tickets of Bangladesh Railway, the authorities will not<br>
                                take any liability.</span>
                        </li>
                    </ol>
                </div>


            </div>



        </div>

    </section>
    <hr />
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <h3>About Us</h3>
                    <p>
                        * The Tickets are issued by Rail.BD Author Centrally Computerized Seat Reservation & Ticketing System
            (CCSRTS) and
            <br>
                        George Tonmoy Roy (CSE,KUET) is responsible for designing, development, implementation, technical operation
            & maintenance of the system.
                    </p>
                </div>
                <div class="col-sm">
                    <h3>Contact Us</h3>
                    <p>
                        121 Police Line, Barishal, Bangladesh<br>
                        Phone: +8801828113846<br>
                        Email: roy1907114@stud.kuet.ac.bd
                    </p>
                </div>
                <div class="col-sm">
                    <h3>Follow Us</h3>
                    <ul class="social-media">
                        <li><a href="#" style="text-decoration: none;">Facebook</a></li>
                        <li><a href="#" style="text-decoration: none;">Twitter</a></li>
                        <li><a href="#" style="text-decoration: none;">Instagram</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="copy-right">
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <p style="color: white; margin-bottom: 5px;">&copy; 2023 Rail.BD-Website. All rights reserved.</p>
                        <div class="terms">
                            <a href="https://eticket.railway.gov.bd/terms-and-conditions" target="_blank"
                                style="color: white; margin-right: 10px; text-decoration: none;">Terms and Conditions </a>
                            <p style="color: white;">| </p>
                            <a href="https://eticket.railway.gov.bd/privacy-policy" target="_blank"
                                style="color: white; margin-left: 10px; text-decoration: none;">Privacy Policy </a>
                            <p style="color: white;">| </p>
                            <a href="adminlogin.aspx"
                                style="color: white; margin-left: 10px; text-decoration: none;">Admin Panel </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </footer>




</asp:Content>
