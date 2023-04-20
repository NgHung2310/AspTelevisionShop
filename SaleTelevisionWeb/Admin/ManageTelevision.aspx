<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageTelevision.aspx.cs" Inherits="SaleTelevisionWeb.Admin.ManageTelevision" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title" runat="server">Manage Television</title>
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
                <div class="container py-4">
                    <!-- FORM-->
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div class="mb-3">
                                <asp:Label ID="lbId" runat="server" Text="Id" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="lbTitle" runat="server" Text="Title" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="lbImage" runat="server" Text="Image" CssClass="form-label"></asp:Label>
                                <asp:FileUpload ID="fulImage" runat="server" CssClass="form-control" />
                            </div>
                            <div class="row">
                                <div class="col-md-12 mb-3 col-lg-6">
                                    <asp:Label ID="lbSize" runat="server" Text="Size" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtSize" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mb-3 col-lg-6">
                                    <asp:Label ID="lbResolution" runat="server" Text="Resolution" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtResolution" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mb-3 col-lg-6">
                                    <asp:Label ID="lbBrandname" runat="server" Text="Brandname" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtBrandname" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mb-3 col-lg-6">
                                    <asp:Label ID="lbType" runat="server" Text="Type" CssClass="form-label"></asp:Label>
                                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="lbPrice" runat="server" Text="Price" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <div class="col-md-12 mb-3 col-lg-12">
                                <asp:Label ID="lbDescription" runat="server" Text="Description" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Height="450px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!-- NAVIGATION FOOTER-->
                    <div class="align-items-center bg-light px-4 py-3 text-center">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:LinkButton ID="lbtnClear" runat="server" CssClass="btn btn-lg btn-outline-secondary" Width="100%"><i class="fas fa-times me-2"></i>Clear</asp:LinkButton>
                            </div>
                            <div class="col-md-6">
                                <asp:LinkButton ID="lbtnAdd" runat="server" CssClass="btn btn-lg btn-primary" Width="100%"><i class="fas fa-check me-2"></i>Add</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
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
                                <asp:TemplateField HeaderText="Title">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTitle" runat="server" Text='<%# Eval("Title") %>' CssClass="form-control"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <img id="imgTelevision" runat="server" class="img-fluid flex-shrink-0" src='<%# "../Image/" + Eval("Image") %>' alt='<%# Eval("Title") %>' style="width: 80px; height: 50px; object-fit: cover;" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:FileUpload ID="fulImage" runat="server" Width="150px" CssClass="form-control"/><br />
                                        <img id="imgTelevision" runat="server" class="img-fluid flex-shrink-0" src='<%# "../Image/" + Eval("Image") %>' alt='<%# Eval("Title") %>' style="width: 80px; height: 50px; object-fit: cover;" />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Size">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbSize" runat="server" Text='<%# Eval("Size") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSize" runat="server" Text='<%# Eval("Size") %>' CssClass="form-control"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Resolution">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbResolution" runat="server" Text='<%# Eval("Resolution") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtResolution" runat="server" Text='<%# Eval("Resolution") %>' CssClass="form-control"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Brandname">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbBrandname" runat="server" Text='<%# Eval("Brandname") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtBrandname" runat="server" Text='<%# Eval("Brandname") %>' CssClass="form-control"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbType" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Price">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbPrice" runat="server" Text='<%# int.Parse(Eval("Price").ToString()).ToString("n0")+"đ" %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Eval("Price") %>' CssClass="form-control"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" ID="lbDescription" runat="server" Text='<%# Eval("Description").ToString().Length>=10?Eval("Description").ToString().Substring(0,10)+"...":Eval("Description") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDescription" runat="server" Text='<%# Eval("Description") %>' CssClass="form-control" TextMode="MultiLine" Width="200px"></asp:TextBox>
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
