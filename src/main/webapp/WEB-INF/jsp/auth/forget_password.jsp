<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Washing Love</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.8.55/css/materialdesignicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="/resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="/resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css">
    <link type="text/css" href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.12/css/dataTables.checkboxes.css"
          rel="stylesheet"/>
    <!-- Select2 -->
    <link rel="stylesheet" href="/resources/plugins/select2/css/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
    <!-- Fotorama from CDNJS, 19 KB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="/resources/plugins/sweetalert2/sweetalert2.min.css">
    <%--        <link rel="stylesheet" href="/resources/static/dist/css/newStyles.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/dist/css/customer.css">
    <link rel="stylesheet" href="/resources/dist/css/landing.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/resources/dist/css/dealer.css">

</head>
<body>
<style>
    .error {
        color: red !important;
        display: block;
    }
</style>
<section class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-4 offset-lg-4">
                <div style="width: 500px"
                     class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
                    <h3 class="mb-4" id="nameHeading">Foget Password</h3>
                    <form class="form-signin" id="form">
                        <div class="text-left mb-4">
                        <div class="form-group">
                            <label>Email address:</label>
                            <div class="relative">
                                <input class="form-control" type="email" placeholder="Enter your email" id="email" name="email"

                                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">
                                <button onclick="sendOtp()" id="sendOtpBtn" type="button"
                                        class="btn btn-primary fogetbtn">
                                    <span class="spinner-border spinner-border-sm sendOtp" role="status"
                                          aria-hidden="true" style="display: none"></span>
                                    Send OTP
                                </button>

                            </div>
                        </div>
                        <div class="form-group otp">
                            <label>OTP code</label>
                            <div class="relative">
                                <input disabled class="form-control" id="otp" type="number" placeholder="Enter OTP code"
                                       pattern="[a-zA-Z\s]+" required="" autofocus=""
                                       autocomplete=""
                                >
                                <button onclick="VerifyOtp()" id="verifyOtpBtn" disabled type="button"
                                        class="btn btn-primary fogetbtn">
                                    <span class="spinner-border spinner-border-sm VerifyOtp" role="status"
                                          aria-hidden="true" style="display: none"></span>
                                    Verify
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <div class="relative">
                                <input disabled class="form-control" id="newPassword" name="newPassword" type="password"
                                       pattern="[a-zA-Z\s]+" required="" autofocus="">

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Re-enter New password</label>
                            <div class="relative">
                                <input disabled class="form-control" id="confirmPassword" name="confirmPassword" type="password"
                                       pattern="[a-zA-Z\s]+" required="" autofocus="">

                            </div>
                        </div>
                        <div style="float: right">

                            <button onclick="Save()" id="saveBtn" disabled type="button" class="btn btn-primary">
                                <span class="spinner-border spinner-border-sm saveBtn" role="status" aria-hidden="true"
                                      style="display: none"></span>
                                Save
                            </button>
                        </div>


                    </div>
                    </form>
                    <span id="msg"></span>
                    <h6 style="margin-top: 10px">If already registered
                        <a style="font-weight: bold" href="/users/loginView"> Login</a></h6>

                </div>
            </div>
        </div>

    </div>
</section>
</body>
</html>


