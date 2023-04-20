<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="SaleTelevisionWeb.Common.Footer" %>

<footer>
    <!-- MAIN FOOTER-->
    <div class="bg-gray-700 text-white py-4">
        <div class="container py-4">
            <div class="row gy-4">
                <div class="col-lg-4">
                    <h4 class="mb-3 text-uppercase">Contact</h4>
                    <p class="text-uppercase text-sm text-gray-500">
                        <strong>Uneti Ltd.</strong><br>
                        218 Linh Nam Vinh Hung <br> 
                        Hai Ba Trung Ha Noi<br>
                        <strong>Viet Nam</strong>
                    </p>
                </div>
                <div class="col-lg-4">
                    <h4 class="mb-3 text-uppercase">Member</h4>
                    <p class="text-uppercase text-sm text-gray-500">
                        Nguyen Viet Hung<br>
                        Tran Dinh Anh<br>
                        Hoang Pho Kien<br>
                        Tran Dinh Tri
                    </p>
                </div>
                <div class="col-lg-4">
                    <h4 class="mb-3 text-uppercase">About Us</h4>
                    <p class="text-sm text-gray-500">The small team in DHTI13A1HN class, UNETI high school. We have 4 people with so big brain, brave and handsome.</p>
                    <hr>
                    <h4 class="h6 text-uppercase">Join Our Monthly Newsletter</h4>
                    <form>
                        <div class="input-group border mb-3">
                            <input class="form-control bg-none border-0 shadow-0 text-white" type="email" placeholder="Email address" aria-label="Email address" aria-describedby="button-submit">
                            <button class="btn btn-outline-light bg-none border-0" id="button-submit" type="button"><i class="fas fa-paper-plane"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- COPYRIGHTS                -->
    <div class="bg-dark py-4">
        <div class="container">
            <div class="row align-items-cenrer gy-3 text-center">
                <div class="col-md-6 text-md-start">
                    <p class="mb-0 text-sm text-gray-500">&copy; 2023. UNETI / DHTI13A1HN / Team 9 </p>
                </div>
                <div class="col-md-6 text text-md-end">
                    <p class="mb-0 text-sm text-gray-500">Template edited by <a href="https://www.facebook.com/yuexing01/" target="_blank">阮越興</a></p>
                </div>
            </div>
        </div>
    </div>
</footer>


<!-- JavaScript files-->
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vendor/waypoints/lib/noframework.waypoints.js"></script>
<script src="../vendor/swiper/swiper-bundle.min.js"></script>
<script src="../vendor/choices.js/public/assets/scripts/choices.js"></script>
<script src="../js/theme.js"></script>
<script>

    function injectSvgSprite(path) {

        var ajax = new XMLHttpRequest();
        ajax.open("GET", path, true);
        ajax.send();
        ajax.onload = function (e) {
            var div = document.createElement("div");
            div.className = 'd-none';
            div.innerHTML = ajax.responseText;
            document.body.insertBefore(div, document.body.childNodes[0]);
        }
    }

    injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');

</script>
