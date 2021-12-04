<%@include file="/WEB-INF/jspf/header.jspf" %>

<body style="background-image: url('/resources/dist/img/back.jpg'); background-size: cover; height: auto; ">
<%--navbar--%>

<%--navbar end--%>

<section>
    <div class="container-fluid">
        <div style="margin-top:100px;background-color: white" class="container p-4">

            <h4 class="mb-4">Pending Requests</h4>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="card-body">
                        <div class="dataTables_wrapper dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12 col-md-6"></div>
                                <div class="col-sm-12 col-md-6"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="pendingTable"
                                           class="table table-bordered table-hover dataTable dtr-inline"
                                           role="grid" aria-describedby="example2_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting sorting_asc" tabindex="0" aria-controls="example2"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Rendering engine: activate to sort column descending">
                                                Wash Center
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="Browser: activate to sort column ascending">
                                                Customer
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                                Vehicle No
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1"
                                                aria-label="Engine version: activate to sort column ascending">
                                                package
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Date
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Time
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Approve or Reject
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%--                                        <tr class="odd">--%>
                                        <%--                                            <td class="dtr-control sorting_1" tabindex="0">Galle Branch</td>--%>
                                        <%--                                            <td>Ashen Kumar</td>--%>
                                        <%--                                            <td>BFB 2378</td>--%>
                                        <%--                                            <td>Small Vehicle</td>--%>
                                        <%--                                            <td>2021-10-28</td>--%>
                                        <%--                                            <td>18:58</td>--%>
                                        <%--                                            <td>--%>
                                        <%--                                                <i data-toggle="modal" data-target="#reject" style="color: #da4453; cursor: pointer" class="fas fa-times"></i>--%>
                                        <%--                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                        <%--                                                <i  data-toggle="modal" data-target="#approve" style="color: #2E8B57;cursor: pointer" class="fas fa-check"></i>--%>
                                        <%--                                            </td>--%>
                                        <%--                                        </tr>--%>
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="background-color: white" class="mt-3 container p-4">
            <h4 class="mb-4">Ongoin Bookings</h4>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="card-body">
                        <div class="dataTables_wrapper dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12 col-md-6"></div>
                                <div class="col-sm-12 col-md-6"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="ongoingTable" class="table table-bordered table-hover dataTable dtr-inline"
                                           role="grid" aria-describedby="example2_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting sorting_asc" tabindex="0" aria-controls="example2"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Rendering engine: activate to sort column descending">
                                                Wash Center
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="Browser: activate to sort column ascending">
                                                Customer
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                                Vehicle No
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1"
                                                aria-label="Engine version: activate to sort column ascending">
                                                package
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Date
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Time
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Mark As Complete
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>

                                        </tfoot>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="background-color: white" class="mt-3 container p-4">
            <h4 class="mb-4">Upcoming Bookings</h4>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="card-body">
                        <div class="dataTables_wrapper dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12 col-md-6"></div>
                                <div class="col-sm-12 col-md-6"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="upcomingTable" class="table table-bordered table-hover dataTable dtr-inline"
                                           role="grid" aria-describedby="example2_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting sorting_asc" tabindex="0" aria-controls="example2"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Rendering engine: activate to sort column descending">
                                                Wash Center
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="Browser: activate to sort column ascending">
                                                Customer
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                                Vehicle No
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1"
                                                aria-label="Engine version: activate to sort column ascending">
                                                package
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Date
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Time
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                        <tfoot>

                                        </tfoot>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="background-color: white" class="mt-3 container p-4">
            <h4 class="mb-4">History</h4>
            <div class="col-sm-12">

            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="card-body">
                        <div class="dataTables_wrapper dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12 col-md-6"></div>
                                <div class="col-sm-12 col-md-6"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="historyTable"
                                           class="table table-bordered table-hover dataTable dtr-inline"
                                           role="grid" aria-describedby="example2_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting sorting_asc" tabindex="0" aria-controls="example2"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Rendering engine: activate to sort column descending">
                                                Wash Center
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="Browser: activate to sort column ascending">
                                                Customer
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                                Vehicle No
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1"
                                                aria-label="Engine version: activate to sort column ascending">
                                                package
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Date
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                                colspan="1" aria-label="CSS grade: activate to sort column ascending">
                                                Time
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade mod" id="reject" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Reject <br>
                            <span class="font-weight-bold">Booking ID <span id="rejectBookingId"></span></span></h4>

                        <div   class="col-12 text-center">
                            <button onclick="confirmReject(event)" id="confirmRejectBookingBtn" style="color: white; background-color: #da4453" type="button"
                                    class=" btn btn-success"
                                    data-dismiss="modal">Reject
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade mod" id="approve" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Approve <br>
                            <span class="font-weight-bold">Booking ID <span id="approveBookingId"></span></span></h4>

                        <div class="col-12 text-center">
                            <button onclick="confirmApprov(event)" id="confirmApprovBookingBtn" style="color: white;" type="button"
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


        <div class="modal fade mod" id="complete" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="text-center">Do you want to Complete <br>
                            <span class="font-weight-bold">Booking ID <span id="completeBookingId"></span></span></h4>

                        <div class="col-12 text-center">
                            <button onclick="confirmcomplete(event)" id="confirmcompleteBookingBtn" style="color: white;" type="button"
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

    </div>
