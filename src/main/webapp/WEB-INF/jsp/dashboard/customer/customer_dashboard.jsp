<%@include file="/WEB-INF/jspf/header.jspf" %>
<body class="backgImg" style="background-image: url('/resources/dist/img/back.jpg');background-size: cover">
<%--navbar--%>

<%--navbar end--%>

<section>
    <div class="container titlediv">


        <div class="container" style="">


            <div style="margin-top: 100px;" class="row searchFilter ">
                <div class="col-sm-12">
                    <h4 class="wash">Wash Centers</h4>
                    <div class="input-group">
                        <div class="form-group mr-2">
                            <input class="form-control" type="text" placeholder="Enter Name" id="searchbyname">
                        </div>
                        <div class="form-group mr-2">
                            <input class="form-control" type="text" placeholder="Enter city" id="searchbycity">
                        </div>
                        <div class="input-group-btn">

                            <div class="form-group mr-2">
                                <%--                                <input placeholder="Date" class=" form-control textbox-n" type="text" onfocus="(this.type='date')" id="date">--%>
                                <%--                                <input class="form-control" type="text" placeholder="Pick a date"--%>
                                <%--                                       onfocus="(this.type='date')"--%>
                                <%--                                       onblur="(this.type='text')" id="searchbydate">--%>
                                <%--                                <input class="form-control " type="date" required>--%>
                                <input id="searchbydate" type="text" name="date" placeholder="Pick a Date"
                                       class="form-control  datepicker" autocomplete="off">
                            </div>

                        </div>
                        <div class="input-group-btn mr-2">

                            <div class="form-group">
                                <input class="form-control" type="time"  placeholder="From" required id="searchbyfromtime">
                            </div>

                        </div>

                        <div class="input-group-btn">
                            <div class="form-group">
                                <input class="form-control" type="time" placeholder="To" required id="searchbytotime">
                            </div>
                        </div>
                        <div class="input-group-btn">

                        </div>
                        <div class="input-group-btn pl-4 pr-4">

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="searchall">
                                <label style="font-weight: 700" class="form-check-label">
                                    All
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault"
                                       id="searchavailable"
                                       checked>
                                <label style="font-weight: 700" class="form-check-label">
                                    Available
                                </label>
                            </div>
                        </div>

                        <div class="input-group-btn">
                            <button id="searchBtn" type="button" class="btn btn-secondary btn-search"><span
                                    class="glyphicon glyphicon-search">&nbsp;</span> <span
                                    class="label-icon" onclick="filtercenters()">Search</span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container row titlediv  p-4 " id="washcenterMainDiv">

        </div>

        <%--        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>

        <div class="modal fade mod" id="test1" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div style="background-color: rgba(0, 51, 69,0.8);color: white" class="modal-header">
                        <h4>Book Now</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span style="color: white" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form>

                            <div class="form-group">
                                <span class="form-label">Vehicle Number</span>
                                <input class="form-control" type="text"
                                       placeholder="Enter vehicle number" id="vehicleNumber">
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Date</span>
                                        <input class="form-control datepicker" type="" id="bookingdate" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Time</span>
                                        <input class="form-control" type="time" id="bookingtime" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <span class="form-label">Select Package </span>
                                            <div id="selectpackages"></div>
                                            <%--                                            <div id="myDIV">--%>
                                            <%--                                                <table>--%>
                                            <%--                                                    <tr>--%>
                                            <%--                                                        <td style="width: 20px">--%>
                                            <%--                                                            <div class="form-check">--%>
                                            <%--                                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">--%>
                                            <%--                                                            </div>--%>
                                            <%--                                                        </td>--%>
                                            <%--                                                        <td style="width: 90px">package 1</td>--%>
                                            <%--                                                        <td style="width: 80px">small car</td>--%>
                                            <%--                                                        <td >--%>
                                            <%--                                                            <ul>--%>
                                            <%--                                                                <li>Full Body Wash</li>--%>
                                            <%--                                                                <li>Full Body Wash</li>--%>
                                            <%--                                                                <li>Full Body Wash</li>--%>
                                            <%--                                                            </ul>--%>
                                            <%--                                                        </td>--%>
                                            <%--                                                        <th style="width: 70px">100000</th>--%>
                                            <%--                                                    </tr>--%>
                                            <%--                                                </table>--%>
                                            <%--                                            </div>--%>


                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span class="form-label">Special Note</span>
                                    <textarea class="form-control" type="textarea"
                                              placeholder="Enter Special Note" id="specialNote"></textarea>
                                </div>
                            </div>


                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel
                        </button>
                        <button id="bookModelBtn"  type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#test2" onclick="openBookConfirm(event)">Book
                        </button>

                        <%--                                        ---------------------------------------------------------------------------------------------%>

                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="test2" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div style="background-color: rgba(0, 51, 69,0.8);color: white" class="modal-header">
                        <h4>Booking Confirmation</h4>
                        <%--                        <button type="button" class="close" data-target="#test1" data-toggle="modal" data-dismiss="modal"--%>
                        <%--                                aria-label="Close">--%>
                        <%--                            <span style="color: white" aria-hidden="true">&times;</span>--%>
                        <%--                        </button>--%>
                    </div>
                    <div class="modal-body">


                        <table class="bookin_table" style="width:100%" id="bookingtable">

                        </table>

                        </ul>


                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" data-target="#test2" data-bs-toggle="modal"
                                data-dismiss="modal">Cancel
                        </button>
                        <button id="btnConfirm" type="button" class="btn btn-primary" onclick="book(event)">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
        <%--                        -------------------------------%>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div id="innermodelnameandcity">


                        </div>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body">
                        <div style="text-align: center">
                            <img style="width: 200px" src="/resources/dist/img/car.jpg" alt="">
                        </div>

                        <div style="padding-left: 20px" id="innermodelratings">

                        </div>
                        <h6 style="padding-left: 20px">Contact: <span id="innermodelcontact"></span></h6>


                        <div style="padding-left: 20px;">
                            <div id="tab">
                                <div class="col-12 col-sm-12 col-lg-12">
                                    <div class="card card-primary card-outline card-tabs">
                                        <div class="card-header p-0 pt-1 border-bottom-0">
                                            <ul class="nav nav-tabs" id="custom-tabs-two-tab"
                                                role="tablist">
                                                <li class="nav-item" onclick="getAllPackages()">
                                                    <a class="nav-link" id="custom-tabs-two-home-tab"
                                                       data-toggle="pill" href="#custom-tabs-two-home"
                                                       role="tab" aria-controls="custom-tabs-two-home"
                                                       aria-selected="false">Packagess</a>
                                                </li>
                                                <li class="nav-item" onclick="getAllReviews()">
                                                    <a class="nav-link active"
                                                       id="custom-tabs-two-profile-tab"
                                                       data-toggle="pill"
                                                       href="#custom-tabs-two-profile" role="tab"
                                                       aria-controls="custom-tabs-two-profile"
                                                       aria-selected="true">Reviews and Rating</a>
                                                </li>


                                            </ul>
                                        </div>
                                        <div class="card-body">
                                            <div class="tab-content" id="custom-tabs-two-tabContent">


                                                <div class="tab-pane fade" id="custom-tabs-two-home"
                                                     role="tabpanel"
                                                     aria-labelledby="custom-tabs-two-home-tab">
                                                    <div class="appendPackages">
                                                        <%--                                                        <h3>Package 01</h3>--%>
                                                        <%--                                                        <table>--%>
                                                        <%--                                                            <tr>--%>
                                                        <%--                                                                <td style="width: 50px">small car</td>--%>
                                                        <%--                                                                <td style="width: 150px">--%>
                                                        <%--                                                                    <ul style="list-style: none">--%>
                                                        <%--                                                                        <li>Full Body Wash</li>--%>
                                                        <%--                                                                        <li>Full Body Wash</li>--%>
                                                        <%--                                                                        <li>Full Body Wash</li>--%>
                                                        <%--                                                                    </ul>--%>
                                                        <%--                                                                </td>--%>
                                                        <%--                                                                <th style="width: 70px">RS.1000.00</th>--%>
                                                        <%--                                                            </tr>--%>
                                                        <%--                                                        </table>--%>
                                                    </div>

                                                </div>


                                                <div class="tab-pane fade active show"
                                                     id="custom-tabs-two-profile" role="tabpanel"
                                                     aria-labelledby="custom-tabs-two-profile-tab">
                                                    <div class="row" id="reviewandrating">
                                                        <%--                                                        <div style="margin-bottom: 20px" class="col-md-2">--%>
                                                        <%--                                                            <img style="width: 50px" src="/resources/dist/img/1.jpg"--%>
                                                        <%--                                                                 alt="">--%>
                                                        <%--                                                        </div>--%>
                                                        <%--                                                        <div class="col-md-10">--%>
                                                        <%--                                                            <div>--%>
                                                        <%--                                                                <span class="fa fa-star checked"></span>--%>
                                                        <%--                                                                <span class="fa fa-star checked"></span>--%>
                                                        <%--                                                                <span class="fa fa-star checked"></span>--%>
                                                        <%--                                                                <span class="fa fa-star"></span>--%>
                                                        <%--                                                                <span class="fa fa-star"></span>--%>
                                                        <%--                                                            </div>--%>
                                                        <%--                                                            <p>Good...!</p>--%>
                                                        <%--                                                        </div>--%>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <!-- /.card -->
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel
                                        </button>

                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>
    <%--                        ---------------------------------------------------------------------%>


