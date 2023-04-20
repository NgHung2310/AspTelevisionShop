<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SaleTelevisionWeb.Customer.Cart" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title" runat="server">Cart</title>
</head>
<body>
    <form id="formCart" runat="server">
        <div class="wide" id="all">

            <!-- Header -->
            <Layout:Header ID="header" runat="server" />

            <!-- SHOP BASKET SECTION-->
            <section class="py-5">
                <div class="container py-4">
                    <div class="row">
                        <div class="col-lg-9">
                            <!-- CART PRODUCTS TABLE-->
                            <div class="table-responsive">
                                <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="false" Width="100%" DataKeyNames="Id" CssClass="table text-nowrap" BorderStyle="None" ShowFooter="true">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Television">
                                            <ItemTemplate>
                                                <a href='../Customer/TelevisionDetail.aspx?Id=<%# Eval("TelevisionId") %>'>
                                                    <img class="img-fluid flex-shrink-0" src='<%# "../Image/" + Eval("Image") %>' alt='<%# Eval("Title") %>' style="width: 80px; height: 50px; object-fit: cover;">
                                                </a>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <a class="align-middle border-gray-300 py-3" href='../Customer/TelevisionDetail.aspx?Id=<%# Eval("TelevisionId") %>'>
                                                    <asp:Label ID="lbTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label></a>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                                            <FooterTemplate>
                                                <span class="h4 text-gray-700">Total bill</span>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text='<%# Eval("Quantity") %>' AutoPostBack="true" OnTextChanged="txtQuantity_TextChanged" CssClass="align-middle border-gray-300 py-3 form-control" Width="70px" Height="40px"></asp:TextBox>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                <asp:Label ID="txtPrice" runat="server" Text='<%# int.Parse(Eval("Price").ToString()).ToString("n0")+"đ" %>' CssClass="align-middle border-gray-300 py-3"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total">
                                            <ItemTemplate>
                                                <asp:Label ID="txtTotal" runat="server" Text='<%# int.Parse(Eval("Total").ToString()).ToString("n0")+"đ" %>' CssClass="align-middle border-gray-300 py-3"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                            <FooterTemplate>
                                                <span class="h4 text-gray-700 text-end">
                                                    <asp:Label ID="lbTotalBill" runat="server" Text=""></asp:Label></span>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CssClass="btn btn-link p-0" CommandName='<%# Eval("Id") %>' OnClick="lbtnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this item?');"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <!-- NAVIGATION FOOTER-->
                            <div class="row gx-lg-0 align-items-center bg-light px-4 py-3 text-center mb-5">
                                <div class="col-md-6 text-md-start py-1"><a class="btn btn-secondary my-1" href="../Customer/TelevisionList.aspx"><i class="fas fa-angle-left me-1"></i>Continue shopping</a></div>
                                <div class="col-md-6 text-md-end py-1">
                                    <asp:LinkButton ID="lbtnPlaceTheOrder" runat="server" OnClientClick="return confirm('Are you sure this order?');" CssClass="btn btn-outline-primary my-1" >Place the order<i class="fas fa-angle-right ms-1"></i></asp:LinkButton>
                                </div>
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
                                                            <img class="img-fluid" src='<%# "../Image/"+Eval("Image") %>' alt='<%# Eval("Title") %>' style="width: 200px; height: 120px; object-fit: cover;" />
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
                        <!-- CHECKOUT SIDEBAR [ORDER SUMMARY]-->
                        <div class="col-lg-3">
                            <div class="mb-5">
                                <div class="p-4 bg-gray-200">
                                    <h3 class="text-uppercase mb-0">Order summary</h3>
                                </div>
                                <div class="bg-light py-4 px-3">
                                    <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <tbody class="text-sm">
                                                <tr>
                                                    <th class="text-muted"><span class="d-block py-1 fw-normal">Order subtotal</span></th>
                                                    <th><span class="d-block py-1 fw-normal text-end"><asp:Label ID="lbTotalSumary" runat="server" Text=""></asp:Label></span></th>
                                                </tr>
                                                <tr>
                                                    <th class="text-muted"><span class="d-block py-1 fw-normal">Shipping and handling</span></th>
                                                    <th><span class="d-block py-1 fw-normal text-end"><asp:Label ID="lbShipSumary" runat="server" Text=""></asp:Label></span></th>
                                                </tr>
                                                <tr>
                                                    <th class="text-muted"><span class="d-block py-1 fw-normal">VAT</span></th>
                                                    <th><span class="d-block py-1 fw-normal text-end"><asp:Label ID="lbVatSumary" runat="server" Text=""></asp:Label></span></th>
                                                </tr>
                                                <tr class="total">
                                                    <td class="py-3 border-bottom-0 text-muted"><span class="lead fw-bold">Total</span></td>
                                                    <th class="py-3 border-bottom-0"><span class="lead fw-bold text-end"><asp:Label ID="lbTotalBillSumary" runat="server" Text=""></asp:Label></span></th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-4">
                                <div class="p-4 bg-gray-200">
                                    <h4 class="text-uppercase mb-0">Coupon code</h4>
                                </div>
                                <div class="bg-light py-4 px-3">
                                    <p class="text-muted">If you have a coupon code, please enter it in the box below.</p>
                    
                                        <div class="input-group">
                                            <input class="form-control" type="text"/>
                                            <button class="btn btn-primary" type="submit" onclick="alert('Coupon code is not correct!')"><i class="fas fa-gift"></i></button>
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
