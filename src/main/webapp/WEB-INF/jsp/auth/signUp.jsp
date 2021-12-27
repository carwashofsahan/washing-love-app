<%----------------------------------------------------------------------------------------%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Washing Love | Sign Up</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--    <link rel="shortcut icon" type="image/png" href="/resources/dist/img/favicon.ico"/>--%>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <link rel="stylesheet" href="/resources/dist/css/customer.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <style>
        /** {*/
        /*    box-sizing: border-box;*/
        /*}*/
        body {
            background-color: #EEE;
        }

        .clear {
            clear: both;
        }

        .log {
            width: 400px;
            margin: 5% auto;
            background-color: #FFF;
            padding: 30px 0;
            opacity: 0.9;
            border-radius: 10px;
        }

        .log h2 {
            text-align: center;
            color: rgba(0, 51, 69, 0.8);;
            font-weight: bold;
            font-size: 26px;
            margin-bottom: 10px;
        }

        .log .input-cont {
            position: relative;
            margin: 0 50px 60px;
        }

        .log .input-cont:last-of-type {
            margin-bottom: 30px;
        }

        .log .input-cont input {
            position: relative;
            z-index: 1;
            width: 100%;
            height: 40px;
            outline: none;
            color: #212121;
            font-size: 22px;
            font-weight: 400;
            background: none;
            border: none;
        }

        .log .input-cont input:focus {
            outline: none;
        }

        .log .input-cont label {
            position: absolute;
            color: #948c8c;
            top: 0;
            left: 0;
            line-height: 40px;
            -webkit-transition: .3s;
            -moz-transition: .3s;
            -o-transition: .3s;
            transition: .3s;
        }

        .log .input-cont input:focus + label {
            margin-top: -30px;
            -webkit-transform: scale(.8);
            -moz-transform: scale(.8);
            -o-transform: scale(.8);
            transform: scale(.8);
            color: #bdbdbd;
        }

        .log .border1,
        .log .border2 {
            position: absolute;
            height: 1px;
            background-color: #9E9E9E;
            left: 0;
            bottom: 0;
            width: 100%;
        }

        .log .border1::after,
        .log .border1::before,
        .log .border2::after,
        .log .border2::before {
            content: "";
            position: absolute;
            bottom: 0;
            width: 0;
            height: 2px;
            -webkit-transition: .5s;
            -moz-transition: .5s;
            -o-transition: .5s;
            transition: .5s;
        }

        .log .border1::after,
        .log .border2::after {

            right: 50%;
            background-color: #ed2553;
        }

        .log .border1::before,
        .log .border2::before {
            left: 50%;
            background-color: #ed2553;
        }

        .log .input-cont input:focus ~ .border1::after,
        .log .input-cont input:focus ~ .border1::before,
        .log .input-cont input:focus ~ .border2::after,
        .log .input-cont input:focus ~ .border2::before {
            width: 50%;
        }

        .log .check,
            /*.log a {*/
            /*    float: left;*/
            /*    width: calc(50% - 50px);*/
            /*    display: block;*/
            /*    font-size: 12px;*/
            /*    margin-bottom: 30px;*/
            /*}*/
        .log .check {
            margin-left: 50px;
        }

        .log a {
            text-align: right;
            text-decoration: none;
            color: rgba(0, 51, 69, 0.8);
        }

        .log form input[type="submit"] {
            display: block;
            margin: 0 auto 20px;
            border: 2px solid transparent;
            padding: 5px 20px;
            font-size: 22px;
            cursor: pointer;
            color: #ed2553;
            -webkit-transition: .5s;
            -moz-transition: .5s;
            -o-transition: .5s;
            transition: .5s;
        }

        .log form input[type="submit"]:focus {
            outline: none;
        }

        .log form input[type="submit"]:hover {
            border: 2px solid #ed2553;
        }

        .error {
            color: red !important;
            display: block;
        }

        .background {
            /*background-image: url("https://cdn.wallpapersafari.com/19/4/tA6M0S.jpg");*/
            background-size: cover;
        }

        .submit-button {
            background-color: rgba(0, 51, 69, 0.8) !important;
            width: 100%
        }

    </style>
