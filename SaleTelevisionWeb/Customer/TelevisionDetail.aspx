<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TelevisionDetail.aspx.cs" Inherits="SaleTelevisionWeb.Customer.TelevisionDetail" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<%@ Register Src="~/Customer/Sidebar.ascx" TagName="Sidebar" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title" runat="server">Detail</title>
</head>
<body>
    <form runat="server" id="formTelevisionList">
        <div class="wide" id="all">
            <!-- Header -->
            <Layout:Header ID="header" runat="server" />

            <!-- Content -->
            <section class="py-5">
                <div class="container py-4">
                    <div class="row g-5">

                        <!-- CHECKOUT SIDEBAR [ORDER SUMMARY]-->
                        <Layout:Sidebar ID="sidebar" runat="server" />

                        <div class="col-lg-9">
                            <p class="lead mb-4">
                                Please note that features & specifications may vary per country and are subject to change without prior notification.<br />
                                Images are for illustration purposes only and the accessories are sold separately. Features and Specifications are accurate as of commercial launch but may be subject to change without prior notification.
                            </p>
                            <div class="text-center mb-5"><a class="text-muted text-center small text-uppercase text-decoration-underline" href="#details">Scroll to product details, material &amp; care and sizing</a></div>
                            <div class="row gy-5 align-items-stretch">
                                <!-- PRODUCTS SLIDER-->
                                <div class="col-lg-6">
                                    <div class="swiper-container shop-detail-slider">
                                        <div class="swiper-wrapper">
                                            <% 
                                                string html = @"                                                    
                                                    <div class='swiper-slide'>
                                                        <img class='img-fluid' alt='@Title' src='../Image/@Image' runat='server'/>
                                                    </div>";
                                                foreach (System.Data.DataRow dataRow in dtTelevision.Rows)
                                                {
                                                    Response.Write(html.Replace("@Title", dataRow["Title"].ToString()).Replace("@Image", dataRow["Image"].ToString()));
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <!-- FPRODUCT INFO-->
                                <div class="col-lg-6 d-flex flex-column justify-content-between">
                                    <div class="p-4 p-lg-5 border mb-5 bg-light">
                                        <h3 class="text-center mb-3">Available in stock</h3>
                                        <select class="form-select js-sizes mb-5" data-customclass="bg-white rounded-0 border-2 text-uppercase border-gray-200">
                                            <option value="">Buy for yourself</option>
                                            <option value="">Buy like a gift</option>
                                        </select>
                                        <p class="h1 text-muted mb-4 text-center fw-normal">
                                            <asp:Label ID="lbPrice" runat="server" Text=""></asp:Label>
                                        </p>
                                        <p class="text-center">
                                            <asp:LinkButton ID="lbtnAddToCart" runat="server" CssClass="btn btn-outline-primary"><i class="fas fa-shopping-cart"></i>Add to cart</asp:LinkButton>
                                            <button class="btn btn-secondary" type="submit" data-bs-toggle="tooltip" data-placement="top" title="Add to wishlist"><i class="far fa-heart"></i></button>
                                        </p>
                                    </div>
                                    <!-- SLIDERS THUMBS -->
                                    <div class="swiper-container shop-detail-slider-thumbs w-100">
                                        <div class="swiper-wrapper">
                                            <% 
                                                html = @"                                                    
                                                    <div class='swiper-slide swiper-slide-thumb flex-fill'>
                                                        <img class='img-fluid' alt='@Title' src='../Image/@Image' runat='server'/>
                                                    </div>";
                                                foreach (System.Data.DataRow dataRow in dtTelevision.Rows)
                                                {
                                                    Response.Write(html.Replace("@Title", dataRow["Title"].ToString()).Replace("@Image", dataRow["Image"].ToString()));
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- PRODUCT INFO-->
                            <div id="details">
                                <div class="border-top border-bottom py-4 px-0 px-lg-4 my-5">
                                    <h4>Television detail</h4>
                                    <asp:Label ID="lbDescription" runat="server" Text=""></asp:Label>
                                    <figure class="p-4 bg-light border-start border-4 border-primary">
                                        <blockquote class="blockquote">
                                            <p>The best care of your life.</p>
                                        </blockquote>
                                        <figcaption class="blockquote-footer mb-0">Our shop's                      
                                            <cite title="Source Title">CEO</cite>
                                        </figcaption>
                                    </figure>
                                </div>
                                <!-- SOCIAL SHARE ITEM-->
                                <div class="py-4 border-top border-bottom text-center mb-5">
                                    <h4 class="fw-light mb-3">Show it to your friends</h4>
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item"><a class="social-link facebook" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
                                        <li class="list-inline-item"><a class="social-link twitter" href="https://twitter.com/?lang=vi"><i class="fab fa-twitter"></i></a></li>
                                        <li class="list-inline-item"><a class="social-link youtube" href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a></li>
                                        <li class="list-inline-item"><a class="social-link email" href="https://www.google.com/intl/vi/gmail/about/#inbox"><i class="fas fa-envelope"></i></a></li>
                                    </ul>
                                </div>
                                <!-- SIMILAR PRODUCTS-->
                                <div class="row gy-4 mb-5">
                                    <div class="col-lg-3 col-md-6">
                                        <div class="py-4 px-0 px-lg-4 border-top border-bottom">
                                            <h3 class="text-uppercase mb-0">You may also like these products</h3>
                                        </div>
                                    </div>
                                    <div class="col-lg-9 col-md-6">
                                    <asp:DataList ID="dtLstSimilar" runat="server" RepeatColumns="3">
                                        <ItemTemplate>
                                            <div class="col-lg-10 col-md-12">
                                                <!-- Product-->
                                                <div class="product h-100">
                                                    <div class="product-image">
                                                        <a href='../Customer/TelevisionDetail.aspx?Id=<%# Eval("Id") %>'>
                                                            <img class="img-fluid" src='<%# "../Image/"+Eval("Image") %>' alt='<%# Eval("Title") %>' style="width: 200px;height:120px; object-fit: cover;" />
                                                        </a>
                                                    </div>
                                                    <div class="py-4 px-3 text-center">
                                                        <h3 class="h5 text-uppercase mb-3"><a class="reset-link" href='../Customer/TelevisionDetail.aspx?Id=<%# Eval("Id") %>'><%# Eval("Title") %></a></h3>
                                                        <p class="mb-0">
                                                            <%# int.Parse(Eval("Price").ToString()).ToString("n0")+"đ" %>
                                                        </p>
                                                    </div>
                                                    <ul class="list-unstyled p-0 ribbon-holder mb-0">
                                                    </ul>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <Layout:Footer ID="footer" runat="server" />

        </div>
    </form>

</body>
</html>