</section>
</body>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

<script>
    var token = '${token}';
    var user = '${user}';
    var notificationCount = 0;

    $(function () {
        $('.detailer-booking').addClass("active");
        //---------------------------------------------Notification-------------------------------------
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
        //    ---------------------------------------------Pending Bookings Table---------------------------------------------
        var Pendingtable = $("#pendingTable").DataTable({
            "dom": 'Bfrtip',
            "lengthChange": false,
            "autoWidth": false,
            "searching": true,
            "buttons": ["colvis", "pdf", "csv"],
            "pageLength": 10,
            "order": [[1, 'asc']],
            "ajax": "/bookings/pending_dt/"+user
        });

        //    ---------------------------------------------History Table------------------------------------------------------
        var Historytable = $("#historyTable").DataTable({
            "dom": 'Bfrtip',
            "lengthChange": false,
            "autoWidth": false,
            "searching": true,
            "buttons": ["colvis", "pdf", "csv"],
            "pageLength": 10,
            "order": [[1, 'asc']],
            "ajax": "/bookings/history_dt/"+user
        });

        //-------------------------------------------------Ongoing Booking Table----------------------------------------

        var Ongoingtable = $("#ongoingTable").DataTable({
            "dom": 'Bfrtip',
            "lengthChange": false,
            "autoWidth": false,
            "searching": true,
            "buttons": ["colvis", "pdf", "csv"],
            "pageLength": 10,
            "order": [[1, 'asc']],
            "ajax": "/bookings/ongoing_dt/"+user
        });

        //-------------------------------------------------Upcoming Booking Table---------------------------------------
        var Upcomingtable = $("#upcomingTable").DataTable({
            "dom": 'Bfrtip',
            "lengthChange": false,
            "autoWidth": false,
            "searching": true,
            "buttons": ["colvis", "pdf", "csv"],
            "pageLength": 10,
            "order": [[1, 'asc']],
            "ajax": "/bookings/upcomming_dt/"+user
        });
    });



    function rejectBooking(id) {
        $('#rejectBookingId').text(id);
        $('#confirmRejectBookingBtn').attr('data-userid', id);


    };
    function approveBooking(id) {
        $('#approveBookingId').text(id);
        $('#confirmApprovBookingBtn').attr('data-userid', id);

    };

    function confirmApprov(event) {
        var bookingId = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/bookings/state?bookingid=' + bookingId + '&state=PROCESSING',
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

    };

    function confirmReject(event) {
        var bookingId = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/bookings/state?bookingid=' + bookingId + '&state=REJECTED',
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

    };

    function completeBooking(id) {
        $('#completeBookingId').text(id);
        $('#confirmcompleteBookingBtn').attr('data-userid', id);

    };

    function confirmcomplete(event) {
        var bookingId = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/bookings/state?bookingid=' + bookingId + '&state=COMPLETED',
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

    };

</script>
