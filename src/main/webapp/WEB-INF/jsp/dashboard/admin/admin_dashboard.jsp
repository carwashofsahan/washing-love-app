<%@include file="/WEB-INF/jspf/header.jspf" %>

<%@include file="/WEB-INF/jspf/header.jspf" %>

<body style="background-image: url('/resources/dist/img/back.jpg'); background-size: cover; height: auto; ">
<%--navbar--%>

<%--navbar end--%>

<section>
    <div class="container">

        <div style="margin-top:100px;background-color: transparent" class="" id="addwashcenterMainDiv">
            <div class="col-12 col-sm-12 col-lg-12">
                <div style="background-color: rgba(255,255,255,1)" class="card card-outline card-tabs">
                    <div class="card-header p-0 pt-1 border-bottom-0">
                        <ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="custom-tabs-two-home-tab" data-toggle="pill"
                                   href="#custom-tabs-two-home" role="tab" aria-controls="custom-tabs-two-home"
                                   aria-selected="false">Users</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="custom-tabs-two-profile-tab" data-toggle="pill"
                                   href="#custom-tabs-two-profile" role="tab" aria-controls="custom-tabs-two-profile"
                                   aria-selected="false">Wash Centers</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="custom-tabs-two-messages-tab" data-toggle="pill"
                                   href="#custom-tabs-two-messages" role="tab" aria-controls="custom-tabs-two-messages"
                                   aria-selected="false">Packages</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="custom-tabs-two-settings-tab" data-toggle="pill"
                                   href="#custom-tabs-two-settings" role="tab" aria-controls="custom-tabs-two-settings"
                                   aria-selected="true">Reviews / Ratings</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content " id="custom-tabs-two-tabContent">
                            <div class="tab-pane fade active show" id="custom-tabs-two-home" role="tabpanel"
                                 aria-labelledby="custom-tabs-two-home-tab">
                                <div class="border p-4">

                                    <div class="row mb-2">
                                        <h4 class="font-weight-bold col-md-3 col-sm-12">Pending Registrations </h4>

                                    </div>
                                    <div class="row" id="pendingUserList">


                                    </div>
                                </div>

                                <div class="border p-4 mt-3">

                                    <div class="row mb-4">
                                        <h4 class="font-weight-bold col-md-3 col-sm-12"> Users </h4>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="input-group">
                                                <select class="form-control" id="usertype">
                                                    <option value="CUSTOMER">CUSTOMER</option>
                                                    <option value="DETAILER">DETAILER</option>
                                                </select>

                                                <div class="ml-2 input-group-btn">
                                                    <button id="" type="button"
                                                            class="btn btn-secondary btn-search"><span
                                                            class="glyphicon glyphicon-search">&nbsp;</span> <span
                                                            class="label-icon" onclick="searchfromusertype()">Search</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" id="allUserList">

                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="custom-tabs-two-profile" role="tabpanel"
                                 aria-labelledby="custom-tabs-two-profile-tab">
                                <div class="border p-4">

                                    <div class="row mb-2">
                                        <h4 class="col-md-3 col-sm-12 font-weight-bold">Pending Registrations </h4>
                                    </div>
                                    <div class="row" id="pendingWashCenterList">

                                    </div>
                                </div>

                                <div class="border p-4 mt-3">

                                    <div class="row mb-4">
                                        <h4 class="font-weight-bold col-md-3 col-sm-12"> Wash Centers </h4>
                                        <div class="col-md-9 col-sm-12">
                                            <div class="input-group">
                                                <div class="ml-2 form-group">
                                                    <input class="form-control" type="text" placeholder="Name" id="searchbyname">
                                                </div>
                                                <div class="ml-2 form-group">
                                                    <input class="form-control" type="text" placeholder="City" id="searchbycity">
                                                </div>
                                                <div class="ml-2 input-group-btn">
                                                    <button type="button" class="btn btn-secondary btn-search"><span
                                                            class="glyphicon glyphicon-search">&nbsp;</span> <span
                                                            class="label-icon" onclick="filterCenters()">Search</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" id="allWashCenterList">

                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="custom-tabs-two-messages" role="tabpanel"
                                 aria-labelledby="custom-tabs-two-messages-tab">
                                <div class="border p-4">

                                    <div class="row mb-2">
                                        <h4 class="font-weight-bold col-md-3 col-sm-12">Pending Registrations </h4>
                                    </div>
                                    <div class="row" id="pendingPackageList">

                                    </div>
                                </div>

                                <div class="border p-4 mt-3">

                                    <div class="row mb-4">
                                        <h4 class="col-md-3 col-sm-12 font-weight-bold"> Packages </h4>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="input-group">
                                                <div class="ml-2 form-group">
                                                    <input class="form-control" type="text" placeholder="User ID" id="packageUserId">
                                                </div>
                                                <div class="ml-2 input-group-btn">
                                                    <button type="button" class="btn btn-secondary btn-search"><span
                                                            class="glyphicon glyphicon-search">&nbsp;</span> <span
                                                            class="label-icon" onclick="filterPackagesByUser()">Search</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" id="allPackageList">

                                    </div>
                                </div>


                            </div>
                            <div class="tab-pane fade " id="custom-tabs-two-settings" role="tabpanel"
                                 aria-labelledby="custom-tabs-two-settings-tab">
                                <div class="col-12 text-center">
                                    <div class="input-group text-center">
                                        <div class="ml-2 form-group">
                                            <input class="form-control" type="text" placeholder="WASH CENTER ID" id="reviewWashcenter">
                                        </div>
                                        <div class="ml-2 input-group-btn">
                                            <button type="button" class="btn btn-secondary btn-search"><span
                                                    class="glyphicon glyphicon-search">&nbsp;</span> <span
                                                    class="label-icon" onclick="filterReviews()">Search</span></button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" id="allReviewAndRatingList">

                                </div>


                            </div>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
        <%--                        ---------------------------------------------------------------------%>

        <%--           see-more modal             -------------------------------%>
        <div class="modal fade" id="seemore" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document" id="othermodels">

            </div>
        </div>
        <%-------------------------------------------------User Models---------------------------------------------------------------%>
        <%--        reject model--%>
        <div class="modal fade mod" id="reject" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Reject <br>
                            <span class="font-weight-bold">User: <span id="rejectUserName"></span></span></h4>

                        <div class="col-12 text-center">
                            <button id="confirmRejectBtn" onclick="ConfirmRejectUser(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-warning"
                                    data-dismiss="modal">Reject
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <%--        approve model--%>
        <div class="modal fade mod" id="approve" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Approve <br>
                            <span class="font-weight-bold">User: <span id="approveUserName"></span></span></h4>

                        <div class="col-12 text-center">
                            <button id="confirmApproveBtn" onclick="ConfirmApprovUser(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-success"
                                    data-dismiss="modal">Approve
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <%--        delete model--%>
        <div class="modal fade mod" id="delete" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Delete <br>
                            <span class="font-weight-bold"><span id="deleteUserName"></span></span></h4>

                        <div class="col-12 text-center">
                            <button id="confirmDeleteBtn" onclick="ConfirmDeleteUser(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-success"
                                    data-dismiss="modal">Delete
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>
        <%----------------------------------------------Package Models-------------------------------------------------------%>
        <%--        reject model--%>
        <div class="modal fade mod" id="rejectPackage" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Reject <br>
                            <span class="font-weight-bold">Package ID <span id="rejectPackageName"></span></span></h4>

                        <div class="col-12 text-center">
                            <button id="confirmRejectPackageBtn" onclick="ConfirmRejectPackage(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-warning"
                                    data-dismiss="modal">Reject
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <%--        approve model--%>
        <div class="modal fade mod" id="approvePackage" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Approve <br>
                            <span class="font-weight-bold">Package ID <span id="approvePackageId"></span></span></h4>

                        <div class="col-12 text-center">
                            <button id="confirmApprovePackageBtn" onclick="ConfirmApprovPackage(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-success"
                                    data-dismiss="modal">Approve
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <%--        delete model--%>
        <div class="modal fade mod" id="deletePackage" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Delete <br>
                            <span class="font-weight-bold">Package: <span id="deletePackageName"></span></span></h4>

                        <div class="col-12 text-center">
                            <button id="confirmDeletePackageBtn" onclick="ConfirmDeletePackage(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-success"
                                    data-dismiss="modal">Delete
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <%-----------------------------------------------------------------Wash Center Models------------------------------%>
        <%--        reject model--%>
        <div class="modal fade mod" id="rejectWashCenter" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Reject <br>
                            <span class="font-weight-bold"><span id="rejectWashCenterName"></span></span>
                        </h4>

                        <div class="col-12 text-center">
                            <button id="confirmRejectWashCenterBtn" onclick="ConfirmRejectWashCenter(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-warning"
                                    data-dismiss="modal">Reject
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <%--        approve model--%>
        <div class="modal fade mod" id="approveWashCenter" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Approve <br>
                            <span class="font-weight-bold"><span id="approveWashCenterName"></span></span>
                        </h4>

                        <div class="col-12 text-center">
                            <button id="confirmApproveWashCenterBtn" onclick="ConfirmApprovWashCenter(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-success"
                                    data-dismiss="modal">Approve
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <%--        delete model--%>
        <div class="modal fade mod" id="deleteWashCenter" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Delete <br>
                            <span class="font-weight-bold"><span id="deleteWashCenterName"></span></span>
                        </h4>

                        <div class="col-12 text-center">
                            <button id="confirmDeleteWashCenterBtn" onclick="ConfirmDeleteWashCenter(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-success"
                                    data-dismiss="modal">Delete
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>
<%--------------------------------------Review and Rating Models----------------------------------------%>
        <%--        delete model--%>
        <div class="modal fade mod" id="deleteReview" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Delete <br>
                            <span class="font-weight-bold">Review ID <span id="deleteReviewId"></span></span>
                        </h4>

                        <div class="col-12 text-center">
                            <button id="confirmDeleteReviewBtn" onclick="ConfirmDeleteReview(event)"
                                    style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-success"
                                    data-dismiss="modal">Delete
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>
</section>


