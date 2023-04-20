<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SaleTelevisionWeb.Common.Login" %>

<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title" runat="server">Sign In</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
    <style>
        .divider:after,
        .divider:before {
            content: "";
            flex: 1;
            height: 1px;
            background: #eee;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <Layout:Header ID="header" runat="server" />
        <section >
            <div class="container h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-2 col-lg-4 m-5">
                        <img src="../Image/imgProfile.jpg" class="img-fluid" alt="Sample image" />
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <div class="divider d-flex align-items-center my-4">
                            <p class="text-center fw-bold mx-3 mb-0">Sign in</p>
                        </div>
                        <!-- Username input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example3">Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control form-control-lg" placeholder="Enter username"></asp:TextBox>
                        </div>
                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <label class="form-label" for="form3Example4">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <!-- Checkbox -->
                            <div class="form-check mb-0">
                                <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                                <label class="form-check-label" for="form2Example3">
                                    Remember me
                                </label>
                            </div>
                            <a href="#!" class="text-body">Forgot password?</a>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg" Style="padding-left: 2.5rem; padding-right: 2.5rem;" />
                            <p class="small fw-bold mt-2 pt-1 mb-0">
                                Don't have an account?
                                <asp:LinkButton ID="lbtnRegister" runat="server" CssClass="link-danger">Register</asp:LinkButton>
                            </p>
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
