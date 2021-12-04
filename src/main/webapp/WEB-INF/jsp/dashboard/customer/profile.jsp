<%@include file="/WEB-INF/jspf/header.jspf" %>
<section class="main-content">
    <button style="float: right" type="button" class="btn btn-primary" data-toggle="modal" data-target="#test3">Change Password</button>
    <div style="" class="modal fade" id="test3" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div style="background-color: rgba(0, 51, 69,0.8);color: white" class="modal-header">
                    <h4 style="color: white">Change Password</h4>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span style="color: white" aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label >Old Password:</label>
                        <div class="relative">
                            <input class="form-control" type="password" pattern="https?://.+" required=""
                                   placeholder="Type your Old Password..." id="oldpassword">
                            <i class="fa fa-building"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >New Password:</label>
                        <div class="relative">
                            <input class="form-control" type="password" pattern="https?://.+" required=""
                                   placeholder="Type your New Password..." id="newpassword">
                            <i class="fa fa-building"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >Confirm Password:</label>
                        <div class="relative">
                            <input class="form-control" type="password" pattern="https?://.+" required=""
                                   placeholder="Re-enter your New Password..." id="confirmpassword">
                            <i class="fa fa-building"></i>
                        </div>
                    </div>
                    <div style="float: right">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" onclick="changePassword()">Save</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-4 offset-lg-4">
                <div style="width: 500px" class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
                    <div class="banner"></div>
                    <img src="/resources/dist/img/1.jpg" alt="" class="user-circle mx-auto mb-3">
                    <h3 class="mb-4" id="nameHeading">Sahan Pradeepa</h3>
                    <div class="text-left mb-4">
                        <div class="form-group">
                            <label>Email address:</label>
                            <div class="relative">
                                <input class="form-control" type="email" required="" id="email"
                                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" disabled>
<%--                                <i class="fa fa-envelope"></i>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label >First Name:</label>
                            <div class="relative">
                                <input class="form-control" id="firstname" type="text" pattern="[a-zA-Z\s]+" required="" autofocus=""
                                       title="Username should only contain letters. e.g. Sahan" autocomplete=""
                                       >
<%--                                <i class="fa fa-user"></i>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label >Last Name:</label>
                            <div class="relative">
                                <input class="form-control" id="lastname" type="text" pattern="[a-zA-Z\s]+" required="" autofocus=""
                                       title="Username should only contain letters. e.g. Pradeepa" autocomplete=""
                                       >
<%--                                <i class="fa fa-user"></i>--%>
                            </div>
                        </div>

                        <div class="form-group">
                            <label >Contact Number:</label>
                            <div class="relative">
                                <input class="form-control" type="text" maxlength="10"
                                       oninput="this.value=this.value.replace(/[^0-9]/g,'');" required=""
                                       id="contact">
<%--                                <i class="fa fa-phone"></i>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label >Address:</label>
                            <div class="relative">
                                <input class="form-control" type="url" pattern="https?://.+" required=""
                                       id="address">
<%--                                <i class="fa fa-building"></i>--%>
                            </div>
                        </div>
                        <div style="float: right">
                            <button type="button" class="btn btn-primary" >Cancel</button>
                            <button type="button" class="btn btn-primary" onclick="updateProfile()">Save</button>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </div>
</section>


<!--/row-->
<%@include file="/WEB-INF/jspf/footer.jspf" %>
<script>
    var user = '${user}';
    var token = '${token}';

    var address;
    var city;
    var email;
    var firstname;
    var id;
    var lastname;
    var password;
    var phone;
    var role;
    var state;

    var notificationCount = 0;
    $(function () {
        // $.ajax({
        //     url: '/notifications',
        //     method: 'get',
        //     contentType: "application/json",
        //     headers: {
        //         "Authorization": "Bearer " + token
        //     },
        //     success: function (result) {
        //         for (const obj of result.data) {
        //             if(obj.receiver.id == user){
        //                 if(obj.state == "UNSEEN"){
        //                     notificationCount = notificationCount+1;
        //                 }
        //             }
        //
        //         }
        //         $("#notiCount").text(notificationCount);
        //     },
        //     error: function (err) {
        //     }
        // });
        console.log(user)


        $.ajax({
            url: '/users/'+user,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                address = result.data.address;
                city = result.data.city;
                email = result.data.email;
                firstname = result.data.firstname;
                lastname = result.data.lastname;
                password = result.data.password;
                phone = result.data.phone;
                role = result.data.role;
                state = result.data.state;

                $("#email").attr("value",email);
                $("#firstname").attr("value",firstname);
                $("#lastname").attr("value",lastname);
                $("#contact").attr("value",phone);
                $("#address").attr("value",address);

                $("#nameHeading").text(firstname+" "+lastname)

            },
            error: function (err) {
                console.log('err')
                console.log( err);
            }
        });

    });

    function updateProfile() {

        address =  $('#address').val(),
            firstname =  $('#firstname').val(),
            lastname =  $('#lastname').val(),
            phone =  $('#contact').val(),
            email =  $('#email').val()

        $.ajax({
            url: '/users',
            method: 'put',
            contentType: "application/json",
            data: JSON.stringify({
                id: user,
                address: address,
                city : city,
                email : email,
                firstname : firstname,
                lastname : lastname,
                password : password,
                phone : phone,
                role : role,
                state : state
            }),
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $("#nameHeading").text(firstname+" "+lastname)
            },
            error: function (err) {
                console.log('err')
                console.log( err);
            }
        });

    }

    function changePassword() {
        newpassword =  $('#newpassword').val();
        oldpassword =  $('#oldpassword').val();
        confirmpassword =  $('#confirmpassword').val();

        if(oldpassword == password){
            if(newpassword == confirmpassword){
                $.ajax({
                    url: '/users',
                    method: 'put',
                    contentType: "application/json",
                    data: JSON.stringify({
                        id: user,
                        address: address,
                        city : city,
                        email : email,
                        firstname : firstname,
                        lastname : lastname,
                        password : newpassword,
                        phone : phone,
                        role : role,
                        state : state
                    }),
                    headers: {
                        "Authorization": "Bearer " + token
                    },
                    success: function (result) {
                        location.reload();
                        alert('password updated')
                    },
                    error: function (err) {
                        alert('error occured, try again')
                    }
                });
            }else{
                alert('passwords dont match')
            }
        }else{
            alert('old password incorrect');
        }


    }

</script>