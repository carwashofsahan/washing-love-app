<%@include file="/WEB-INF/jspf/header.jspf" %>
<body id="" class="" style="background-image: url('/resources/dist/img/back.jpg');background-size: cover">
<%--navbar--%>

<%--navbar end--%>
<section>
    <div class="row">
        <div class="col-md-12 ">
            <div class="booking-cta">
                <h1>Make your reservation</h1>
            </div>
        </div>
    </div>
    <div class="container titlediv ">
        <div class="container">

            <div class="container">
                <div class="row searchFilter ">
                    <div class="col-sm-12 searchFilter1">
                        <div class="input-group">
                            <div class="form-group mr-2">
                                <input class="form-control" type="text" placeholder="Enter Name" id="searchbyname">
                            </div>
                            <div class="form-group mr-2">
                                <input class="form-control" type="text" placeholder="Enter city" id="searchbycity">
                            </div>
                            <div class="input-group-btn mr-2">

                                <div class="form-group">

                                    <%--                                    <input class="form-control" type="date" required id="searchbydate">--%>
                                    <input id="searchbydate" type="text" name="date" placeholder="Pick a Date"
                                           class="form-control  datepicker" autocomplete="off">
                                </div>

                            </div>
                            <div class="input-group-btn mr-2">

                                <div class="form-group">
                                    <input class="form-control" type="time" placeholder="From" required id="searchbyfromtime">
                                </div>

                            </div>

                            <div class="input-group-btn mr-2">
                                <div class="form-group">
                                    <input class="form-control" type="time" placeholder="To" required
                                           id="searchbytotime">
                                </div>
                            </div>

                            <div class="input-group-btn">
                                <button id="searchBtn" type="button" class="btn btn-secondary btn-search"><span
                                        class="glyphicon glyphicon-search">&nbsp;</span> <span
                                        class="label-icon" onclick="filtercentersbookwash()">Search</span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class=" container row  p-4 titlediv " id="washcenterMainDiv">

        </div>

        <%--        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>

        <div class="modal fade mod" id="test1" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header ">
                        <h4>Book Now</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span class="clsbtn" style="" aria-hidden="true">&times;</span>
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
                        <button id="bookModelBtn" type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#test2" onclick="openBookConfirm(event)">Book
                        </button>

                        <%--                                        ---------------------------------------------------------------------------------------------%>
                        <div class="modal fade" id="test2" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4>Booking Confirmation</h4>
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close">
                                            <span class="clsbtn" aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">


                                        <table class="bookin_table" id="bookingtable">

                                        </table>

                                        </ul>


                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-primary" data-bs-target="#test2"
                                                data-bs-toggle="modal" data-bs-dismiss="modal">Cancel
                                        </button>
                                        <button type="button" id="btnConfirm" class="btn btn-primary" onclick="book(event)">Confirm</button>
                                    </div>
                                </div>
                            </div>
                        </div>
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

                        <div class="pl-4" id="innermodelratings">

                        </div>
                        <h6 class="pl-4">Contact: <span id="innermodelcontact"></span></h6>


                        <div class="pl-4">
                            <div id="tab">
                                <div class="col-12 col-sm-12 col-lg-12">
                                    <div class="card card-primary card-outline card-tabs">
                                        <div class="card-header p-0 pt-1 border-bottom-0">
                                            <ul class="nav nav-tabs" id="custom-tabs-two-tab"
                                                role="tablist">
                                                <li class="nav-item" >
                                                    <a class="nav-link" id="custom-tabs-two-home-tab"
                                                       data-toggle="pill" href="#custom-tabs-two-home"
                                                       role="tab" aria-controls="custom-tabs-two-home"
                                                       aria-selected="false">Packagess</a>
                                                </li>
                                                <li class="nav-item" >
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
                                                    <div id="appendPackages">

                                                    </div>

                                                </div>


                                                <div class="tab-pane fade active show"
                                                     id="custom-tabs-two-profile" role="tabpanel"
                                                     aria-labelledby="custom-tabs-two-profile-tab">
                                                    <div class="row" id="reviewandrating">

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
    var user = '${user}';
    var token = '${token}';
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


    $(function () {
        $('.customer-bookawash').addClass("active");

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
        //         console.log('err')
        //         console.log( err);
        //     }
        // });

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


                        "                            <h6 class=\"card-text\">" + obj.city + "</h6>\n" +

                        "                         <div >" + rateHtml + "</div>" +
                        "                            <h6 style=\"text-align:center;cursor: pointer\" class=\"card-text\">See more </h6>\n" +
                        "\n" +
                        "                        </div>\n" +
                        "                        <a href=\"#\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#test1\" onclick=\"booknow(event)\"  data-washcenterid=\"" + obj.id + "\">Book now</a>\n" +
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

        selectedpackage = $('input[name="flexRadioDefault"]:checked')[0].getAttribute('data-vehicletype');

        packageid = $('input[name="flexRadioDefault"]:checked')[0].getAttribute('data-packageid');

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
        var washcenter = event.path[0].getAttribute('data-washcenterid')
        washcenterid = washcenter;
        getAllPackages(washcenter);
        $('#bookModelBtn').attr('data-washcenterid', washcenter);


    }

    function getVehicleTypes() {
        $.ajax({
            url: '/bookings/vehicleType',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $("#vehicleTypeOptions").empty();
                for (const obj of result.data) {
                    $("#vehicleTypeOptions").append('<option value="' + obj.id + '">' + obj.type + '</option>');
                }
            },
            error: function (err) {

            }
        });

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
                $("#appendPackages").empty();
                $("#selectpackages").empty();
                for (const obj of result.data.packages) {
                    $("#appendPackages").append('<h3></h3>\n' +
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
        console.log("=========================="+washcenterid)
        getAllPackages(washcenterid);


    }

    function filtercentersbookwash() {
        var name = $("#searchbyname").val();
        var city = $("#searchbycity").val();
        var date = $("#searchbydate").val();
        var fromtime = $("#searchbyfromtime").val();
        var totime = $("#searchbytotime").val();

        $.ajax({
            url: '/washCenters/filter?name=' + name + '&city=' + city + '&date=' + date + '&fromtime=' + fromtime + '&totime=' + totime + '&available=' + true,
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