</section>
</body>


<%@include file="/WEB-INF/jspf/footer.jspf" %>

<script>
    var token = '${token}';
    var user = '${user}';
    var notificationCount = 0;
    var washcenterid;
    var washcenterownerid;

    var customer;
    var detailer;
    var date;
    var fromtime;
    var washCenter;
    var vehicleNo;
    var specialNote;

    var packageid;

    var selectedpackage;

    $(function () {

        $('.customer-washcenter').addClass("active");
        //----------------------------------------------------Notification---------------------------------
        //
        // $.ajax({
        //     url: '/notifications',
        //     method: 'get',
        //     contentType: "application/json",
        //     headers: {
        //         "Authorization": "Bearer " + token
        //     },
        //     success: function (result) {
        //         for (const obj of result.data) {
        //             console.log(obj.receiver.id)
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
        //         console.log('err')
        //         console.log( err);
        //     }
        // });

        //-------------------------------------------------Wash Centers---------------------------------------------
        $.ajax({
            url: '/washCenters/washCenterDetails',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                var count = 0;
                $("#washcenterMainDiv").empty();
                for (const obj of result.data) {
                    washcenterid = obj.id

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

                    $("#washcenterMainDiv").append("<div class=\"col-md-4 col-sm-12  \">\n" +
                        "                <div >\n" +
                        "                    <div class=\"card\" style=\"width: 18rem; \">\n" +
                        "<div class=\"p-1 mt-3\" style=\"background-color: rgba(0,51,69,0.7);position: absolute;width: 200px;right: 0\">" +
                        "<h5 style=\"color: white; text-align: center; font-weight: bold\">" + obj.name + "</h5>" +
                        "</div>\n" +
                        "                        <img src=\"/resources/dist/img/car.jpg\" alt=\"...\">\n" +
                        "                        <div data-washcenterid=\"" + obj.id + "\" data-washcentername=\"" + obj.name + "\" data-washcentercity=\"" + obj.city + "\" data-washcentertotalrate=\"" + obj.totalRate + "\"  data-washcentercenterphn=\"" + obj.phone + "\" data-washcenterownerphn=\"" + obj.user.phone + "\" data-washcenterownerid=\"" + obj.user.id + "\" class=\"card-body\" onclick='setData(this)' data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n" +

                        // "                            <h5 style=\"font-weight: bold;display: block\" class=\"card-title\">"+obj.name+"</h5>\n" +
                        "                            <h6 class=\"card-text\">" + obj.city + "</h6>\n" +

                        "                         <div >" + rateHtml + "</div>" +
                        "                            <h6 style=\"text-align: center;cursor: pointer\" class=\"card-text\">See more </h6>\n" +
                        "\n" +
                        "                        </div>\n" +
                        "                        <a href=\"#\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#test1\" onclick=\"booknow(event)\" data-washcenterid=\"" + obj.id + "\">Book now</a>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>");


                    coutn = count + 1;
                }
            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });


    })

    function book(event) {
        var washcenterid = event.path[0].getAttribute('data-washcenterid')
        $.ajax({
            url: '/bookings',
            method: 'post',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            data: JSON.stringify({
                id: "12345",
                customer: {
                    id: customer
                },
                detailer: {
                    id: detailer
                },
                stringtime: fromtime + ':00',
                date: date,

                status: "PENDING",
                washCenter: {
                    id: washcenterid
                },
                vehicleNo: vehicleNo,
                specialNote: specialNote,
                packages: {
                    id: packageid
                },
                isReview: false
            }),
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                location.reload();
            }
        });

    }

    function openBookConfirm(event) {
        var vehicleTypeId = $('#vehicleTypeOptions option:selected').val();
        var washcenter = event.path[0].getAttribute('data-washcenterid')
        $('#btnConfirm').attr('data-washcenterid', washcenter);

        customer = user;
        detailer = washcenterownerid
        date = $("#bookingdate").val();
        fromtime = $("#bookingtime").val();
        washCenter = washcenterid;
        vehicleNo = $("#vehicleNumber").val();
        specialNote = $("#specialNote").val();
        selectedpackage = $('input[name="flexRadioDefault"]:checked')[1].getAttribute('data-vehicletype');

        packageid = $('input[name="flexRadioDefault"]:checked')[1].getAttribute('data-packageid');


        $("#bookingtable").empty();
        $("#bookingtable").append('<tr>\n' +
            '                                                <th>Vehicle Number</th>\n' +
            '                                                <td>' + vehicleNo + '</td>\n' +
            '                                            </tr>\n' +
            '                                            <tr>\n' +
            '                                                <th>Date</th>\n' +
            '                                                <td>' + date + '</td>\n' +
            '                                            </tr>\n' +
            '                                            <tr>\n' +
            '                                                <th>From</th>\n' +
            '                                                <td>' + fromtime + '</td>\n' +
            '                                            </tr>\n' +
            '                                            <tr>\n' +
            '                                                <th>Package</th>\n' +
            '                                                <td>' + selectedpackage + '</td>\n' +
            '                                            </tr>');


    }

    function booknow(event) {
        var washcenterid = event.path[0].getAttribute('data-washcenterid')
        getAllPackages(washcenterid)
        $('#bookModelBtn').attr('data-washcenterid', washcenterid);


    }


    function getAllReviews() {

        $.ajax({
            url: '/review_ratings/wash_center/' + washcenterid,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $("#reviewandrating").empty();
                console.log(result)
                for (const obj of result.data) {
                    console.log(obj.review);
                    if (obj.rating == 0) {
                        $("#reviewandrating").append('<div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                            <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                                 alt="">\n' +
                            '                                                        </div>\n' +
                            '                                                        <div class="col-md-10">\n' +
                            '                                                            <div>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                            </div>\n' +
                            '                                                            <p>' + obj.review + '</p>\n' +
                            '                                                        </div>');
                    } else if (obj.rating == 1) {
                        $("#reviewandrating").append('<div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                            <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                                 alt="">\n' +
                            '                                                        </div>\n' +
                            '                                                        <div class="col-md-10">\n' +
                            '                                                            <div>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                            </div>\n' +
                            '                                                            <p>' + obj.review + '</p>\n' +
                            '                                                        </div>');
                    } else if (obj.rating == 2) {

                        $("#reviewandrating").append('<div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                            <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                                 alt="">\n' +
                            '                                                        </div>\n' +
                            '                                                        <div class="col-md-10">\n' +
                            '                                                            <div>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                            </div>\n' +
                            '                                                            <p>' + obj.review + '</p>\n' +
                            '                                                        </div>');
                    } else if (obj.rating == 3) {

                        $("#reviewandrating").append('<div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                            <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                                 alt="">\n' +
                            '                                                        </div>\n' +
                            '                                                        <div class="col-md-10">\n' +
                            '                                                            <div>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                            </div>\n' +
                            '                                                            <p>' + obj.review + '</p>\n' +
                            '                                                        </div>');
                    } else if (obj.rating == 4) {

                        $("#reviewandrating").append('<div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                            <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                                 alt="">\n' +
                            '                                                        </div>\n' +
                            '                                                        <div class="col-md-10">\n' +
                            '                                                            <div>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star"></span>\n' +
                            '                                                            </div>\n' +
                            '                                                            <p>' + obj.review + '</p>\n' +
                            '                                                        </div>');
                    } else if (obj.rating == 5) {

                        $("#reviewandrating").append('<div style="margin-bottom: 20px" class="col-md-2">\n' +
                            '                                                            <img style="width: 50px" src="/resources/dist/img/1.jpg"\n' +
                            '                                                                 alt="">\n' +
                            '                                                        </div>\n' +
                            '                                                        <div class="col-md-10">\n' +
                            '                                                            <div>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                                <span class="fa fa-star checked"></span>\n' +
                            '                                                            </div>\n' +
                            '                                                            <p>' + obj.review + '</p>\n' +
                            '                                                        </div>');
                    }


                }
            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

    }


    function getAllPackages(washcenterid) {
        $.ajax({
            url: '/washCenters/washcenterid/' + washcenterid,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $(".appendPackages").empty();
                $("#selectpackages").empty();
                for (const obj of result.data.packages) {
                    $(".appendPackages").append('<h3></h3>\n' +
                        '                                                        <table>\n' +
                        '                                                            <tr>\n' +
                        '                                                                <td style="width: 50px">' + obj.type.type + '</td>\n' +
                        '                                                                <td style="width: 150px">\n' +
                        '                                                                    <ul style="list-style: none">\n' +
                        '                                                                        <li>Full Body Wash</li>\n' +
                        '                                                                    </ul>\n' +
                        '                                                                </td>\n' +
                        '                                                                <th style="width: 70px">Rs: ' + obj.price + '/=</th>\n' +
                        '                                                            </tr>\n' +
                        '                                                        </table>')

                    $("#selectpackages").append('<div id=' + obj.id + '>\n' +
                        '                                                <table>\n' +
                        '                                                    <tr>\n' +
                        '                                                        <td style="width: 20px">\n' +
                        '                                                            <div class="form-check">\n' +
                        '                                                                <input class="form-check-input" data-packageid="' + obj.id + '" data-vehicletype="' + obj.type.type + ' - ' + obj.price + '" value="' + obj.id + '" type="radio" name="flexRadioDefault" id="flexRadioDefault1">\n' +
                        '                                                            </div>\n' +
                        '                                                        </td>\n' +
                        '                                                        <td style="width: 80px">' + obj.type.type + '</td>\n' +
                        '                                                        <td >\n' +
                        '                                                            <ul>\n' +
                        '                                                                <li>' + obj.description + '</li>\n' +
                        '                                                            </ul>\n' +
                        '                                                        </td>\n' +
                        '                                                        <th style="width: 70px">Rs: ' + obj.price + '/=</th>\n' +
                        '                                                    </tr>\n' +
                        '                                                </table>\n' +
                        '                                            </div>\n')
                }
            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

    }


    function setData(event) {
        washcenterid = event.getAttribute('data-washcenterid');
        var washcentername = event.getAttribute('data-washcentername');
        var washcentercity = event.getAttribute('data-washcentercity');
        var washcentertotalrate = event.getAttribute('data-washcentertotalrate');
        var washcentercenterphn = event.getAttribute('data-washcentercenterphn');
        var washcenterownerphn = event.getAttribute('data-washcenterownerphn');
        washcenterownerid = event.getAttribute('data-washcenterownerid');

        if (washcentercenterphn == 'null') {
            var contact = washcenterownerphn;
        } else {
            var contact = washcentercenterphn;
        }
        $("#innermodelnameandcity").empty();
        $("#innermodelratings").empty();
        $("#innermodelcontact").empty();
        //$("#tab").empty();
        $("#innermodelnameandcity").append(' <h5 class="modal-title" id="exampleModalLongTitle">' + washcentername + '</h5>\n' +
            '                            <p>' + washcentercity + '</p>');
        if (washcentertotalrate == 0) {
            $("#innermodelratings").append(' <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>')
        } else if (washcentertotalrate == 1) {
            $("#innermodelratings").append(' <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>')
        } else if (washcentertotalrate == 2) {
            $("#innermodelratings").append(' <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>')
        } else if (washcentertotalrate == 3) {
            $("#innermodelratings").append(' <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star"></span>\n' +
                '                            <span class="fa fa-star"></span>')
        } else if (washcentertotalrate == 4) {
            $("#innermodelratings").append(' <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star"></span>')
        } else if (washcentertotalrate == 5) {
            $("#innermodelratings").append(' <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>\n' +
                '                            <span class="fa fa-star checked"></span>')
        }

        $("#innermodelcontact").append(contact);

        getAllReviews();
        getAllPackages();


    }


    function filtercenters() {

        var name = $("#searchbyname").val();
        var city = $("#searchbycity").val();
        var date = $("#searchbydate").val();
        var fromtime = $("#searchbyfromtime").val();
        var totime = $("#searchbytotime").val();
        var available = false;

        if ($('#searchall').is(':checked')) {
            available = false;
        }
        if ($('#searchavailable').is(':checked')) {
            alert("available")
            available = true;
        }


        console.log(name);
        console.log(city);
        console.log(date);
        console.log(fromtime);
        console.log(totime);


        $.ajax({
            url: '/washCenters/filter?name=' + name + '&city=' + city + '&date=' + date + '&fromtime=' + fromtime + '&totime=' + totime + '&available=' + available,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                console.log(result)
                var count = 0;
                $("#washcenterMainDiv").empty();
                for (let i = 0; i < result.length; i++) {
                    var obj = result[i];
                    washcenterid = obj.id

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

                    $("#washcenterMainDiv").append("<div class=\"col-md-4 col-sm-12  \">\n" +
                        "                <div >\n" +
                        "                    <div class=\"card\" style=\"width: 18rem; \">\n" +
                        "<div class=\"p-1 mt-3\" style=\"background-color: rgba(0,51,69,0.7);position: absolute;width: 200px;right: 0\">" +
                        "<h5 style=\"color: white; text-align: center; font-weight: bold\">" + obj.name + "</h5>" +
                        "</div>\n" +
                        "                        <img src=\"/resources/dist/img/car.jpg\" alt=\"...\">\n" +
                        "                        <div data-washcenterid=\"" + obj.id + "\" data-washcentername=\"" + obj.name + "\" data-washcentercity=\"" + obj.city + "\" data-washcentertotalrate=\"" + obj.totalRate + "\"  data-washcentercenterphn=\"" + obj.phone + "\" data-washcenterownerphn=\"" + obj.user.phone + "\" data-washcenterownerid=\"" + obj.user.id + "\" class=\"card-body\" onclick='setData(this)' data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n" +

                        // "                            <h5 style=\"font-weight: bold;display: block\" class=\"card-title\">"+obj.name+"</h5>\n" +
                        "                            <h6 class=\"card-text\">" + obj.city + "</h6>\n" +

                        "                         <div >" + rateHtml + "</div>" +
                        "                            <h6 style=\"text-align: center;cursor: pointer\" class=\"card-text\">See more </h6>\n" +
                        "\n" +
                        "                        </div>\n" +
                        "                        <a href=\"#\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#test1\" onclick=\"booknow(event)\" data-washcenterid=\"" + obj.id + "\">Book now</a>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>");


                    coutn = count + 1;
                }
            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

    }

</script>

<style type="text/css">
    #searchbyfromtime:before {
    content:'From:';
    color: #89939b;
    font-weight: bolder;
    font-size: 19px;
    font-family: sans-serif;
    }
    #searchbytotime:before {
    content:'To:';
    color: #89939b;
    font-weight: bolder;
    font-size: 19px;
    font-family: sans-serif;
    }
</style>