<!--/row-->
<%@include file="/WEB-INF/jspf/footer.jspf" %>
<script>
    var user;
    var email;
    var otp;

    $.validator.addMethod("newPassword",function(value,element){
    return this.optional(element) ||  /^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$/.test(value);
    },"Password must contains at least one uppercase letter, one lowercase letter , one special character , one number and minimum 8 characters");

    $('#form').validate({
            rules: {
                newPassword: {
                    minlength: 8,
                    required: true,
                },
                confirmPassword: {
                    minlength: 8,
                    required: true,
                    equalTo : "#newpassword"
                }
            },
            messages: {
                newPassword: {
                    required: "Please provide the new password",
                    minlength: "Your password must be at least 8 characters long",
                    regex: "Password must contains at least one uppercase letter, one lowercase letter and one number"
                },
                confirmPassword: {
                    required: "Please provide confirm password",
                    minlength: "Your password must be at least 8 characters long",
                    regex: "Password must contains at least one uppercase letter, one lowercase letter and one number",
                    equalTo: "Password does not match"
                }

            },
            submitHandler: function (form, event) {
                console.log('submit');
            }
        });

    function sendOtp() {
        $('#msg').empty();
        $(".sendOtp").show();
        $('#sendOtpBtn').prop('disabled', true)
        email = $('#email').val();
        $.ajax({
            url: '/users/otp/' + email,
            method: 'get',
            contentType: "application/json",
            success: function (result) {
                if (result.code == 200) {
                    user = result.data.id;
                    $('#msg').append('<label style="color: #00A7AA">Please check you email and enter otp</label>');
                    $(".sendOtp").hide();
                    $('#sendOtpBtn').prop('disabled', false)
                    $('#sendOtpBtn').text('Re Send Otp');
                    $('#otp').prop('disabled', false);
                    $('#verifyOtpBtn').prop('disabled', false);

                } else {
                    $('#msg').append('<label style="color: red">' + result.message + '</label>');
                    $(".sendOtp").hide();
                    $('#sendOtpBtn').prop('disabled', false)
                }

            },
            error: function (err) {
                $(".sendOtp").hide();
                $('#sendOtpBtn').prop('disabled', false)
                $('#msg').append('<label style="color: red">Error</label>');
            }
        });

    }

    function VerifyOtp() {
        $('#msg').empty();
        $(".VerifyOtp").show();
        $('#verifyOtpBtn').prop('disabled', true);
        otp = $('#otp').val();
        $.ajax({
            url: '/users/otp',
            method: 'post',
            contentType: "application/json",
            data: JSON.stringify({
                email: email,
                otp: otp,

            }),
            success: function (result) {
                if (result.code == 200) {
                    $('#msg').append('<label style="color: #00A7AA">Please enter your new password</label>');
                    $(".VerifyOtp").hide();
                    $('#verifyOtpBtn').prop('disabled', false)
                    $('#newPassword').prop('disabled', false);
                    $('#confirmPassword').prop('disabled', false);
                    $('#saveBtn').prop('disabled', false);

                } else {
                    $('#msg').append('<label style="color: red">' + result.message + '</label>');
                    $(".VerifyOtp").hide();
                    $('#verifyOtpBtn').prop('disabled', false)
                }

            },
            error: function (err) {
                $(".VerifyOtp").hide();
                $('#verifyOtpBtn').prop('disabled', false)
                $('#msg').append('<label style="color: red">Error</label>');
            }
        });

    }

    function Save() {
        $('#msg').empty();
        $(".saveBtn").show();
        $("#saveBtn").prop('disabled', true);
        var confirmPass = $('#confirmPassword').val();
        var newPass = $('#newPassword').val();
        if (confirmPass == newPass) {
            $.ajax({
                url: '/users/otp/' + otp,
                method: 'put',
                contentType: "application/json",
                data: JSON.stringify({
                    id: user,
                    address: 'user',
                    firstname: 'user',
                    lastname: 'user',
                    phone: 'user',
                    city: 'user',
                    email: 'user',
                    password: confirmPass,
                    role: {
                        id: "",
                        name: ""
                    },
                    state: "PENDING"

                }),
                success: function (result) {
                    if (result.code == 200) {
                        $('#msg').append('<label style="color: green">Change password success</label>');
                        $(".saveBtn").hide();
                        $('#newPassword').prop('disabled', true);
                        $('#newPassword').val('');
                        $('#confirmPassword').prop('disabled', true);
                        $('#confirmPassword').val('');
                        $('#email').val('');
                        $('#otp').prop('disabled', true);
                        $('#otp').val('');
                        $('#verifyOtpBtn').prop('disabled', true);
                        $('#saveBtn').prop('disabled', true);
                        $('#sendOtpBtn').val('<span class="spinner-border spinner-border-sm sendOtp" role="status"\n' +
                            '                                          aria-hidden="true" style="display: none"></span>\n' +
                            '                                    Send OTP')

                    } else {
                        $('#msg').append('<label style="color: red">' + result.message + '</label>');
                        $(".saveBtn").hide();
                        $('#saveBtn').prop('disabled', false)
                    }

                },
                error: function (err) {
                    $(".saveBtn").hide();
                    $('#saveBtn').prop('disabled', false)
                    $('#msg').append('<label style="color: red">Error</label>');
                }
            });
        } else {
            $('#msg').append('<label style="color: red">Confirm password is incorrect</label>');
            $('#confirmPassword').val('');
            $(".saveBtn").hide();
            $('#saveBtn').prop('disabled', false)
        }
    }

</script>