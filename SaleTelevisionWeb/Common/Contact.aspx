<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SaleTelevisionWeb.Common.Contact" %>

<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title" runat="server">Contact</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <Layout:Header ID="header" runat="server" />
        <section class="py-5">
            <div class="container py-4">
                <h2 class="text-uppercase lined mb-4">We are here to help you</h2>
                <p class="lead mb-5">Are you curious about something? Do you have some kind of problem with our products? As am hastily invited settled at limited civilly fortune me. Really spring in extent an by. Judge but built gay party world. Of so am he remember although required. Bachelor unpacked be advanced at. Confined in declared marianne is vicinity.</p>
                <p class="text-sm mb-5">Please feel free to contact us, our customer service center is working for you 24/7.</p>
                <div class="row gy-5 mb-5">
                    <div class="col-lg-4 block-icon-hover text-center">
                        <div class="icon icon-outlined icon-outlined-primary icon-thin mx-auto mb-3"><i class="fas fa-map-marker-alt"></i></div>
                        <h4 class="text-uppercase mb-3">Address</h4>
                        <p class="text-gray-600 text-sm">UNETI<br/>
                            218 Linh Nam, Vinh Hung<br/>
                            Hai Ba Trung, <strong>Ha Noi</strong></p>
                    </div>
                    <div class="col-lg-4 block-icon-hover text-center">
                        <div class="icon icon-outlined icon-outlined-primary icon-thin mx-auto mb-3"><i class="fas fa-map-marker-alt"></i></div>
                        <h4 class="text-uppercase mb-3">Call center</h4>
                        <p class="text-gray-600 text-sm">This number is toll free if calling from Great Britain otherwise we advise you to use the electronic form of communication.</p>
                        <p class="text-gray-600 text-sm"><strong>0378200186</strong></p>
                    </div>
                    <div class="col-lg-4 block-icon-hover text-center">
                        <div class="icon icon-outlined icon-outlined-primary icon-thin mx-auto mb-3"><i class="fas fa-map-marker-alt"></i></div>
                        <h4 class="text-uppercase mb-3">Electronic support</h4>
                        <p class="text-gray-600 text-sm">Please feel free to write an email to us or to use our electronic ticketing system.</p>
                        <ul class="list-unstyled text-sm mb-0">
                            <li><strong><a href="mailto:">sv.19103100192@uneti.edu.vn</a></strong></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- MAP SECTION-->
        <div class="border-top border-primary" id="contactMap">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2634.153774137148!2d105.87497841562117!3d20.98237316034363!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135afd765487289%3A0x21bd5839ba683d5f!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBLaW5oIFThur8gLSBL4bu5IFRodeG6rXQgQ8O0bmcgTmdoaeG7h3A!5e0!3m2!1svi!2s!4v1679971062381!5m2!1svi!2s" style="border:0; width:100%; height:100%" allowfullscreen="true" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <!-- Footer -->
        <Layout:Footer ID="footer" runat="server" />
    </form>
</body>
</html>
