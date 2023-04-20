<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="SaleTelevisionWeb.Customer.UserInfomation" %>


<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title" runat="server">User Profile</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Holder -->
        <asp:Label ID="lbHolder" runat="server" Text="" Visible="false"></asp:Label>
        <div class="wide" id="all">
            <!-- Header -->
            <Layout:Header ID="header" runat="server" />
            <!-- USER INFO SECTION-->
            <section class="py-5">
                <div class="container py-4">
                    <!-- FORM-->
                    <div class="row">
                        <div class="col-md-8 mb-4">
                            <p class="lead mb-4">Change your personal profile or your password here.</p>
                            <p class="text-muted mb-5"></p>
                            <div class="border-top mb-5 pt-4">
                                <div class="col-12 mb-4">
                                    <h3 class="text-uppercase lined">Profile</h3>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lbUsername" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lbName" runat="server" Text="Name" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-3 col-lg-6">
                                        <asp:Label ID="lbAddress" runat="server" Text="Address" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12 mb-3 col-lg-6">
                                        <asp:Label ID="lbPhone" runat="server" Text="Phone" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="border-top mb-5 pt-4">
                                <div class="col-12 mb-4">
                                    <h3 class="text-uppercase lined">Change password</h3>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-3 col-lg-6">
                                        <asp:Label ID="lbNewPassword" runat="server" Text="NewPassword" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12 mb-3 col-lg-6">
                                        <asp:Label ID="lbConfirmPassword" runat="server" Text="ConfirmPassword" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lbCurrentPassword" runat="server" Text="CurrentPassword" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="col-md-12 mb-3 col-lg-12">
                                <img class="img-fluid flex-shrink-0" src='../Image/imgProfile.jpg' style="object-fit: cover;" />
                            </div>
                        </div>
                    </div>
                    <!-- NAVIGATION FOOTER-->
                    <div class="align-items-center bg-light px-4 py-3 text-center">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:LinkButton ID="lbtnBackToHome" runat="server" CssClass="btn btn-lg btn-outline-secondary" Width="100%"><i class="fas fa-times me-2"></i>Back To Home</asp:LinkButton>
                            </div>
                            <div class="col-md-6">
                                <asp:LinkButton ID="lbtnSaveChanges" runat="server" CssClass="btn btn-lg btn-primary" Width="100%"><i class="fas fa-save me-2"></i>Save Changes</asp:LinkButton>
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
