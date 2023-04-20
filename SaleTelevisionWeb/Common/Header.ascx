<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="SaleTelevisionWeb.Common.Header" %>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Google fonts-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Swiper slider-->
<link rel="stylesheet" href="../vendor/swiper/swiper-bundle.min.css">
<!-- Choices.js [Custom select]-->
<link rel="stylesheet" href="../vendor/choices.js/public/assets/styles/choices.css">
<!-- Theme stylesheet-->
<link rel="stylesheet" href="../css/style.default.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
            <%
        string htmlLoginBar = @"
    <div class=""top-bar py-2"" id=""topBar"" style=""background: #555"">
        <div class=""container px-lg-0 text-light py-1"">
            <div class=""row d-flex align-items-center"">
                <div class=""col-md-6 d-md-block d-none"">
                    <p class=""mb-0 text-xs"">Contact us on dhti13a1hn.</p>
                </div>
                <div class=""col-md-6"">
                    <div class=""d-flex justify-content-md-end justify-content-between"">
                        <ul class=""list-inline d-block d-md-none mb-0"">
                            <li class=""list-inline-item""><a class=""text-xs"" href=""#""><i class=""fa fa-phone""></i></a></li>
                            <li class=""list-inline-item""><a class=""text-xs"" href=""#""><i class=""fa fa-envelope""></i></a></li>
                        </ul>
                        <ul class=""list-inline mb-0"">
                            <li class=""list-inline-item"">
                                <a class=""text-xs text-uppercase fw-bold text-reset"" href=""../Common/Login.aspx""><i class=""fas fa-door-open me-2""></i><span class=""d-none d-md-inline-block"">Login</span></a>
                            </li>
                            <li class=""list-inline-item"">
                                <a class=""text-xs text-uppercase fw-bold text-reset"" href=""../Common/Register.aspx""><i class=""fas fa-user me-2""></i><span class=""d-none d-md-inline-block"">Register</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>";
        if (HttpContext.Current.Session["CurrentUser"] == null)
            Response.Write(htmlLoginBar);
    %>
    <header class="nav-holder make-sticky <% if (HttpContext.Current.Session["CurrentUser"] != null) Response.Write("fixed-top"); %>">
        <div class="navbar navbar-light bg-white navbar-expand-lg py-0" id="navbar">
            <div class="container py-3 py-lg-0 px-lg-0 ">
                <!-- Navbar brand-->
                <asp:LinkButton ID="lbtnHome" runat="server" CssClass="navbar-brand">
                    <img class="d-none d-md-inline-block" src="../img/logo.png" width="200" alt="Universal logo">
                    <img class="d-inline-block d-md-none" src="../img/logo.png" width="130" alt="Universal logo">
                    <span class="sr-only">Universal - go to homepage</span>
                </asp:LinkButton>
                <!-- Navbar toggler-->
                <button class="navbar-toggler text-primary border-primary" type="button" data-bs-toggle="collapse" data-bs-target="#navigationCollapse" aria-controls="navigationCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="sr-only">Toggle navigation</span><i class="fas fa-align-justify"></i></button>
                <!-- Collapsed Navigation    -->
                <div class="collapse navbar-collapse" id="navigationCollapse">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                    <%
                                        string htmlAdminNav = @"
                            <li class=""nav-item dropdown""><a class=""nav-link dropdown-toggle"" id=""mpDropdown"" href=""#"" role=""button"" data-bs-toggle=""dropdown"" aria-expanded=""false"">Manage</a>
                            <ul class=""dropdown-menu"" aria-labelledby=""mpDropdown"">
                                <li>
                                    <a href=""../Admin/ManageTelevision.aspx"" class=""dropdown-item text-uppercase border-bottom"">Television</a>
                                </li>
                                <li>
                                     <a href=""../Admin/ManageUser.aspx"" class=""dropdown-item text-uppercase border-bottom"">User</a>
                                </li>
                                <li>
                                    <a href=""../Admin/ManageCustomerOrder.aspx"" class=""dropdown-item text-uppercase border-bottom"">Order</a>
                                </li>
                            </ul>
                        </li>
";
                                        if (HttpContext.Current.Session["CurrentUser"] != null)
                                            if (((SaleTelevisionWeb.AppCode.UserAccount)HttpContext.Current.Session["CurrentUser"]).Role == "admin") Response.Write(htmlAdminNav);
    %>
                        <!-- managepage dropdown-->

                        <!-- homepage dropdown-->
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="hpDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Home</a>
                            <ul class="dropdown-menu" aria-labelledby="hpDropdown">
                                <li>
                                    <asp:LinkButton ID="lbtnShopping" runat="server" CssClass="dropdown-item text-uppercase border-bottom">Shopping</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lbtnAboutShop" runat="server" CssClass="dropdown-item text-uppercase border-bottom">About shop</asp:LinkButton>
                                </li>
                            </ul>
                        </li>
                        <!-- megamenu [features]-->
                        <li class="nav-item dropdown menu-large"><a class="nav-link dropdown-toggle" id="featuresMegamenu" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">About us</a>
                            <ul class="dropdown-menu megamenu p-4" aria-labelledby="featuresMegamenu">
                                <li>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <img class="img-fluid d-none d-lg-block" src="../img/template-easy-customize.png" alt="">
                                        </div>
                                        <div class="col-lg-4 col-md-4">
                                            <h5 class="text-dark text-uppercase pb-2 border-bottom">Infomation</h5>
                                            <ul class="list-unstyled mb-3">
                                                <li class="nav-item">
                                                    <asp:LinkButton ID="lbtnMember" runat="server" CssClass="nav-link-sub py-2 text-uppercase">Member</asp:LinkButton>
                                                </li>
                                                <li class="nav-item">
                                                    <asp:LinkButton ID="lbtnContact" runat="server" CssClass="nav-link-sub py-2 text-uppercase">Contact</asp:LinkButton>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <asp:LinkButton ID="lbtnCart" runat="server" CssClass="btn btn-outline-primary nav-link">
                                Cart<i class="fas fa-shopping-cart"></i>
                                <asp:Label ID="lbQuantity" runat="server" Text="0" CssClass="text-danger" Font-Bold="True" Font-Italic="True"></asp:Label>
                            </asp:LinkButton>
                        </li>
                        <li class="nav-item dropdown"><a class="nav-link " id="userDropdown" href="#" data-bs-toggle="dropdown"><i class='fas fa-align-justify'></i></a>
                            <ul class="dropdown-menu" aria-labelledby="userDropdown">
                                <li>
                                    <asp:LinkButton ID="lbtnPurchaseHistory" runat="server" CssClass="dropdown-item text-uppercase border-bottom">Purchase history</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lbtnUserProfile" runat="server" CssClass="dropdown-item text-uppercase border-bottom">User profile</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lbtnLogout" runat="server" CssClass="dropdown-item text-uppercase border-bottom">Logout</asp:LinkButton>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- HEADING BREADCRUMB-->
    <section class="bg-pentagon py-4" <% if(HttpContext.Current.Session["CurrentUser"] != null) Response.Write("style='margin-top:75px'"); %>>
        <div class="container py-3">
            <div class="row d-flex align-items-center gy-4">
                <div class="col-md-7">
                    <h1 class="h2 mb-0 text-uppercase">
                        <asp:Label ID="lbContentTitle" runat="server" Text="Label"></asp:Label></h1>
                </div>
            </div>
        </div>
    </section>

