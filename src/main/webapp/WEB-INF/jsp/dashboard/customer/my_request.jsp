<%@include file="/WEB-INF/jspf/header.jspf" %>
<body id="" style="background-image: url('/resources/dist/img/back.jpg');background-size: cover">
<%--navbar--%>

<%--navbar end--%>
<section>
    <div class="section">
        <div style="margin-top: 100px;">
            <div class="card container" style="padding: 50px;">
                <div class="container">
                    <h4>On Going Requests</h4>
                </div>
                <div id="pendingRequests">


                </div>
            </div>

            <div class="card container" style="padding: 50px;">
                <div class="container">
                    <h3>Completed Requests</h3>
                </div>
                <div id="completeRequests">

                </div>
            </div>
            <div class="card container" style="padding: 50px;">
                <div class="container">
                    <h3>History</h3>
                    <h6>Generate Report</h6>
                </div>
                <div class="container">
                    <table id="table" class="table table-bordered table-hover dataTable dtr-inline">

                        <thead>
                        <tr>
                            <th scope="col">Vehicle number</th>
                            <th scope="col"> Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Vehicle type</th>
                            <th scope="col">Wash Center/City</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Package Description</th>
                        </tr>
                        </thead>
                        <tbody>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


</section>

<div style="z-index: 0.1" class="modal fade" id="test1" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div style="background-color: rgba(0, 51, 69,0.8);" class="modal-header">
                <div>
                    <h5 style="color: white" class="modal-title" id="exampleModalLongTitle">Review Your Booking</h5>

                </div>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>


            <div class="modal-body">
                <div class="rate">
                    <input type="radio" id="star5" name="rate" value="5"/>
                    <label for="star5" title="text">5 stars</label>
                    <input type="radio" id="star4" name="rate" value="4"/>
                    <label for="star4" title="text">4 stars</label>
                    <input type="radio" id="star3" name="rate" value="3"/>
                    <label for="star3" title="text">3 stars</label>
                    <input type="radio" id="star2" name="rate" value="2"/>
                    <label for="star2" title="text">2 stars</label>
                    <input type="radio" id="star1" name="rate" value="1"/>
                    <label for="star1" title="text">1 star</label>
                    <input checked type="radio" id="star0" name="rate" value="0"/>
                    <label hidden for="star0" title="text">1 star</label>
                </div>
                <br>
                <div style="margin-top: 30px;" class="form-group">
                    <div><span style="color: grey" class="form-label">Review </span></div>

                    <textarea id="reviewTxt" class="form-control" type="textarea"
                              placeholder="Enter Special Note"></textarea>
                </div>


            </div>
            <div class="modal-footer">
                <button id="reviewLateBtn" onclick="ReviewLate(event)" type="button"
                        class="btn btn-secondary" data-dismiss="modal">Review Later
                </button>
                <button id="confirmReviewBtn" onclick="ConfirmReview(event)"
                        type="button" class="btn btn-secondary" data-dismiss="modal">Submit
                </button>

            </div>
        </div>
    </div>
</div>

</body>

<%@include file="/WEB-INF/jspf/footer.jspf" %>
<script>
    $(function () {
        $('.customer-myrequest').addClass("active");
    });
</script>

