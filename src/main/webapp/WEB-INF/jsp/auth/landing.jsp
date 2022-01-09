<%@include file="/WEB-INF/jspf/header.jspf" %>
<body>
<div id="landing">

    <%--    <div class="header">--%>
    <%--        <a href="#" class="logo">Playphone Developers</a>--%>
    <%--        <a href="#" class="button">Create Account</a>--%>
    <%--        <a href="#" class="login">Login</a>--%>
    <%--    </div>--%>
    <section>
        <div style="" class="main-banner" id="top">
            <div style="opacity: 0.6;background-color: rgb(6, 86, 114);position: absolute;width: 100%;height: 81vh;text-align: center">
            </div>
            <video autoplay muted loop id="bg-video">
                <source src="/resources/dist/img/Home-Page-background-video.mp4" type="video/mp4"/>
            </video>


        </div>

    </section>


    <div class="menu">

        <a href="/users/loginView">Book Your Reservation</a>
        <a href="/users/loginView">Publish Your Wash Center</a>
        <a href="#features">About Us</a>
    </div>

    <div style="margin-top: 30px" class="row" id="washCenterList">
<%--        <div >--%>
<%--            --%>
<%--        </div>--%>

    </div>


    <section style="background-image: url('/resources/dist/img/about.jpg');background-size: cover" id="features">
        <div style="background-color:rgb(6, 86, 114);position: absolute;width: 100%;height: 81%;opacity: 0.5"></div>
        <div style="color: white;" class="container">
            <div class="col-md-12 text-center wow fadeInUp">
                <h3 style="padding-top: 50px" class="section-title">About our Company</h3>
                <h1 class="subheading"><b>Sri Lanka's only Car Wash App</b> </h1> </br></br>
            </div>
            <div class="row features-row wow fadeInUp">
                <div class="col-md-4 col-sm-12 feature-column">
                    <div class="feature-icon">
                        <i class="icon-eyeglasses size-2x highlight"></i>
                        <i class="icon-eyeglasses back-icon"></i>
                    </div>
                    <div class="feature-info">
                        <h4>Founder and Objective</h4>
                        <p class="feature-description">Washing Love was founded by Mr. Sahan Pradeepa who saw a need in the industry for an integrated
                            Point-of-sale, and Marketing system that would not only help car wash owners attract new business,
                            but also get current customers to wash with them more often.
                        </p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 feature-column">
                    <div class="feature-icon">
                        <i class="icon-lock-open size-2x highlight"></i>
                        <i class="icon-lock-open back-icon"></i>
                    </div>
                    <div class="feature-info">
                        <h4>We only charge you after the service. A dedicated support team will be here in case anything goes
                            wrong</h4>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 feature-column">
                    <div class="feature-icon">
                        <i class="icon-energy size-2x highlight"></i>
                        <i class="icon-energy back-icon"></i>
                    </div>
                    <div class="feature-info">
                        <h4>We're Wash Doctors. We BEAT your queues and Lowest price in Sri Lanka</h4>
                    </div>
                </div>
            </div>
            <div class="row wow fadeInUp">
                <div class="col-md-4 col-sm-12 feature-column">
                    <div class="feature-icon">
                        <i class="icon-settings size-2x highlight"></i>
                        <i class="icon-settings back-icon"></i>
                    </div>
                    <div class="feature-info">
                        <h4>Our Detailers are experienced, insured, and highly recommended by our customers.</h4>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 feature-column">
                    <div class="feature-icon">
                        <i class="icon-book-open size-2x highlight"></i>
                        <i class="icon-book-open back-icon"></i>
                    </div>
                    <div class="feature-info">
                        <h4>You don't need to be there. Relax while we wash your Car</h4>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 feature-column">
                    <div class="feature-icon">
                        <i class="icon-support size-2x highlight"></i>
                        <i class="icon-support back-icon"></i>
                    </div>
                    <div class="feature-info">
                        <h4>Choose your own hours. Booking in 30 seconds..</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="contact" style="padding-top: 90px; padding-bottom: 80px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h3 class="section-title wow fadeInUp">Contact us</h3>
                    <p class="subheading wow fadeInUp"> Let's Work Together. </p>
                    <h6>+94 778712353</h6>
                    <h6>washinglovesrilanka@gmail.com</h6>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i
                            class="far fa-envelope"></i></button>

                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">E-mail</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group contactUs">
                                            <label for="name" class="col-form-label">Name:</label>
                                            <input type="text" class="form-control" id="name">
                                        </div>
                                        <div class="form-group contactUs">
                                            <label for="email" class="col-form-label">E-mail:</label>
                                            <input type="text" class="form-control" id="email">
                                        </div>
                                        <div class="form-group contactUs">
                                            <label for="subject" class="col-form-label">Subject:</label>
                                            <input type="text" class="form-control" id="subject">
                                        </div>
                                        <div class="form-group contactUs">
                                            <label for="message" class="col-form-label">Message:</label>
                                            <textarea class="form-control" id="message"></textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button onclick="sendEmail()" id="sendBtn"  type="button" class="btn btn-primary">
                                        <span class="spinner-border spinner-border-sm saveBtn" role="status" aria-hidden="true"
                                              style="display: none"></span>
                                        Send E-mail</button>
                                </div>
                                <span id="msg"></span>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </section>


