<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="SaleTelevisionWeb.Admin.ManageUser" MaintainScrollPositionOnPostback="true" %>


<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title" runat="server">Manage User Account</title>
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
                                <asp:TemplateField HeaderText="Id">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Username">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbUsername" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Password">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Role">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbRole" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>                             
                                <asp:TemplateField HeaderText="Command">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnEdit" runat="server" CssClass="btn btn-link p-0" CommandName="Edit"><i class="fas fa-pencil-alt m-2"></i></asp:LinkButton>
                                        <asp:LinkButton ID="lbtnDelete" runat="server" CssClass="btn btn-link p-0" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');"><i class="fas fa-trash-alt m-2"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lbtnUpdate" runat="server" CssClass="btn btn-link p-0" CommandName="Update"><i class="fas fa-save m-2"></i></asp:LinkButton>
                                        <asp:LinkButton ID="lbtnCancel" runat="server" CssClass="btn btn-link p-0" CommandName="Cancel"><i class="fas fa-times m-2"></i></asp:LinkButton>
                                    </EditItemTemplate>
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