<script>
    var user = '${user}';
    var token = '${token}';
    var notificationCount = 0;
    $(function () {
        //-----------------------------------------------Notification-------------------------------------------
        // $.ajax({
        //     url: '/notifications',
        //     method: 'get',
        //     contentType: "application/json",
        //     headers: {
        //         "Authorization": "Bearer " + token
        //     },
        //     success: function (result) {
        //         for (const obj of result.data) {
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
        //------------------------------------------Ongoing Booking------------------------------------------------

        $.ajax({
            url: '/bookings/ongoing/' + user,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $("#pendingRequests").empty();
                for (const obj of result.data) {
                    $("#pendingRequests").append('<div style="background-color: rgba(0, 51, 69,0.8); margin-top: 10px;" class="container">\n' +
                        '                        <div style="padding: 10px;background-color:#e9eaf1fc;border: 1px solid #dee2e6!important;"\n' +
                        '                             class="row shadow">\n' +
                        '\n' +
                        '                            <div class="col-md-12 col-md-push-5">\n' +
                        '                                <div class="request-cta">\n' +
                        '\n' +
                        '                                    <h4>Booking Id : ' + obj.id + '</h4>\n' +
                        '                                    <ul style="list-style: none;">\n' +
                        '                                        <li ><span style="font-weight: 600;display: inline-block;width: 180px"> Date </span>  <span >' + obj.date + '</span></li>\n' +
                        '                                        <li><span style="font-weight: 600;display: inline-block;width: 180px"> Time </span>  <span >' + obj.fromtime + '</span></li>\n' +
                        '                                        <li><span style="font-weight: 600;display: inline-block;width: 180px"> City </span>  <span >' + obj.washCenter.city + '</span></li>\n' +
                        '                                        <li><span style="font-weight: 600;display: inline-block;width: 180px"> Vehicle number </span>  <span >' + obj.vehicleNo + '</span></li>\n' +
                        '                                        <li><span style="font-weight: 600;display: inline-block;width: 180px"> Booking status </span>  <span >' + obj.status + '</span></li>\n' +
                        '                                        <li><span style="font-weight: 600;display: inline-block;width: 180px"> Special Note </span>  <span >' + obj.specialNote + '</span></li>\n' +
                        '                                    </ul>\n' +
                        '\n' +
                        '                                </div>\n' +
                        '                            </div>\n' +
                        '                        </div>\n' +
                        '                    </div>');
                }


            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

        //----------------------------------------- Complete Booking -----------------------------------------------
        $.ajax({
            url: '/bookings/complete/COMPLETED/' + user,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (const obj of result.data) {
                    if (!obj.isReview) {

                        $('#completeRequests').append(' <div style="background-color: white; margin-top: 10px;background-color: #e9eaf1fc;border: 1px solid #dee2e6!important;"\n' +
                            '                         class="container shadow">\n' +
                            '                        <div class="col-md-12 col-md-push-5">\n' +
                            '                            <div class="request-cta">\n' +
                            '                                <a onclick="addReview(event)" data-washcenterid="' + obj.washCenter.id + '"  data-bookingid="' + obj.id + '" style="float: right" href="#" class="animated-button1" data-toggle="modal"\n' +
                            '                                   data-target="#test1">\n' +
                            '                                    <span></span>\n' +
                            '                                    <span></span>\n' +
                            '                                    <span></span>\n' +
                            '                                    <span></span>\n' +
                            '                                    Review Now\n' +
                            '                                </a>\n' +
                            '                                <h4>Booking Id : ' + obj.id + '</h4>\n' +
                            '                                <ul style="list-style: none;">\n' +
                            '                                    <li><span style="font-weight: 600;display: inline-block;width: 180px"> Date </span>\n' +
                            '                                        <span>' + obj.date + '</span></li>\n' +
                            '                                    <li><span style="font-weight: 600;display: inline-block;width: 180px"> Time </span>\n' +
                            '                                        <span>' + obj.fromtime + '</span></li>\n' +
                            '                                    <li><span style="font-weight: 600;display: inline-block;width: 180px"> City </span>\n' +
                            '                                        <span>' + obj.washCenter.city + '</span></li>\n' +
                            '                                    <li><span style="font-weight: 600;display: inline-block;width: 180px"> Vehicle number </span>\n' +
                            '                                        <span>' + obj.vehicleNo + '</span></li>\n' +
                            '                                    <li><span style="font-weight: 600;display: inline-block;width: 180px"> Booking status </span>\n' +
                            '                                        <span>' + obj.status + '</span></li>\n' +
                            '                                    <li><span\n' +
                            '                                            style="font-weight: 600;display: inline-block;width: 180px"> Special Note </span>\n' +
                            '                                        <span>' + obj.specialNote + '</span></li>\n' +
                            '                                </ul>\n' +
                            '\n' +
                            '                            </div>\n' +
                            '                        </div>\n' +
                            '\n' +
                            '                    </div>');
                    }
                }

            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });
        //    ----------------------------------------------History Table-----------------------------------------
        var table = $("#table").DataTable({
            "dom": 'Bfrtip',
            "lengthChange": false,
            "autoWidth": false,
            "searching": true,
            "buttons": ["colvis", "pdf"],
            "pageLength": 10,
            "order": [[1, 'asc']],
            "ajax": "/bookings/COMPLETED/" + user
        });


    });

    function addReview(event) {
        var bookingid = event.path[0].getAttribute('data-bookingid');
        var washcenterid = event.path[0].getAttribute('data-washcenterid');
        $('#confirmReviewBtn').attr('data-bookingid', bookingid);
        $('#reviewLateBtn').attr('data-bookingid', bookingid);
        $('#confirmReviewBtn').attr('data-washcenterid', washcenterid);
    }

    function ConfirmReview(event) {
        var bookingid = event.path[0].getAttribute('data-bookingid');
        var washcenterid = event.path[0].getAttribute('data-washcenterid');
        var reviewTxt = $('#reviewTxt').val();
        var rateSize = $('input[name="rate"]:checked')[0].getAttribute('value');

        $.ajax({
            url: '/review_ratings',
            method: 'post',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            data: JSON.stringify({
                id: "12345",
                customer: {
                    id: user
                },
                washCenter: {
                    id: washcenterid
                },
                review: reviewTxt,
                rating: rateSize

            }),
            success: function (result) {
                if (result.code == 200) {
                    $.ajax({
                        url: '/bookings/isReview?bookingid=' + bookingid + '&isReview=true',
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
            },
            error: function (err) {
                location.reload();
            }
        });

    }

    function ReviewLate(event) {
        var bookingid = event.path[0].getAttribute('data-bookingid');
        $.ajax({
            url: '/bookings/isReview?bookingid=' + bookingid + '&isReview=true',
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
</script>
