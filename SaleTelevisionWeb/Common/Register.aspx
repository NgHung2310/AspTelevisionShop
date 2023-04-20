<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SaleTelevisionWeb.Common.Register" %>

<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title" runat="server">Register</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <Layout:Header ID="header" runat="server" />
        <!-- Section: Design Block -->
        <section>
            <!-- Jumbotron -->
            <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
                <div class="container">
                    <div class="row gx-lg-5 align-items-center">
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <h1 class="my-5 display-3 fw-bold ls-tight">The best offer
                                <br />
                                <span class="text-primary">for your business</span>
                            </h1>

                        </div>
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <div class=" py-5 px-md-5">
                                <!-- Name input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label">Full name</label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                                </div>

                                <!-- 2 column grid layout with text inputs for the first and last names -->
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label">Address</label>
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter address"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label">Phone number</label>
                                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter phone number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <!-- Username input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label">Username</label>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label">Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                                </div>

                                <!-- Cofirm password input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label">Cofirm password</label>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Enter confirm password" TextMode="Password"></asp:TextBox>
                                </div>


                                <!-- Submit button -->
                                <div class="container">
                                    <div class="row">
                                        <div class="col text-center">
                                            <asp:Button ID="btnRegister" runat="server" Text="Sign up" CssClass="btn btn-primary btn-block mb-4" />
                                        </div>
                                        <p class="small fw-bold mt-2 pt-1 mb-0">
                                            Already have an account?<asp:LinkButton ID="lbtnSignIn" runat="server" CssClass="link-danger">Sign In</asp:LinkButton>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- Footer -->
        <Layout:Footer ID="footer" runat="server" />
    </form>
</body>
</html>