</div>
</body>

<%@include file="/WEB-INF/jspf/footer.jspf" %>
<script>
    $(function () {


        $.ajax({
            url: '/washingLove/topWashcenters',
            method: 'get',
            contentType: "application/json",
            success: function (result) {
                for (var obj of result.data) {
                    var rateHtml = '';
                    if (obj.totalRate == 0) {
                        rateHtml = '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>';

                    } else if (obj.totalRate == 1) {
                        rateHtml = '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>';
                    } else if (obj.totalRate == 2) {
                        rateHtml = '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>';
                    } else if (obj.totalRate == 3) {
                        rateHtml = '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star"></span>' +
                            '<span class="fa fa-star"></span>';
                    } else if (obj.totalRate == 4) {
                        rateHtml = '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star"></span>';
                    } else {
                        rateHtml = '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>' +
                            '<span class="fa fa-star checked"></span>';
                    }

                    $('#washCenterList').append('<div class="feature col-md-3">\n' +
                        '            <div class="card" style="width: 18rem;">\n' +
                        '                <img src="/resources/dist/img/car.jpg" alt="...">\n' +
                        '                <div class="card-body" data-toggle="modal" data-target="#exampleModalCenter">\n' +
                        '                    <h5 style="font-weight: bold;display: block" class="card-title">'+obj.name+'</h5>\n' +
                        '                    <h6 class="card-text">'+obj.city+'</h6>\n' +
                        '                    <div>\n' +
                        '                        '+rateHtml+'\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '        </div>');
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    });

    function sendEmail() {

        $('#sendBtn').prop('disabled', true)
        $('.spinner-border').show();
        $.ajax({
            url: '/washingLove',
            method: 'post',
            contentType: "application/json",
            data: JSON.stringify({
                name: $("#name").val(),
                email: $("#email").val(),
                subject: $("#subject").val(),
                message: $("#message").val()
            }),
            success: function (result) {
                if(result.code==200){
                    clear()
                    $('.spinner-border').hide();
                    $('#sendBtn').prop('disabled', false)
                    $('#msg').append('<label style="color: #00A7AA">Email send success</label>');
                }else {
                    $('.spinner-border').hide();
                    $('#sendBtn').prop('disabled', false)
                    $('#msg').append('<label style="color: red">Email send fail</label>');
                }

            },
            error: function (err) {
                $('.spinner-border').hide();
                $('#sendBtn').prop('disabled', false)
                $('#msg').append('<label style="color: red">Email send fail</label>');
            }
        });
    }
    function clear() {
        $('#name').val('');
        $('#email').val('');
        $('#subject').val('');
        $('#message').val('');
    }
</script>