</body>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

<script>
    var token = '${token}';
    var user = '${user}';
    var notificationCount = 0;
    console.log('token', token);
    console.log('user', user);

    $(function () {
        $('.admin-adminstration').addClass("active");

        //-------------------------------------------------Notification-----------------------------------------
        // $.ajax({
        //     url: '/notifications',
        //     method: 'get',
        //     contentType: "application/json",
        //     headers: {
        //         "Authorization": "Bearer " + token
        //     },
        //     success: function (result) {
        //         for (var obj of result.data) {
        //             if (obj.receiver.id == user) {
        //                 if (obj.state == "UNSEEN") {
        //                     notificationCount = notificationCount + 1;
        //                 }
        //             }
        //
        //         }
        //         $("#notiCount").text(notificationCount);
        //     },
        //     error: function (err) {
        //         console.log('err')
        //         console.log(err);
        //     }
        // });

        //--------------------------------------------------Pending Users------------------------------------------
        $.ajax({
            url: '/users/state/PENDING',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    $('#pendingUserList').append('<div class="col-md-4 col-sm-12  ">\n' +
                        '                                            <div>\n' +
                        '                                                <div class="card" style="width: 18rem; ">\n' +
                        '                                                    <div class="card-body" data-toggle="modal">\n' +
                        '                                                        <h5 class="card-text font-weight-bold">' + obj.firstname + ' ' + obj.lastname + '</h5>\n' +
                        '                                                        <h6 class="card-text">' + obj.phone + '</h6>\n' +
                        '                                                        <h6 class="card-text">' + obj.city + '</h6>\n' +
                        '                                                        <div class="col-12 text-center">\n' +
                        '                                                            <button onclick="ApprovUser(event)" data-name="' + obj.firstname + ' ' + obj.lastname + '"  data-userid="' + obj.id + '" data-toggle="modal" data-target="#approve" class="btn btn-success">Approve</button>\n' +
                        '                                                            <button onclick="RejectUser(event)" data-name="' + obj.firstname + ' ' + obj.lastname + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#reject" class="btn btn-danger">Reject</button>\n' +
                        '                                                        </div>\n' +
                        '                                                    </div>\n' +
                        '                                                </div>\n' +
                        '                                            </div>\n' +
                        '                                        </div>');
                }

            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });
        //------------------------------------------------------All Users---------------------------------------------------
        $.ajax({
            url: '/users',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    if (obj.state != "PENDING" && obj.state != "DELETED" && obj.role.name != "ADMIN") {

                        if (obj.state == "ACCEPTED") {
                            $('#allUserList').append('<div class="col-md-4 col-sm-12  ">\n' +
                                '                                            <div>\n' +
                                '                                                <div class="card" style="width: 18rem; ">\n' +
                                '                                                    <div class="card-body" data-toggle="modal">\n' +
                                '                                                        <h5 class="card-text font-weight-bold">' + obj.firstname + ' ' + obj.lastname + '</h5>\n' +
                                '                                                        <h6 class="card-text">' + obj.phone + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.city + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.role.name + '</h6>\n' +
                                '                                                        <h6 class="card-text" style="color: #2E8B57">' + obj.state + '</h6>\n' +
                                '                                                        <div class="col-12 text-center">\n' +
                                '                                                            <button onclick="ConfirmLockUser(event)" data-userid="' + obj.id + '" class="btn btn-success">Lock &nbsp;<i\n' +
                                '                                                                    class="fas fa-unlock"></i></button>\n' +
                                '                                                            <button onclick="DeleteUser(event)" data-username="' + obj.firstname + ' ' + obj.lastname + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#delete"\n' +
                                '                                                                    class="btn btn-danger">Delete\n' +
                                '                                                            </button>\n' +
                                '                                                        </div>\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>')
                        } else if (obj.state == "LOCK") {
                            $('#allUserList').append('<div class="col-md-4 col-sm-12  ">\n' +
                                '                                            <div>\n' +
                                '                                                <div class="card" style="width: 18rem; ">\n' +
                                '                                                    <div class="card-body" data-toggle="modal">\n' +
                                '                                                        <h5 class="card-text font-weight-bold">' + obj.firstname + ' ' + obj.lastname + '</h5>\n' +
                                '                                                        <h6 class="card-text">' + obj.phone + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.city + '</h6>\n' +
                                '                                                        <h6 class="card-text" style="color: #2E8B57">' + obj.state + '</h6>\n' +
                                '                                                        <div class="col-12 text-center">\n' +
                                '                                                            <button onclick="ConfirmApprovUser(event)" data-userid="' + obj.id + '" class="btn btn-success">Unlock &nbsp;<i\n' +
                                '                                                                    class="fas fa-unlock"></i></button>\n' +
                                '                                                            <button onclick="DeleteUser(event)" data-username="' + obj.firstname + ' ' + obj.lastname + '"   data-userid="' + obj.id + '"  data-toggle="modal" data-target="#delete"\n' +
                                '                                                                    class="btn btn-danger">Delete\n' +
                                '                                                            </button>\n' +
                                '                                                        </div>\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>')
                        } else if (obj.state == "DELETED") {
                            $('#allUserList').append('<div class="col-md-4 col-sm-12  ">\n' +
                                '                                            <div>\n' +
                                '                                                <div class="card" style="width: 18rem; ">\n' +
                                '                                                    <div class="card-body" data-toggle="modal">\n' +
                                '                                                        <h5 class="card-text font-weight-bold">' + obj.firstname + ' ' + obj.lastname + '</h5>\n' +
                                '                                                        <h6 class="card-text">' + obj.phone + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.city + '</h6>\n' +
                                '                                                        <h6 class="card-text" style="color: #2E8B57">' + obj.state + '</h6>\n' +
                                '                                                        <div class="col-12 text-center">\n' +
                                '                                                            <button onclick="ConfirmLockUser(event)" data-userid="' + obj.id + '"  class="btn btn-success">Lock &nbsp;<i\n' +
                                '                                                                    class="fas fa-unlock"></i></button>\n' +
                                '                                                            <button disabled data-toggle="modal" data-target="#delete"\n' +
                                '                                                                    class="btn btn-danger">Delete\n' +
                                '                                                            </button>\n' +
                                '                                                        </div>\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>')
                        } else {
                            $('#allUserList').append('<div class="col-md-4 col-sm-12  ">\n' +
                                '                                            <div>\n' +
                                '                                                <div class="card" style="width: 18rem; ">\n' +
                                '                                                    <div class="card-body" data-toggle="modal">\n' +
                                '                                                        <h5 class="card-text font-weight-bold">' + obj.firstname + ' ' + obj.lastname + '</h5>\n' +
                                '                                                        <h6 class="card-text">' + obj.phone + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.city + '</h6>\n' +
                                '                                                        <h6 class="card-text" style="color: #2E8B57">' + obj.state + '</h6>\n' +
                                '                                                        <div class="col-12 text-center">\n' +
                                '                                                            <button disabled class="btn btn-success">Lock &nbsp;<i\n' +
                                '                                                                    class="fas fa-unlock"></i></button>\n' +
                                '                                                            <button disabled data-toggle="modal" data-target="#delete"\n' +
                                '                                                                    class="btn btn-danger">Delete\n' +
                                '                                                            </button>\n' +
                                '                                                        </div>\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>')
                        }
                    }

                }

            },
            error: function (err) {
                console.log('gggherr')
                console.log(err);
            }
        });
        //----------------------------------------------------------Pending Packages---------------------------------------------------
        $.ajax({
            url: '/packages/state/PENDING',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    $('#pendingPackageList').append('<div class="col-md-4 col-sm-12  ">\n' +
                        '                                            <div>\n' +
                        '                                                <div class="card" style="width: 18rem; ">\n' +
                        '                                                    <div class="card-body" data-toggle="modal">\n' +
                        '                                                        <h5 class="card-text font-weight-bold">Detailer : ' + obj.user.firstname + ' ' + obj.user.lastname + '</h5>\n' +
                        '                                                        <h6 class="card-text">' + obj.type.type + '</h6>\n' +
                        '                                                        <h6 class="card-text">Rs. ' + obj.price + '</h6>\n' +
                        '                                                        <h6 data-description="' + obj.description + '" style="color: #00A7AA;cursor: pointer" onclick="viewNote(event)" class="card-text">See more</h6>\n' +
                        '                                                        <div class="col-12 text-center">\n' +
                        '                                                            <button onclick="ApprovPackage(event)" data-name="' + obj.name + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#approvePackage"\n' +
                        '                                                                    class="btn btn-success">Approve\n' +
                        '                                                            </button>\n' +
                        '                                                            <button onclick="RejectPackage(event)" data-name="' + obj.name + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#rejectPackage"\n' +
                        '                                                                    class="btn btn-danger">Reject\n' +
                        '                                                            </button>\n' +
                        '                                                        </div>\n' +
                        '                                                    </div>\n' +
                        '                                                </div>\n' +
                        '                                            </div>\n' +
                        '                                        </div>');
                }

            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

        //    -----------------------------------------------All Packages-----------------------------------------------------
        $.ajax({
            url: '/packages',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    if (obj.state != "DELETED" && obj.state != "PENDING") {

                        $('#allPackageList').append('<div class="col-md-4 col-sm-12  ">\n' +
                            '                                            <div>\n' +
                            '                                                <div class="card" style="width: 18rem; ">\n' +
                            '                                                    <div class="card-body" data-toggle="modal">\n' +
                            '                                                        <h5 class="card-text font-weight-bold">Detailer : ' + obj.user.firstname + ' ' + obj.user.lastname + '</h5>\n' +
                            '                                                        <h6 class="card-text">' + obj.type.type + '</h6>\n' +
                            '                                                        <h6 class="card-text">Rs. ' + obj.price + '</h6>\n' +
                            '                                                        <h6 class="card-text">' + obj.state + '</h6>\n' +
                            '                                                        <h6 data-description="' + obj.description + '" style="color: #00A7AA;cursor: pointer" onclick="viewNote(event)" class="card-text">See more</h6>\n' +
                            '                                                        <div class="col-12 text-center">\n' +
                            '                                                            <button onclick="DeletePackage(event)" data-name="' + obj.description + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#deletePackage"\n' +
                            '                                                                    class="btn btn-danger">Delete\n' +
                            '                                                            </button>\n' +
                            '                                                        </div>\n' +
                            '                                                    </div>\n' +
                            '                                                </div>\n' +
                            '                                            </div>\n' +
                            '                                        </div>')
                    }
                }

            },
            error: function (err) {
                console.log('gggherr')
                console.log(err);
            }
        });

        //    -----------------------------------------------Pending Wash Centers----------------------------------------
        $.ajax({
            url: '/washCenters/state/PENDING',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    var packageSet = '| '
                    for (var pac of obj.packages) {
                        packageSet = packageSet + pac.type.type + ' - Rs. ' + pac.price + ' | '
                    }
                    $('#pendingWashCenterList').append('<div class="col-md-4 col-sm-12  ">\n' +
                        '                                            <div>\n' +
                        '                                                <div class="card" style="width: 18rem; ">\n' +
                        '                                                    <div class="card-body" data-toggle="modal">\n' +
                        '                                                        <h5 class="card-text font-weight-bold">\n' +
                        '                                                            <span>Detailer : ' + obj.user.firstname + ' ' + obj.user.lastname + '</span></h5>\n' +
                        '                                                        <h6 class="card-text">Name : <span>' + obj.name + '</span></h6>\n' +
                        '                                                        <h6 class="card-text">City : <span>' + obj.city + '</span></h6>\n' +
                        '                                                        <h6 class="card-text">Phone : <span>' + obj.phone + '</span></h6>\n' +
                        '                                                        <h6 class="card-text">Packages : <span>' + packageSet + '</span></h6>\n' +
                        '                                                        <div class="col-12 text-center">\n' +
                        '                                                            <button onclick="ApprovWashCenter(event)" data-name="' + obj.name + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#approveWashCenter"\n' +
                        '                                                                    class="btn btn-success">Approve\n' +
                        '                                                            </button>\n' +
                        '                                                            <button onclick="RejectWashCenter(event)" data-name="' + obj.name + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#rejectWashCenter"\n' +
                        '                                                                    class="btn btn-danger">Reject\n' +
                        '                                                            </button>\n' +
                        '                                                        </div>\n' +
                        '                                                    </div>\n' +
                        '                                                </div>\n' +
                        '                                            </div>\n' +
                        '                                        </div>');

                }

            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

        //    ------------------------------------------------All Wash Centers-----------------------------------------
        $.ajax({
            url: '/washCenters',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    if (obj.state == "ACTIVE") {
                        $('#allWashCenterList').append('<div class="col-md-4 col-sm-12 ">\n' +
                            '                                            <div>\n' +
                            '                                                <div class="card" style="width: 18rem; ">\n' +
                            '                                                    <div class="p-1 mt-3"\n' +
                            '                                                         style="background-color: rgba(0,51,69,0.7);position: absolute;width: 200px;right: 0">\n' +
                            '                                                        <h5 style="color: white; text-align: center; font-weight: bold">\n' +
                            '                                                            ' + obj.name + '</h5>\n' +
                            '                                                    </div>\n' +
                            '                                                    <img src="/resources/dist/img/car.jpg" alt="...">\n' +
                            '                                                    <div class="card-body">\n' +
                            '                                                        <h5 style="font-weight: bold;display: block" class="card-title">\n' +
                            '                                                            Detailer : ' + obj.user.firstname + ' ' + obj.user.lastname + '</h5>\n' +
                            '                                                        <h6 class="card-text mb-0">City : <span>' + obj.city + '</h6>\n' +
                            '                                                        <h6 class="card-text mb-2">Phone : <span>' + obj.phone + '</h6>\n' +
                            '\n' +
                            '                                                        <div onclick="seemore(event)" data-cid="' + obj.id + '" data-id="' + obj.user.id + '" data-city="' + obj.city + '" data-name="' + obj.name + '"  data-phone="' + obj.phone + '" data-state="' + obj.state + '" data-trate="' + obj.totalRate + '" data-toggle="modal" data-target="#seemore"\n' +
                            '                                                            style="color:#0f6674;display: inline-block; margin-top:10px;cursor: pointer"\n' +
                            '                                                            class="card-text">See\n' +
                            '                                                            more </div>\n' +
                            '\n' +
                            '                                                        <button onclick="DeleteWashCenter(event)" data-name="' + obj.name + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#deleteWashCenter"\n' +
                            '                                                                class="float-right btn btn-danger">Delete\n' +
                            '                                                        </button>\n' +
                            '                                                    </div>\n' +
                            '                                                </div>\n' +
                            '                                            </div>\n' +
                            '                                        </div>');

                    }
                }

            },
            error: function (err) {
                console.log(err);
            }
        });

        //    ---------------------------------------------All Review and Rating-----------------------------------------
        $.ajax({
            url: '/review_ratings',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    var rateSet = '';
                    if (obj.rating == 0) {
                        rateSet = '<span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else if (obj.rating == 1) {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else if (obj.rating == 2) {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else if (obj.rating == 3) {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else if (obj.rating == 4) {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked" ></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>';
                    }

                    $('#allReviewAndRatingList').append('<div class="col-md-6 col-sm-12 ">\n' +
                        '                                        <div>\n' +
                        '                                            <div class="card" style="">\n' +
                        '                                                <div class="card-body" data-toggle="modal">\n' +
                        '                                                    <h6><span>'+obj.customer.firstname+' '+obj.customer.lastname+'</span></h6>\n' +
                        '                                                    <h6><span>Wash center: '+obj.washCenter.name+'</span></h6>\n' +
                        '                                                    <div>\n' +
                        '                                                        '+rateSet+'\n' +
                        '                                                    </div>\n' +
                        '                                                    <h6 class="card-text">\n' +
                        '                                                        '+obj.review+'</h6>\n' +
                        '                                                    <button onclick="DeleteReview(event)" data-userid="' + obj.id + '" data-toggle="modal" data-target="#deleteReview"\n' +
                        '                                                            class="btn btn-danger float-right">Delete\n' +
                        '                                                    </button>\n' +
                        '                                                </div>\n' +
                        '                                            </div>\n' +
                        '                                        </div>\n' +
                        '                                    </div>');



                }

            },
            error: function (err) {
                console.log('gggherr')
                console.log(err);
            }
        });


    });

    //-----------------------------------------user--------------------------------------
    function ApprovUser(event) {
        var userId = event.path[0].getAttribute('data-userid')
        var name = event.path[0].getAttribute('data-name')
        $('#approveUserName').text(name);
        $('#confirmApproveBtn').attr('data-userid', userId);
    }

    function ConfirmApprovUser(event) {
        var userId = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/users/change?userid=' + userId + '&state=ACCEPTED',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.assign('/dashboards/admin?user=${user}&token=${token}&userType=${userType}');
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }

    function filterCenters() {
        var name = $("#searchbyname").val();
        var city = $("#searchbycity").val();
        $('#allWashCenterList').empty();
        $.ajax({
            url: '/washCenters/filter_other_centers?name=' + name + '&city=' + city + '&vehicletype=' + '',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                console.log(result.length);
                console.log(result[0]);
                for (let i = 0; i < result.length; i++) {
                    var obj = result[i];
                    if (obj.user.id != user) {
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
                        $('#allWashCenterList').append('<div class="col-md-4 col-sm-12  ">\n' +
                            '                    <div>\n' +
                            '                        <div class="card" style="width: 18rem; ">\n' +
                            '                            <div class="p-1 mt-3"\n' +
                            '                                 style="background-color: rgba(0,51,69,0.7);position: absolute;width: 200px;right: 0">\n' +
                            '                                <h5 style="color: white; text-align: center; font-weight: bold">' + obj.name + '</h5>\n' +
                            '                            </div>\n' +
                            '                            <img src="/resources/dist/img/car.jpg" alt="...">\n' +
                            '                            <div class="card-body" onclick="seemore(event)" data-cid="' + obj.id + '" data-id="' + obj.user.id + '" data-city="' + obj.city + '" data-name="' + obj.name + '"  data-phone="' + obj.phone + '" data-state="' + obj.state + '" data-trate="' + obj.totalRate + '" class="card-body" data-toggle="modal" data-target="#seemore">\n' +
                            '\n' +
                            '                                <div>\n' +
                            '                                    ' + rateHtml + '\n' +
                            '                                </div>\n' +
                            '                                <h5 style="font-weight: bold;display: block" class="card-title">' + obj.city + '</h5>\n' +
                            '                                <h6 class="card-text mb-0">' + obj.phone + '</h6>\n' +
                            '                                <h6 class="card-text mb-2">Total Slot : ' + obj.totalSlot + '</h6>\n' +
                            '\n' +
                            '                                <h6 style="text-align:center; margin-top:10px;cursor: pointer" class="card-text">See\n' +
                            '                                    more </h6>\n' +
                            '\n' +
                            '                            </div>\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                </div>');
                    }
                }

            },
            error: function (err) {
                alert("error occured while searching")
                //location.reload();
            }
        });

    }

    function filterPackagesByUser() {
        var userId = $("#packageUserId").val();
        $('#allPackageList').empty();
        var url = "";
        if(userId == ''){
            url = '/packages';
        } else{
            url = '/packages/user/'+userId;
        }
        $.ajax({
            url: url,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    if (obj.state != "DELETED" && obj.state != "PENDING") {

                        $('#allPackageList').append('<div class="col-md-4 col-sm-12  ">\n' +
                            '                                            <div>\n' +
                            '                                                <div class="card" style="width: 18rem; ">\n' +
                            '                                                    <div class="card-body" data-toggle="modal">\n' +
                            '                                                        <h5 class="card-text font-weight-bold">Detailer : ' + obj.user.firstname + ' ' + obj.user.lastname + '</h5>\n' +
                            '                                                        <h6 class="card-text">' + obj.type.type + '</h6>\n' +
                            '                                                        <h6 class="card-text">Rs. ' + obj.price + '</h6>\n' +
                            '                                                        <h6 class="card-text">' + obj.state + '</h6>\n' +
                            '                                                        <h6 data-description="' + obj.description + '" style="color: #00A7AA;cursor: pointer" onclick="viewNote(event)" class="card-text">See more</h6>\n' +
                            '                                                        <div class="col-12 text-center">\n' +
                            '                                                            <button onclick="DeletePackage(event)" data-name="' + obj.description + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#deletePackage"\n' +
                            '                                                                    class="btn btn-danger">Delete\n' +
                            '                                                            </button>\n' +
                            '                                                        </div>\n' +
                            '                                                    </div>\n' +
                            '                                                </div>\n' +
                            '                                            </div>\n' +
                            '                                        </div>')
                    }
                }

            },
            error: function (err) {
                alert("error occured while searching")
                //location.reload();
            }
        });

    }

    function filterReviews(){
        var washCenterId = $("#reviewWashcenter").val();
        $('#allReviewAndRatingList').empty();
        var url = "";
        if(washCenterId == ''){
            url = '/review_ratings';
        } else{
            url = '/review_ratings/wash_center/'+washCenterId;
        }
        $.ajax({
            url: url,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    var rateSet = '';
                    if (obj.rating == 0) {
                        rateSet = '<span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else if (obj.rating == 1) {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else if (obj.rating == 2) {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star "></span>\n' +
                            '                                                        <span class="fa fa-star"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else if (obj.rating == 3) {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else if (obj.rating == 4) {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star"></span>';
                    } else {
                        rateSet = '<span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>\n' +
                            '                                                        <span class="fa fa-star checked" ></span>\n' +
                            '                                                        <span class="fa fa-star checked"></span>';
                    }
                    $('#allReviewAndRatingList').append('<div class="col-md-6 col-sm-12 ">\n' +
                        '                                        <div>\n' +
                        '                                            <div class="card" style="">\n' +
                        '                                                <div class="card-body" data-toggle="modal">\n' +
                        '                                                    <h6><span>'+obj.customer.firstname+' '+obj.customer.lastname+'</span></h6>\n' +
                        '                                                    <h6><span>Wash center: '+obj.washCenter.name+'</span></h6>\n' +
                        '                                                    <div>\n' +
                        '                                                        '+rateSet+'\n' +
                        '                                                    </div>\n' +
                        '                                                    <h6 class="card-text">\n' +
                        '                                                        '+obj.review+'</h6>\n' +
                        '                                                    <button onclick="DeleteReview(event)" data-userid="' + obj.id + '" data-toggle="modal" data-target="#deleteReview"\n' +
                        '                                                            class="btn btn-danger float-right">Delete\n' +
                        '                                                    </button>\n' +
                        '                                                </div>\n' +
                        '                                            </div>\n' +
                        '                                        </div>\n' +
                        '                                    </div>');



                }

                },


            error: function (err) {
                alert("error occured while searching")
                //location.reload();
            }
        });
    }


    function RejectUser(event) {
        var userId = event.path[0].getAttribute('data-userid');
        var name = event.path[0].getAttribute('data-name');
        $('#rejectUserName').text(name);
        $('#confirmRejectBtn').attr('data-userid', userId);

    }

    function ConfirmRejectUser(event) {
        var userId = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/users/change?userid=' + userId + '&state=REJECTED',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }

    function ConfirmLockUser(event) {
        var userId = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/users/change?userid=' + userId + '&state=LOCK',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                console.log('result: ', result);
                location.assign('/dashboards/admin?user=${user}&token=${token}&userType=${userType}');
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });

    }

    function DeleteUser(event) {
        var userId = event.path[0].getAttribute('data-userid');
        var name = event.path[0].getAttribute('data-username');
        $('#deleteUserName').text(name);
        $('#confirmDeleteBtn').attr('data-userid', userId);
    }

    function ConfirmDeleteUser(event) {
        var userId = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/users/change?userid=' + userId + '&state=DELETED',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }

    //--------------------------------------------Package--------------------------------------


    function ApprovPackage(event) {
        var userId = event.path[0].getAttribute('data-userid')
        $('#approvePackageId').text(userId);
        $('#confirmApprovePackageBtn').attr('data-userid', userId);
    }

    function ConfirmApprovPackage(event) {
        var packageid = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/packages/state?packageid=' + packageid + '&state=ACCEPTED',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }

    function RejectPackage(event) {
        var userId = event.path[0].getAttribute('data-userid');
        var name = event.path[0].getAttribute('data-name');
<%--        $('#rejectPackageId').text(userId);--%>
        $('#rejectPackageName').text(name);
        $('#confirmRejectPackageBtn').attr('data-userid', userId);
    }


    function ConfirmRejectPackage(event) {
        var packageid = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/packages/state?packageid=' + packageid + '&state=REJECTED',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }

    function DeletePackage(event) {
        var userId = event.path[0].getAttribute('data-userid');
        var name = event.path[0].getAttribute('data-name');
        $('#deletePackageId').text(userId);
        $('#deletePackageName').text(name);
        $('#confirmDeletePackageBtn').attr('data-userid', userId);
    }

    function ConfirmDeletePackage(event) {
        var packageid = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/packages/state?packageid=' + packageid + '&state=DELETED',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }

    //--------------------------------------------Wash Center---------------------------------------------------
    function ApprovWashCenter(event) {
        var userId = event.path[0].getAttribute('data-userid')
        var centerName = event.path[0].getAttribute('data-name')
        console.log('wash center details: ',event.path[0]);
        $('#approveWashCenterId').text(userId);
        $('#approveWashCenterName').text(centerName);
        $('#confirmApproveWashCenterBtn').attr('data-userid', userId);
    }

    function ConfirmApprovWashCenter(event) {
        var washcenterid = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/washCenters/change_state?id=' + washcenterid + '&state=ACTIVE',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.assign('/dashboards/admin?user=${user}&token=${token}&userType=${userType}');
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }

    function RejectWashCenter(event) {
        var userId = event.path[0].getAttribute('data-userid');
        var centerName = event.path[0].getAttribute('data-name');
        $('#rejectWashCenterId').text(userId);
        $('#rejectWashCenterName').text(centerName);
        $('#confirmRejectWashCenterBtn').attr('data-userid', userId);
    }


    function ConfirmRejectWashCenter(event) {
        var washcenterid = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/washCenters/change_state?id=' + washcenterid + '&state=DELETED',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.assign('/dashboards/admin?user=${user}&token=${token}&userType=${userType}');
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }

    function DeleteWashCenter(event) {
        var userId = event.path[0].getAttribute('data-userid')
        var centerName = event.path[0].getAttribute('data-name')
        $('#deleteWashCenterId').text(userId);
        $('#deleteWashCenterName').text(centerName);
        $('#confirmDeleteWashCenterBtn').attr('data-userid', userId);
    }

    function ConfirmDeleteWashCenter(event) {
        var washcenterid = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/washCenters/change_state?id=' + washcenterid + '&state=DELETED',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.assign('/dashboards/admin?user=${user}&token=${token}&userType=${userType}');
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }
    //-------------------------------------------Review And Rating------------------------------------------------

    function DeleteReview(event) {
        var userId = event.path[0].getAttribute('data-userid')
        $('#deleteReviewId').text(userId);
        $('#confirmDeleteReviewBtn').attr('data-userid', userId);
    }

    function ConfirmDeleteReview(event) {
        var reviewid = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/review_ratings/' + reviewid,
            method: 'delete',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.assign('/dashboards/admin?user=${user}&token=${token}&userType=${userType}');
            },
            error: function (err) {
                alert("error occured while accepting")
                location.reload();
            }
        });
    }
    //--------------------------------------------Description Alart----------------------------------------------


    function viewNote() {
        var note = event.path[0].getAttribute('data-description')

        Swal.fire({
            title: 'Description',
            html: '<h3 style="font-weight:bold;">' + note + '</h3>',
            icon: 'info',
            showCancelButton: false,
            confirmButtonColor: 'rgba(0, 51, 69,0.8)',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ok',
            cancelButtonText: 'No'
        })

    }

    function searchfromusertype() {
        var type = $('#usertype :selected').val()
        console.log(type);

        $.ajax({
            url: '/users/type?Usertype=' + type,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $('#allUserList').empty();
                console.log(result)
                console.log(result.data)
                for (var obj of result.data) {

                        if (obj.state == "ACCEPTED") {
                            $('#allUserList').append('<div class="col-md-4 col-sm-12  ">\n' +
                                '                                            <div>\n' +
                                '                                                <div class="card" style="width: 18rem; ">\n' +
                                '                                                    <div class="card-body" data-toggle="modal">\n' +
                                '                                                        <h5 class="card-text font-weight-bold">' + obj.firstname + ' ' + obj.lastname + '</h5>\n' +
                                '                                                        <h6 class="card-text">' + obj.phone + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.city + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.role.name + '</h6>\n' +
                                '                                                        <h6 class="card-text" style="color: #2E8B57">' + obj.state + '</h6>\n' +
                                '                                                        <div class="col-12 text-center">\n' +
                                '                                                            <button onclick="ConfirmLockUser(event)" data-userid="' + obj.id + '" class="btn btn-success">Lock &nbsp;<i\n' +
                                '                                                                    class="fas fa-unlock"></i></button>\n' +
                                '                                                            <button onclick="DeleteUser(event)" data-username="' + obj.firstname + ' ' + obj.lastname + '" data-toggle="modal" data-target="#delete"\n' +
                                '                                                                    class="btn btn-danger">Delete\n' +
                                '                                                            </button>\n' +
                                '                                                        </div>\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>')
                        } else if (obj.state == "LOCK") {
                            $('#allUserList').append('<div class="col-md-4 col-sm-12  ">\n' +
                                '                                            <div>\n' +
                                '                                                <div class="card" style="width: 18rem; ">\n' +
                                '                                                    <div class="card-body" data-toggle="modal">\n' +
                                '                                                        <h5 class="card-text font-weight-bold">' + obj.firstname + ' ' + obj.lastname + '</h5>\n' +
                                '                                                        <h6 class="card-text">' + obj.phone + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.city + '</h6>\n' +
                                '                                                        <h6 class="card-text" style="color: #2E8B57">' + obj.state + '</h6>\n' +
                                '                                                        <div class="col-12 text-center">\n' +
                                '                                                            <button onclick="ConfirmApprovUser(event)" data-userid="' + obj.id + '" class="btn btn-success">Unlock &nbsp;<i\n' +
                                '                                                                    class="fas fa-unlock"></i></button>\n' +
                                '                                                            <button onclick="DeleteUser(event)" data-username="' + obj.firstname + ' ' + obj.lastname + '" data-toggle="modal" data-target="#delete"\n' +
                                '                                                                    class="btn btn-danger">Delete\n' +
                                '                                                            </button>\n' +
                                '                                                        </div>\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>')
                        } else if (obj.state == "DELETED") {
                            $('#allUserList').append('<div class="col-md-4 col-sm-12  ">\n' +
                                '                                            <div>\n' +
                                '                                                <div class="card" style="width: 18rem; ">\n' +
                                '                                                    <div class="card-body" data-toggle="modal">\n' +
                                '                                                        <h5 class="card-text font-weight-bold">' + obj.firstname + ' ' + obj.lastname + '</h5>\n' +
                                '                                                        <h6 class="card-text">' + obj.phone + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.city + '</h6>\n' +
                                '                                                        <h6 class="card-text" style="color: #2E8B57">' + obj.state + '</h6>\n' +
                                '                                                        <div class="col-12 text-center">\n' +
                                '                                                            <button onclick="ConfirmLockUser(event)" data-userid="' + obj.id + '"  class="btn btn-success">Lock &nbsp;<i\n' +
                                '                                                                    class="fas fa-unlock"></i></button>\n' +
                                '                                                            <button disabled data-toggle="modal" data-target="#delete"\n' +
                                '                                                                    class="btn btn-danger">Delete\n' +
                                '                                                            </button>\n' +
                                '                                                        </div>\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>')
                        } else {
                            $('#allUserList').append('<div class="col-md-4 col-sm-12  ">\n' +
                                '                                            <div>\n' +
                                '                                                <div class="card" style="width: 18rem; ">\n' +
                                '                                                    <div class="card-body" data-toggle="modal">\n' +
                                '                                                        <h5 class="card-text font-weight-bold">' + obj.firstname + ' ' + obj.lastname + '</h5>\n' +
                                '                                                        <h6 class="card-text">' + obj.phone + '</h6>\n' +
                                '                                                        <h6 class="card-text">' + obj.city + '</h6>\n' +
                                '                                                        <h6 class="card-text" style="color: #2E8B57">' + obj.state + '</h6>\n' +
                                '                                                        <div class="col-12 text-center">\n' +
                                '                                                            <button disabled class="btn btn-success">Lock &nbsp;<i\n' +
                                '                                                                    class="fas fa-unlock"></i></button>\n' +
                                '                                                            <button disabled data-toggle="modal" data-target="#delete"\n' +
                                '                                                                    class="btn btn-danger">Delete\n' +
                                '                                                            </button>\n' +
                                '                                                        </div>\n' +
                                '                                                    </div>\n' +
                                '                                                </div>\n' +
                                '                                            </div>\n' +
                                '                                        </div>')
                        }


                }

            },
            error: function (err) {
                console.log(err)
            }
        });

    }

    function seemore(event) {
        var cid = event.path[0].getAttribute('data-id')
        var centerid = event.path[0].getAttribute('data-cid')
        var city = event.path[0].getAttribute('data-city')
        var name = event.path[0].getAttribute('data-name')
        var trate = event.path[0].getAttribute('data-trate')

        var phone = event.path[0].getAttribute('data-phone')
        var state = event.path[0].getAttribute('data-state')

        var rateHtml = '';
        if (trate == 0) {
            rateHtml = '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>';

        } else if (trate == 1) {
            rateHtml = '<span class="fa fa-star checked"></span>' +
                '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>';
        } else if (trate == 2) {
            rateHtml = '<span class="fa fa-star checked"></span>' +
                '<span class="fa fa-star checked"></span>' +
                '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>';
        } else if (trate == 3) {
            rateHtml = '<span class="fa fa-star checked"></span>' +
                '<span class="fa fa-star checked"></span>' +
                '<span class="fa fa-star checked"></span>' +
                '<span class="fa fa-star"></span>' +
                '<span class="fa fa-star"></span>';
        } else if (trate == 4) {
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

        $("#othermodels").empty();

        $("#othermodels").append('<div class="modal-content">\n' +
            '                    <div class="modal-header">\n' +
            '                        <div>\n' +
            '                            <h5 class="modal-title" id="">' + city + '</h5>\n' +
            '                            <p>' + name + '</p>\n' +
            '\n' +
            '                        </div>\n' +
            '\n' +
            '                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">\n' +
            '                            <span aria-hidden="true">&times;</span>\n' +
            '                        </button>\n' +
            '                    </div>\n' +
            '\n' +
            '\n' +
            '                    <div class="modal-body">\n' +
            '                        <div style="text-align: center">\n' +
            '                            <img style="width: 200px" src="/resources/dist/img/car.jpg" alt="">\n' +
            '                        </div>\n' +
            '\n' +
            '                        <div style="padding-left: 20px">\n' +
            '                        '+rateHtml+'</div>\n' +
            '                        <h6 style="padding-left: 20px">Contact: <span>' + phone + '</span></h6>\n' +
            '\n' +
            '\n' +
            '                        <div>\n' +
            '                            <div class="col-12 col-sm-12 col-lg-12">\n' +
            '                                <div class="card card-primary card-outline card-tabs">\n' +
            '                                    <div class="card-header p-0 pt-1 border-bottom-0">\n' +
            '                                        <ul class="nav nav-tabs" id="custom-tabs-two-tab"\n' +
            '                                            role="tablist">\n' +
            '                                            <li class="nav-item">\n' +
            '                                                <a class="nav-link active" onclick="loadPackages(event)" data-centid="' + centerid + '" id="custom-tabs-two-home-tab"\n' +
            '                                                   data-toggle="pill" href="#custom-tabs-two-homee"\n' +
            '                                                   role="tab" aria-controls="custom-tabs-two-homee"\n' +
            '                                                   aria-selected="true" >Packages</a>\n' +
            '                                            </li>\n' +
            '                                            <li class="nav-item">\n' +
            '                                                <a class="nav-link" onclick="loadReviewsAndRatings(event)" data-centid="' + centerid + '" \n' +
            '                                                   id="custom-tabs-two-profile-tab"\n' +
            '                                                   data-toggle="pill"\n' +
            '                                                   href="#custom-tabs-two-profile" role="tab"\n' +
            '                                                   aria-controls="custom-tabs-two-profile"\n' +
            '                                                   aria-selected="false" ">Reviews and Rating</a>\n' +
            '                                            </li>\n' +
            '\n' +
            '\n' +
            '                                        </ul>\n' +
            '                                    </div>\n' +
            '                                    <div class="card-body">\n' +
            '                                        <div class="tab-content" id="custom-tabs-two-tabContent">\n' +
            '                                            <div class="tab-pane fade active show"\n' +
            '                                                 role="tabpanel"\n' +
            '                                                 aria-labelledby="custom-tabs-two-home-tab">\n' +
            '                                                <div class="row" id="custom-tabs-two-homee">\n' +
            '                                                </div>\n' +
            '                                            </div>\n' +
            '                                            <div class="tab-pane fade active show"\n' +
            '                                                 id="custom-tabs-two-profile" role="tabpanel"\n' +
            '                                                 aria-labelledby="custom-tabs-two-profile-tab">\n' +
            '                                                <div class="row" id="ratings">\n' +
            '                                                </div>\n' +
            '                                            </div>\n' +
            '\n' +
            '                                        </div>\n' +
            '                                    </div>\n' +
            '                                    <!-- /.card -->\n' +
            '                                </div>\n' +
            '                            </div>\n' +
            '                        </div>\n' +
            '                    </div>\n' +
            '                    <div class="modal-footer">\n' +
            '                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel\n' +
            '                        </button>\n' +
            '\n' +
            '                    </div>\n' +
            '                </div>')


        $("#ratings").empty();


    }

    function loadPackages(event) {
        var centerid = event.path[0].getAttribute('data-centid');
        $.ajax({
            url: '/washCenters/washcenterid/' + centerid,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                var pacSet=result.data.packages
                $("#custom-tabs-two-homee").empty();
                // to hide the review section when Packages were clicked
                $("#ratings").empty();
                for (let i = 0; i < pacSet.length; i++) {
                    var pack = pacSet[i];

                    $("#custom-tabs-two-homee").append(
                        '                                                <table>\n' +
                        '                                                    <tr>\n' +
                        '                                                        <td style="width: 50px">' + pack.type.type + '</td>\n' +
                        '                                                        <td style="width: 150px">\n' +
                        '                                                            <ul style="list-style: none">\n' +
                        '                                                                <li>' + pack.description + '</li>\n' +
                        '                                                            </ul>\n' +
                        '                                                        </td>\n' +
                        '                                                        <th style="width: 70px">' + pack.price + '</th>\n' +
                        '                                                    </tr>\n' +
                        '                                                </table>');



                }
            },
            error: function (err) {
                console.log(err)

            }
        });
    }

    function loadReviewsAndRatings(event) {
        var centerid = event.path[0].getAttribute('data-centid');
        $("#ratings").empty();
        // to hide the content of package details when reviews were clicked
        $("#custom-tabs-two-homee").empty();

        $.ajax({
            url: '/review_ratings/wash_center/' + centerid,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {



                for (let i = 0; i < result.data.length; i++) {

                    var ob = result.data[i];
                    // console.log(ob);
                    // console.log(ob.rating);
                    if (ob.rating == 0) {
                        $("#ratings").append('                                                    <div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                        <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                             alt="">\n' +
                            '                                                    </div>\n' +
                            '                                                    <div class="col-md-10">\n' +
                            '                                                        <div>\n' +
                            '                                                            <span class="fa fa-star "></span>\n' +
                            '                                                            <span class="fa fa-star "></span>\n' +
                            '                                                            <span class="fa fa-star "></span>\n' +
                            '                                                            <span class="fa fa-star"></span>\n' +
                            '                                                            <span class="fa fa-star"></span>\n' +
                            '                                                        </div>\n' +
                            '                                                        <p>' + ob.review + '</p>\n' +
                            '                                                    </div>')
                    } else if (ob.rating == 1) {
                        $("#ratings").append('                                                    <div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                        <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                             alt="">\n' +
                            '                                                    </div>\n' +
                            '                                                    <div class="col-md-10">\n' +
                            '                                                        <div>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star "></span>\n' +
                            '                                                            <span class="fa fa-star "></span>\n' +
                            '                                                            <span class="fa fa-star"></span>\n' +
                            '                                                            <span class="fa fa-star"></span>\n' +
                            '                                                        </div>\n' +
                            '                                                        <p>' + ob.review + '</p>\n' +
                            '                                                    </div>')
                    } else if (ob.rating == 2) {
                        $("#ratings").append('                                                    <div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                        <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                             alt="">\n' +
                            '                                                    </div>\n' +
                            '                                                    <div class="col-md-10">\n' +
                            '                                                        <div>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star "></span>\n' +
                            '                                                            <span class="fa fa-star"></span>\n' +
                            '                                                            <span class="fa fa-star"></span>\n' +
                            '                                                        </div>\n' +
                            '                                                        <p>' + ob.review + '</p>\n' +
                            '                                                    </div>')
                    } else if (ob.rating == 3) {
                        $("#ratings").append('                                                    <div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                        <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                             alt="">\n' +
                            '                                                    </div>\n' +
                            '                                                    <div class="col-md-10">\n' +
                            '                                                        <div>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star"></span>\n' +
                            '                                                            <span class="fa fa-star"></span>\n' +
                            '                                                        </div>\n' +
                            '                                                        <p>' + ob.review + '</p>\n' +
                            '                                                    </div>')
                    } else if (ob.rating == 4) {
                        $("#ratings").append('                                                    <div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                        <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                             alt="">\n' +
                            '                                                    </div>\n' +
                            '                                                    <div class="col-md-10">\n' +
                            '                                                        <div>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star"></span>\n' +
                            '                                                        </div>\n' +
                            '                                                        <p>' + ob.review + '</p>\n' +
                            '                                                    </div>')
                    } else if (ob.rating == 5) {
                        $("#ratings").append('                                                    <div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                        <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                             alt="">\n' +
                            '                                                    </div>\n' +
                            '                                                    <div class="col-md-10">\n' +
                            '                                                        <div>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                            <span class="fa fa-star checked"></span>\n' +
                            '                                                        </div>\n' +
                            '                                                        <p>' + ob.review + '</p>\n' +
                            '                                                    </div>')
                    }

                }

            },
            error: function (err) {
                console.log(err)
            }
        });
    }


</script>
