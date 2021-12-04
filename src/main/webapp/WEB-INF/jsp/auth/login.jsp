<%----------------------------------------------------------------------------------------%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Washing Love | Log in</title>
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
    <style>
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
            border-radius: 10px;
            opacity: 0.9;
        }

        .log h2 {
            text-align: center;
            color: rgba(0, 51, 69, 0.8);
            font-weight: bold;
            font-size: 26px;
            margin-bottom: 50px;
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

        .background {
            /*background-image: url("/resources/dist/img/AdminLTELogo.png");*/
            background-size: cover;
        }

    </style>
</head>
<body style="background-image: url('/resources/dist/img/back.jpg');background-size: cover;overflow:hidden"
      class="hold-transition login-page">

<div class="">
    <div class="container ">
        <div class="row">
            <div style="" class="col-md-8 col-sm-0 ">

            </div>
            <div class="col-md-4 col-sm-12 ">
                <div style="margin-top: 100px" class="log  p-5">
                    <h2>L O G I N</h2>
                    <p class="login-form-msg" style="color: #FF0000">${login_error}</p>
                    <form class="form-signin" id="form" method="post" action="/users/authentications_model">
                        <div class="input-group mb-3">
                            <input type="email" name="username" id="username" class="form-control "
                                   placeholder="Email address" required autofocus>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" name="password" id="password" class="form-control"
                                   placeholder="Password"
                                   required>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-key"></span>
                                </div>
                            </div>
                        </div>
                        <a style="font-weight: bold;float: right;margin-bottom: 10px" href="/dashboards/forgetPassword">Forget Password</a></h6>
                        <button id="loginbtn" style="" class="btn btn-lg  btn-block " type="submit">Sign in</button>
                        <h6 style="margin-top: 10px">Don't have an account
                            <a style="font-weight: bold" href="/users/signupView"> Sign up</a></h6>
                        <h6 style="margin-top: 10px">

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
    $(function () {
        $('#form').validate({
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                },
            },
            messages: {
                username: {
                    required: "Please enter a username"
                },
                password: {
                    required: "Please provide a password"
                }
            },
            errorElement: 'span',
            errorPlacement: function (error, element) {
                error.addClass('invalid-feedback');
                element.closest('.input-group').append(error);
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
    });
</script>
</body>
</html>
