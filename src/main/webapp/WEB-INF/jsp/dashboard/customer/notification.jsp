<%@include file="/WEB-INF/jspf/header.jspf" %>
<body style="background-image: url('/resources/dist/img/back.jpg');background-size: cover">
<section>
    <div class="container">


        <div class="row">
            <div style="background-color: rgba(0, 51, 69,0.8);margin-top: 100px" class="col-md-12">
                <div style="color: white" class="request-cta">
                    <h6 style="float:right;padding: 20px;cursor: pointer" onclick="DeleteTodayNotification()">Delete
                        All</h6>
                    <h4 style="padding: 20px">Today's Notifications</h4>
                    <div id="todayNotifications"></div>

                </div>

            </div>
            <div style="" class="modal fade" id="test1" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header" id="modalHead">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="modalBody">

                        </div>
                        <div class="modal-footer">
                            <button id="seenNotification" onclick="SeenNotification(event)"
                                    type="button" class="btn btn-secondary" data-dismiss="modal">Ok
                            </button>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</section>
<section>
    <div class="container">
        <div class="row">
            <div style="background-color: rgba(0, 51, 69,0.8);margin-top: 100px" class="col-md-12">
                <div style="color: white" class="request-cta">
                    <h6 style="float:right;padding: 20px;cursor: pointer" onclick="DeleteOlderNotification()">Delete
                        All</h6>
                    <h4 style="padding: 20px">Older Notifications</h4>
                    <div id="olderNotifications"></div>

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
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    $(function () {

        $.ajax({
            url: '/notifications/receiver/' + user,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $("#todayNotifications").empty();
                $("#olderNotifications").empty();
                for (const obj of result.data) {
                    if (obj.date == today) {
                        if (obj.state == "UNSEEN") {
                            $("#todayNotifications").append('<div data-notificationid=\'' + obj.id + '\' data-notification=\'' + obj.notification + '\' onclick="viewNotification(this)" data-toggle="modal" data-target="#test1"\n' +
                                '                         style="opacity: 0.9;background-color: white;border: unset"\n' +
                                '                         class="alert alert-warning alert-dismissible fade show" role="alert">\n' +
                                '                         ' + obj.notification + '\n' +
                                '                        <button onclick="DeleteNotification(event)" data-notificationid="' + obj.id + '" type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>\n' +
                                '                    </div>')
                        } else if (obj.state == "SEEN") {
                            $("#todayNotifications").append('<div data-notificationid=\'' + obj.id + '\' data-notification=\'' + obj.notification + '\' onclick="viewNotification(this)" data-toggle="modal" data-target="#test1"\n' +
                                '                         style="opacity: 0.7;background-color: white;border: unset"\n' +
                                '                         class="alert alert-warning alert-dismissible fade show" role="alert">\n' +
                                '                         ' + obj.notification + '\n' +
                                '                        <button onclick="DeleteNotification(event)" data-notificationid="' + obj.id + '" type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>\n' +
                                '                    </div>')
                        }

                    } else {
                        if (obj.state == "UNSEEN") {
                            $("#olderNotifications").append('<div data-notificationid=\'' + obj.id + '\' data-notification=\'' + obj.notification + '\' onclick="viewNotification(this)" data-toggle="modal" data-target="#test1"\n' +
                                '                         style="opacity: 0.9;background-color: white;border: unset"\n' +
                                '                         class="alert alert-warning alert-dismissible fade show" role="alert">\n' +
                                '                         ' + obj.notification + '\n' +
                                '                        <button onclick="DeleteNotification(event)" data-notificationid="' + obj.id + '" type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>\n' +
                                '                    </div>')
                        } else if (obj.state == "SEEN") {
                            $("#olderNotifications").append('<div data-notificationid=\'' + obj.id + '\' data-notification=\'' + obj.notification + '\' onclick="viewNotification(this)" data-toggle="modal" data-target="#test1"\n' +
                                '                         style="opacity: 0.7;background-color: white;border: unset"\n' +
                                '                         class="alert alert-warning alert-dismissible fade show" role="alert">\n' +
                                '                         ' + obj.notification + '\n' +
                                '                        <button onclick="DeleteNotification(event)" data-notificationid="' + obj.id + '" type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>\n' +
                                '                    </div>')
                        }
                    }


                }
            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });


    });

    function SeenNotification(event) {
        var notificationid = event.path[0].getAttribute('data-notificationid');
        $.ajax({
            url: '/notifications/change?id=' + notificationid + '&state=SEEN',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                location.reload();
            }
        });
    }

    function viewNotification(i) {
        var notificationid = i.getAttribute('data-notificationid');
        var notification = i.getAttribute('data-notification');
        $('#seenNotification').attr('data-notificationid', notificationid);
        $("#modalBody").append('<h4>' + notification + '</h4>');


    }

    function DeleteNotification(event) {
        var notificationid = event.path[0].getAttribute('data-notificationid');
        $.ajax({
            url: '/notifications/' +notificationid,
            method: 'delete',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                location.reload();

            }
        });
    }

    function DeleteTodayNotification() {

        $.ajax({
            url: '/notifications/today?userid=' +user,
            method: 'delete',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                location.reload();

            }
        });
    }

    function DeleteOlderNotification() {
        $.ajax({
            url: '/notifications/older?userid=' +user,
            method: 'delete',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.reload();
            },
            error: function (err) {
                location.reload();

            }
        });
    }
</script>