</head>
<body style="background-image: url('/resources/dist/img/back.jpg');background-size: cover;"
      class="hold-transition login-page">

<div class="">
    <div class="container">
        <div class="row">
            <div class="col-md-8"></div>
            <div class="col-md-4 ">
                <div style="" class="profile-card card log  p-4">
                    <h2>S I G N U P</h2>
                    <form class="form-signin" id="form">
                        <input type="email" name="email" id="email" class="form-control"
                               placeholder="Email address" required autofocus>
                        <button onclick="sendOtp()" id="sendOtpBtn" type="button"
                                class="btn btn-primary fogetbtn">
                                    <span class="spinner-border spinner-border-sm sendOtp" role="status"
                                          aria-hidden="true" style="display: none"></span>
                            Send OTP
                        </button>

                        <input disabled class="form-control" id="otp" type="number" placeholder="Enter OTP code"
                        >
                        <button onclick="VerifyOtp()" id="verifyOtpBtn" disabled type="button"
                                class="btn btn-primary fogetbtn">
                                    <span class="spinner-border spinner-border-sm VerifyOtp" role="status"
                                          aria-hidden="true" style="display: none"></span>
                            Verify
                        </button>
                        <div class="form-group">
                            <input type="text" name="firstname" id="firstname" class="form-control mb-3"
                                   placeholder="First Name" required autofocus>
                        </div>
                        <input type="text" name="lastname" id="lastname" class="form-control mb-3"
                               placeholder="Last Name" required autofocus>
                        <input type="text" name="address" id="address" class="form-control mb-3" placeholder="Address"
                               required autofocus>
                        <input type="text" name="city" id="city" class="form-control mb-3" placeholder="City" required
                               autofocus>
                        <input type="text" name="phone" id="phone" class="form-control mb-3" placeholder="Phone"
                               required autofocus>

                        <input type="password" name="password" id="password" class="form-control mb-3"
                               placeholder="Password" required>
                        <input type="password" name="conpassword" id="password1" class="form-control"
                               placeholder="Re-Enter Password" required>

                        <div class="btn-group btn-group-toggle mt-3" data-toggle="buttons" id="toggle">
                            <label class="btn btn-secondary active">
                                <input checked type="radio" name="role" id="option1" value="CUSTOMER"
                                       autocomplete="off"> CUSTOMER
                            </label>
                            <label class="btn btn-secondary">
                                <input type="radio" name="role" id="option2" value="DETAILER" autocomplete="off">
                                DETAILER
                            </label>

                        </div>

                        <div class="form-group mt-2">
                            <label >Image:</label>
                            <div id="image-preview">
                                <img id="image" width="200" height="200" class="ml-5 mb-2" />
                            </div>
                            <div class="relative">
                                <input class="form-control" type="file" id="image_input"
                                onchange="document.getElementById('image').src = window.URL.createObjectURL(this.files[0]);">
                            </div>
                        </div>
                        </br>
                        <span id="msg"></span>
                        <button disabled type="submit" id="submitBtn" class="btn btn-primary submit-button mt-3 ">
                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"
                                  style="display: none"></span>
                            Sign Up
                        </button>
                        <h6 style="margin-top: 10px">If already registered
                            <a style="font-weight: bold" href="/users/loginView"> Login</a></h6>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jquery-validation -->
