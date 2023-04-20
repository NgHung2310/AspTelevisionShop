<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="SaleTelevisionWeb.Common.Member" %>

<%@ Register Src="~/Common/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/Common/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <Layout:Header ID="header" runat="server" />

        <section class="py-5">
            <div class="container py-4">
                <header class="mb-5">
                    <h2 class="text-uppercase lined mb-4">Who is responsible for universal?</h2>
                    <p class="lead"></p>
                </header>
                <div class="mb-5">
                    <div class="row gy-4">
                        <!-- Team member  -->
                    <div class="col-lg-3 col-md-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xxl p-2 mb-4" src="../Image/avt.jpg" alt="Nguyen Viet Hung"/></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="#">Nguyen Viet Hung</a></h3>
                        <p class="text-muted small text-uppercase">Team leader</p>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a class="social-link facebook" href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li class="list-inline-item"><a class="social-link twitter" href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a class="social-link youtube" href="#"><i class="fab fa-youtube"></i></a></li>
                            <li class="list-inline-item"><a class="social-link email" href="#"><i class="fas fa-envelope"></i></a></li>
                        </ul>
                        <p class="small small text-gray-600">No job is hard if one’s will is enduring; Even digging down the Mountain, or filling up the Ocean is done by one’s will</p>
                    </div>
                    <!-- Team member  -->
                    <div class="col-lg-3 col-md-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xxl p-2 mb-4" src="../Image/avt.jpg" alt="Tran Dinh Anh"/></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="#">Tran Dinh Anh</a></h3>
                        <p class="text-muted small text-uppercase">Developer</p>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a class="social-link facebook" href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li class="list-inline-item"><a class="social-link twitter" href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a class="social-link youtube" href="#"><i class="fab fa-youtube"></i></a></li>
                            <li class="list-inline-item"><a class="social-link email" href="#"><i class="fas fa-envelope"></i></a></li>
                        </ul>
                        <p class="small small text-gray-600">No job is hard if one’s will is enduring; Even digging down the Mountain, or filling up the Ocean is done by one’s will</p>
                    </div>
                    <!-- Team member  -->
                    <div class="col-lg-3 col-md-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xxl p-2 mb-4" src="../Image/avt.jpg" alt="Hoang Pho Kien"/></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="#">Hoang Pho Kien</a></h3>
                        <p class="text-muted small text-uppercase">Developer</p>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a class="social-link facebook" href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li class="list-inline-item"><a class="social-link twitter" href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a class="social-link youtube" href="#"><i class="fab fa-youtube"></i></a></li>
                            <li class="list-inline-item"><a class="social-link email" href="#"><i class="fas fa-envelope"></i></a></li>
                        </ul>
                        <p class="small small text-gray-600">No job is hard if one’s will is enduring; Even digging down the Mountain, or filling up the Ocean is done by one’s will</p>
                    </div>
                    <!-- Team member  -->
                    <div class="col-lg-3 col-md-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xxl p-2 mb-4" src="../Image/avt.jpg" alt="Tran Dinh Tri"></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="#">Tran Dinh Tri</a></h3>
                        <p class="text-muted small text-uppercase">Developer</p>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a class="social-link facebook" href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li class="list-inline-item"><a class="social-link twitter" href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a class="social-link youtube" href="#"><i class="fab fa-youtube"></i></a></li>
                            <li class="list-inline-item"><a class="social-link email" href="#"><i class="fas fa-envelope"></i></a></li>
                        </ul>
                        <p class="small small text-gray-600">No job is hard if one’s will is enduring; Even digging down the Mountain, or filling up the Ocean is done by one’s will</p>
                    </div>
                    </div>
                </div>
                <div class="row gy-4">
                    <!-- Team member   -->
                    <div class="col-lg-2 col-md-3 col-sm-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xl p-1 mb-4" src="../Image/avt.jpg" alt="Han Solo"></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="team-member.html">Han Solo</a></h3>
                        <p class="text-muted small text-uppercase">Founder</p>
                    </div>
                    <!-- Team member   -->
                    <div class="col-lg-2 col-md-3 col-sm-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xl p-1 mb-4" src="../Image/avt.jpg" alt="Luke Skywalker"></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="team-member.html">Luke Skywalker</a></h3>
                        <p class="text-muted small text-uppercase">CTO</p>
                    </div>
                    <!-- Team member   -->
                    <div class="col-lg-2 col-md-3 col-sm-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xl p-1 mb-4" src="../Image/avt.jpg" alt="Princess Leia"></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="team-member.html">Princess Leia</a></h3>
                        <p class="text-muted small text-uppercase">Team Leader</p>
                    </div>
                    <!-- Team member   -->
                    <div class="col-lg-2 col-md-3 col-sm-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xl p-1 mb-4" src="../Image/avt.jpg" alt="Jabba Hut"></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="team-member.html">Jabba Hut</a></h3>
                        <p class="text-muted small text-uppercase">Lead Developer</p>
                    </div>
                    <!-- Team member   -->
                    <div class="col-lg-2 col-md-3 col-sm-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xl p-1 mb-4" src="../Image/avt.jpg" alt="Han Solo"></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="team-member.html">Han Solo</a></h3>
                        <p class="text-muted small text-uppercase">Founder</p>
                    </div>
                    <!-- Team member   -->
                    <div class="col-lg-2 col-md-3 col-sm-6 text-center">
                        <a href="team-member.html">
                            <img class="avatar avatar-xl p-1 mb-4" src="../Image/avt.jpg" alt="Luke Skywalker"></a>
                        <h3 class="h4 mb-1 text-uppercase"><a class="text-reset" href="team-member.html">Luke Skywalker</a></h3>
                        <p class="text-muted small text-uppercase">CTO</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- TESTIMONIALS SECTION-->
        <section class="py-5 bg-gray-200">
            <div class="container py-4">
                <header class="mb-5">
                    <h2 class="lined lined-center text-uppercase mb-4">What our customers say</h2>
                    <p class="lead text-center">We have worked with many clients and we always like to hear they come out from the cooperation happy and satisfied. Have a look what our clients said about us.</p>
                </header>
                <!-- Testimonials slider-->
                <div class="swiper-container testimonials-slider">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide h-auto mb-5">
                            <div class="p-4 bg-white h-100 d-flex flex-column justify-content-between">
                                <div class="mb-2">
                                    <p class="text-sm text-gray-600">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
                                    <p class="text-sm text-gray-600"></p>
                                </div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <i class="fas fa-quote-left text-primary fa-2x"></i>
                                    <div class="d-flex align-items-center ms-3">
                                        <div class="me-3 text-end">
                                            <h5 class="text-uppercase mb-0">John McIntyre</h5>
                                            <p class="small text-muted mb-0">CEO, transTech</p>
                                        </div>
                                        <img class="avatar p-1 flex-shrink-0" src="../Image/avt.jpg" alt="John McIntyre" width="60">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide h-auto mb-5">
                            <div class="p-4 bg-white h-100 d-flex flex-column justify-content-between">
                                <div class="mb-2">
                                    <p class="text-sm text-gray-600">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. &quot;What's happened to me? &quot; he thought. It wasn't a dream.</p>
                                    <p class="text-sm text-gray-600"></p>
                                </div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <i class="fas fa-quote-left text-primary fa-2x"></i>
                                    <div class="d-flex align-items-center ms-3">
                                        <div class="me-3 text-end">
                                            <h5 class="text-uppercase mb-0">John McIntyre</h5>
                                            <p class="small text-muted mb-0">CEO, transTech</p>
                                        </div>
                                        <img class="avatar p-1 flex-shrink-0" src="../Image/avt.jpg" alt="John McIntyre" width="60">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide h-auto mb-5">
                            <div class="p-4 bg-white h-100 d-flex flex-column justify-content-between">
                                <div class="mb-2">
                                    <p class="text-sm text-gray-600">His room, a proper human room although a little too small, lay peacefully between its four familiar walls.</p>
                                    <p class="text-sm text-gray-600">A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.</p>
                                </div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <i class="fas fa-quote-left text-primary fa-2x"></i>
                                    <div class="d-flex align-items-center ms-3">
                                        <div class="me-3 text-end">
                                            <h5 class="text-uppercase mb-0">John McIntyre</h5>
                                            <p class="small text-muted mb-0">CEO, transTech</p>
                                        </div>
                                        <img class="avatar p-1 flex-shrink-0" src="../Image/avt.jpg" alt="John McIntyre" width="60">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide h-auto mb-5">
                            <div class="p-4 bg-white h-100 d-flex flex-column justify-content-between">
                                <div class="mb-2">
                                    <p class="text-sm text-gray-600">It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad.</p>
                                    <p class="text-sm text-gray-600"></p>
                                </div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <i class="fas fa-quote-left text-primary fa-2x"></i>
                                    <div class="d-flex align-items-center ms-3">
                                        <div class="me-3 text-end">
                                            <h5 class="text-uppercase mb-0">John McIntyre</h5>
                                            <p class="small text-muted mb-0">CEO, transTech</p>
                                        </div>
                                        <img class="avatar p-1 flex-shrink-0" src="../Image/avt.jpg" alt="John McIntyre" width="60">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide h-auto mb-5">
                            <div class="p-4 bg-white h-100 d-flex flex-column justify-content-between">
                                <div class="mb-2">
                                    <p class="text-sm text-gray-600">It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad.</p>
                                    <p class="text-sm text-gray-600"></p>
                                </div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <i class="fas fa-quote-left text-primary fa-2x"></i>
                                    <div class="d-flex align-items-center ms-3">
                                        <div class="me-3 text-end">
                                            <h5 class="text-uppercase mb-0">John McIntyre</h5>
                                            <p class="small text-muted mb-0">CEO, transTech</p>
                                        </div>
                                        <img class="avatar p-1 flex-shrink-0" src="../Image/avt.jpg" alt="John McIntyre" width="60">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <Layout:Footer ID="footer" runat="server" />
    </form>
</body>
</html>
