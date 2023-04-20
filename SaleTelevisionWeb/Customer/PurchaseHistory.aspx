<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="SaleTelevisionWeb.Customer.PurchaseHistory1" %>


<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title" runat="server">Manage Customer Order</title>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .GridPager a, .GridPager span {
            display: block;
            height: 42px;
            width: 35px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            font-family: "Roboto", Helvetica, Arial, sans-serif;
            background-color: #fff;
            color: #969696;
            border: none;
            display: flex;
            justify-content: center;
            align-items: center;
        }

            .GridPager a:hover {
                opacity: 0.5;
            }

        .GridPager span {
            font-family: "Roboto", Helvetica, Arial, sans-serif;
            border: none;
            background-color: #4fbfa8;
            color: #fff;
            border: 1px solid #4fbfa8;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Holder -->
        <asp:Label ID="lbHolder" runat="server" Text="" Visible="false"></asp:Label>
        <div class="wide" id="all">
            <!-- Header -->
            <Layout:Header ID="header" runat="server" />
            <!-- MANAGE-->
            <section class="py-5">

                <!-- LIST -->
                <div class="container py-4">
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:LinkButton ID="lbtnSearch" runat="server" CssClass="btn btn-primary"><i class="fa fa-search me-2"></i>Search</asp:LinkButton>
                    </div>
                    <div class="table-responsive">
                        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" Width="100%" DataKeyNames="Id" CssClass="table text-nowrap" BorderStyle="None" AllowPaging="true" PageSize="10">
                            <HeaderStyle HorizontalAlign="Center" />
                            <Columns>
                                <asp:TemplateField HeaderText="Television">
                                    <ItemTemplate>
                                        <a href='../Customer/TelevisionDetail.aspx?Id=<%# Eval("TelevisionId") %>'>
                                            <img class="img-fluid flex-shrink-0" src='<%# "../Image/" + Eval("TelevisionImage") %>' alt='<%# Eval("TelevisionTitle") %>' style="width: 80px; height: 50px; object-fit: cover;">
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <a href='../Customer/TelevisionDetail.aspx?Id=<%# Eval("TelevisionId") %>'>
                                            <asp:Label CssClass="form-label" ID="lbTelevision" runat="server" Text='<%# Eval("TelevisionTitle") %>'></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbTime" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbTotal" runat="server" Text='<%# int.Parse(Eval("Total").ToString()).ToString("n0")+"đ" %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbType" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle CssClass="active" />

                            <%-- Carousel wrapper   --%>
                            <PagerSettings Mode="NumericFirstLast" Position="Bottom" PageButtonCount="3" />
                            <PagerStyle Height="50px" VerticalAlign="Middle" HorizontalAlign="Center" CssClass="GridPager" />
                        </asp:GridView>
                    </div>
                </div>
            </section>
            <!-- Footer -->
            <Layout:Footer ID="footer" runat="server" />

        </div>
    </form>
</body>
</html>