<script src="/resources/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="/resources/plugins/jquery-validation/additional-methods.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<!-- Page specific script -->
<script>

    $(
        function () {
            $.validator.addMethod("password",function(value,element){
                return this.optional(element) ||  /^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$/.test(value);
            },"Password must contains at least one uppercase letter, one lowercase letter , one special character , one number and minimum 8 characters");


            $('#form').validate({
                rules: {
                    firstname: {
                        required: true
                    },
                    lastname: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        minlength: 8,
                        required: true,
                    },
                    conpassword: {
                        required: true,
                        equalTo : "#password"
                    },
                    address: {
                        required: true
                    },
                    phone: {
                        required: true,
                        number: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    city: {
                        required: true
                    },
                    role: {
                        required: true
                    }
                },
                messages: {
                    email: {
                        required: "Please enter a email",
                        email: "Please enter a valid email address",
                    },
                    password: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 8 characters long",
                        regex: "Password must contains at least one uppercase letter, one lowercase letter and one number"
                    },
                    phone: {
                        minlength: "Invalid phone number. Should have 10 numbers",
                        maxlength: "Invalid phone number. Should have 10 numbers",
                        number : "Should contain only numbers"
                    },
                    conpassword: {
                        equalTo: "Password does not match"
                    }

                },

                submitHandler: function (form, event) {
                    event.preventDefault();

                    var selectedVal = "";
                    var selected = $("input[type='radio'][name='role']:checked");
                    var fileImage = document.querySelector("#image_input").files[0];

                    if (selected.length > 0) {
                        selectedVal = selected.val();
                    }

                    var conpass = $('#password1').val();
                    var pass = $('#password').val();
                    $('#msg').empty()

                    $(".spinner-border").show();
                    $('#submitBtn').prop('disabled', true)


                    if (conpass == pass) {
                        getBase64(fileImage).then(
                            imageData => {
                                 $.ajax({
                            url: '/users/sign_up',
                            method: 'post',
                            contentType: "application/json",
                            data: JSON.stringify({
                                id: "1234",
                                address: $('#address').val(),
                                firstname: $('#firstname').val(),
                                lastname: $('#lastname').val(),
                                phone: $('#phone').val(),
                                city: $('#city').val(),
                                email: $('#email').val(),
                                password: $('#password').val(),
                                role: {
                                    id: "",
                                    name: selectedVal
                                },
                                state: "PENDING",
                                image: imageData
                            }),
                            success: function (result) {
                                $(".spinner-border").hide();
                                $('#submitBtn').prop('disabled', false)
                                $('#msg').text(result.message)
                                clearText();
                            },
                            error: function (err) {
                                $(".spinner-border").hide();
                                $('#submitBtn').prop('disabled', false)
                                $('#msg').text(result.message);
                                clearText();
                            }
                        });
                            });
                    }else {
                        $('#password1').val('');
                        $(".spinner-border").hide();
                        $('#submitBtn').prop('disabled', false)
                        Swal.fire({
                            title: 'Error',
                            html: '<h3 style="font-weight:bold;">Confirm password incorrect</h3>',
                            icon: 'error',
                            showCancelButton: false,
                            confirmButtonColor: 'rgba(0, 51, 69,0.8)',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Ok',
                            cancelButtonText: 'No'
                        })
                    }


                }
            });
        }
    );

    function getBase64(file) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => resolve(reader.result);
            reader.onerror = error => reject(error);
        });
    }

    function clearText() {
        $('#firstname').val("");
        $('#lastname').val("");
        $('#address').val("");
        $('#phone').val("");
        $('#city').val("");
        $('#email').val("");
        $('#password').val("");
        $('#password1').val("");
    }

    function sendOtp() {
        $('#msg').empty();
        $(".sendOtp").show();
        $('#sendOtpBtn').prop('disabled', true)
        email = $('#email').val();
        $.ajax({
            url: '/users/signUpOtp/' + email,
            method: 'get',
            contentType: "application/json",
            success: function (result) {
                if (result.code == 200) {
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
            url: '/users/signUpOtp',
            method: 'post',
            contentType: "application/json",
            data: JSON.stringify({
                email: email,
                otp: otp,

            }),
            success: function (result) {
                if (result.code == 200) {
                    $('#msg').append('<label style="color: #00A7AA">Please enter your details</label>');
                    $(".VerifyOtp").hide();
                    $('#verifyOtpBtn').prop('disabled', false)
                    $('#submitBtn').prop('disabled', false);

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

</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="/resources/plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalert2/sweetalert2.all.min.js"></script>
</body>
</html>
