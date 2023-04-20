<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TelevisionList.aspx.cs" Inherits="SaleTelevisionWeb.Customer.TelevisionList" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<%@ Register Src="~/Customer/Sidebar.ascx" TagName="Sidebar" TagPrefix="Layout" %>
<!DOCTYPE html>
<html>
<head>
    <title runat="server" id="title">Shopping</title>
</head>
<body>
    <form runat="server" id="formTelevisionList">
        <div class="wide" id="all">
            <!-- Header -->
            <Layout:Header ID="header" runat="server" />

            <!-- SHOP SECTION-->
            <section class="py-5">
                <div class="container py-4">
                    <div class="row g-5">

                        <!-- SHOP SIDEBAR-->
                        <Layout:Sidebar ID="sidebar" runat="server" />

                        <!-- SHOP LISTING-->
                        <div class="col-lg-9">
                            <p class="text-muted lead text-center mb-5">Best things for you.</p>
                            <div class="input-group mb-3">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" ></asp:TextBox>
                                <asp:LinkButton ID="lbtnSearch" runat="server" CssClass="btn btn-primary"><i class="fa fa-search me-2"></i>Search</asp:LinkButton>
                            </div>
                            <div class="row gy-5 align-items-stretch">
                                <asp:DataList ID="dtLstTelevision" runat="server" RepeatColumns="3" Width="100%" CellPadding="10" RepeatDirection="Horizontal" >
                                    <ItemTemplate>
                                        <div class="col-lg-12 col-md-12">
                                            <div class="product h-100">
                                                <div class="product-image">
                                                    <a href='../Customer/TelevisionDetail.aspx?Id=<%# Eval("Id") %>'>
                                                        <img class="img-fluid" src='<%# "../Image/" + Eval("Image") %>' alt='<%# Eval("Title") %>' style="width: 300px; height: 200px; object-fit: cover;" loading="lazy">
                                                    </a>
                                                </div>
                                                <div class="py-4 px-3 text-center">
                                                    <h3 class="h5 text-uppercase mb-3"><a class="reset-link" href='../Customer/TelevisionDetail.aspx?Id=<%# Eval("Id") %>'><%# Eval("Title") %></a></h3>
                                                    <p class="mb-0">
                                                        <del class="text-gray-500 me-2"><%# (int.Parse(Eval("Price").ToString())*1.5).ToString("n0")+"đ" %> </del>
                                                        <%# int.Parse(Eval("Price").ToString()).ToString("n0")+"đ" %>
                                                    </p>
                                                </div>
                                                <ul class="list-unstyled p-0 ribbon-holder mb-0">
                                                    <li class="mb-1">
                                                        <div class="ribbon sale ribbon-primary">SALE</div>
                                                    </li>
                                                    <li class="mb-1">
                                                        <div class="ribbon new ribbon-info">NEW</div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>

                        </div>

                        <!-- Carousel wrapper -->

                        <%--                            <div class="text-center mb-5"><a class="btn btn-outline-primary" href="#"><i class="fas fa-angle-down me-2"></i>Load more</a></div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                                    <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                </ul>
                            </nav>--%>
                    </div>

                </div>

            </section>

            <!-- Footer -->
            <Layout:Footer ID="footer" runat="server" />

        </div>
    </form>
</body>
</html>
