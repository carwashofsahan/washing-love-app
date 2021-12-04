<%@include file="/WEB-INF/jspf/header.jspf" %>

<body style="background-image: url('/resources/dist/img/back.jpg'); background-size: cover; height: auto; ">
<%--navbar--%>

<%--navbar end--%>

<section>
    <div class="container-fluid" style="margin-top: 100px;">
        <div style="background-color: white" class="mt-3 container p-4">
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
                                    <table id="table" class="table table-bordered table-hover dataTable dtr-inline"
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
                                                colspan="1"
                                                aria-label="Engine version: activate to sort column ascending">
                                                Note
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
                                                Status
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


    </div>
</section>
</body>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

<script>
    var token = '${token}';
    var user = '${user}';
    var notificationCount = 0;
    //------------------------------------------Notification-----------------------------------------------
    $(function () {
        $('.admin-report').addClass("active");

        // $.ajax({
        //     url: '/notifications',
        //     method: 'get',
        //     contentType: "application/json",
        //     headers: {
        //         "Authorization": "Bearer " + token
        //     },
        //     success: function (result) {
        //         for (var obj of result.data) {
        //             console.log(obj.receiver.id)
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
    //    ------------------------------------------------Report table----------------------------------------------------
        var table = $("#table").DataTable({
            "dom": 'Bfrtip',
            "lengthChange": false,
            "autoWidth": false,
            "searching": true,
            "buttons": ["colvis","pdf","csv"],
            "pageLength": 10,
            "order": [[1, 'asc']],
            "ajax": "/bookings/bookings_dt"
        });
    });

    function viewNote(note) {
        Swal.fire({
            title: 'Note',
            html: '<h3 style="font-weight:bold;">'+note+'</h3>',
            icon: 'info',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ok',
            cancelButtonText: 'No'
        })

    }
</script>
