<%@include file="/WEB-INF/jspf/header.jspf" %>

<body style="background-image: url('/resources/dist/img/back.jpg'); background-size: cover; height: auto; ">
<%--navbar--%>

<%--navbar end--%>

<section>
    <div class="container-fluid">

        <div style="margin-top:100px;background-color: white" class="container p-4" id="addwashcenterMainDiv">

            <h4 style="display: inline-block; margin-bottom: 30px;">My Centers</h4>
            <a style="margin-left: 10px" href="#" class="btn btn-secondary" data-toggle="modal"
               data-target="#add_center">Add Center</a>
            <div class="row" id="myWashCenters">

            </div>
        </div>


        <%--        --------------------------------------------------------------------------End of My center------------------------------------%>

        <div style="background-color: white" class="container p-4 mt-3">

            <h4 style="display: inline-block; margin-bottom: 30px;">Other Centers</h4>

            <div class="row ">
                <div class="col-sm-12">
                    <div class="input-group">
                        <div class="ml-2 form-group">
                            <input class="form-control" type="text" placeholder="Name" id="searchbyname">
                        </div>
                        <div class="ml-2 form-group">
                            <input class="form-control" type="text" placeholder="City" id="searchbycity">
                        </div>
                        <div class="ml-2 input-group-btn">
                            <button id="searchBtn" type="button" class="btn btn-secondary btn-search"><span
                                    class="glyphicon glyphicon-search">&nbsp;</span> <span
                                    class="label-icon" onclick="filterCenters()">Search</span></button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row" id="allWashCenters">

            </div>
        </div>


        <%--                        -------------------------------%>

        <%--                        ---------------------------------------------------------------------%>

        <%----------------------------------Add new Wash center Model----------------------------------------%>
        <div class="modal fade mod" id="add_center" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div style="background-color: rgba(0, 51, 69,0.8);color: white"
                         class="modal-header">
                        <h4>Add My Center</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span style="color: white" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="form">
                            <div class="form-group">
                                <span class="form-label">Name</span>
                                <input class="form-control" type="text"
                                       placeholder="Full Name Here" id="mycentername" name="mycentername">
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">City</span>
                                        <input class="form-control" type="text"
                                               placeholder="Enter City" id="mycentercity" name="mycentercity">


                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Contact Number</span>
                                        <input class="form-control" type="text"
                                               placeholder="Enter Contact Number" id="mycentercontact"
                                               name="mycentercontact">
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Total Slots</span>
                                        <input class="form-control" type="number" min="1"
                                               placeholder="Enter Total Slots" id="totalslot" name="totalslot">
                                    </div>
                                </div>

                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <table class="table table-bordered">
                                                <tbody id="loadAllPackages">


                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel
                        </button>
                        <button type="submit" form="form" id="submitBtn" class="btn btn-success">
                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"
                                  style="display: none"></span>
                            Add Wash Center
                        </button>
                        <%--                                        ---------------------------------------------------------------------------------------------%>
                    </div>
                </div>
            </div>
        </div>

        <%--                        -------------------------------%>
        <div class="modal fade" id="seemore" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document" id="othermodels">

            </div>
        </div>
        <%--                        ---------------------------------------------------------------------%>

        <%--                        -------------------------------%>
        <div class="modal fade mod" id="edit_washcenter" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div style="background-color: rgba(0, 51, 69,0.8);color: white"
                         class="modal-header">
                        <h4 class="text-center">Edit Wash Center<br>
                            <span class="font-weight-bold">WashCenter Name: <span id="editWashCenterName"></span></span></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span style="color: white" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <span class="form-label">Name</span>
                                <input disabled class="form-control" type="text"
                                       placeholder="Full Name Here" id="editCenterName">
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">City</span>
                                        <input class="form-control" type="text"
                                               placeholder="Enter City" id="editCenterCity">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Contact Number</span>
                                        <input class="form-control" type="text"
                                               placeholder="Enter Contact Number" id="editCenterContact">
                                    </div>
                                </div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <table class="table table-bordered">
                                                <tbody id="packagesToEdit">

                                                <tr>
                                                    <td>
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox"
                                                                   class="custom-control-input"
                                                                   checked>
                                                            <label class="custom-control-label"
                                                            ></label>
                                                        </div>
                                                    </td>
                                                    <td>Vehicle type</td>
                                                    <td>1000</td>
                                                    <td>Description</td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel
                        </button>
                        <button style="color: white" type="button"
                                id="confirmEditWashCenter"
                                onclick="editWashCenter(event)"
                                class="btn btn-warning" data-dismiss="modal">Edit
                        </button>
                        <%--                                        ---------------------------------------------------------------------------------------------%>
                    </div>
                </div>
            </div>
        </div>
        <%--                        ---------------------------------------------------------------------%>

        <%--                        -------------------------------%>
        <div class="modal fade mod" id="delete_washcenter" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">


                    <div class="modal-body">

                        <h4 class="text-center">Do you want to delete <br>
                            <span class="font-weight-bold"><span id="deleteWashCenterName"></span></span>
                        </h4>

                        <div class="col-12 text-center">
                            <button style="color: white; background-color: #da4453" type="button"
                                    id="confirmDeleteWashCenter"
                                    onclick="ConfirmDeleteCenter(event)"
                                    class=" btn btn-warning"
                                    data-dismiss="modal">Delete
                            </button>
                            <button type="button" class=" btn btn-secondary" data-dismiss="modal">Cancel
                            </button>

                        </div>


                    </div>
                </div>
            </div>
        </div>
        <%--                        ---------------------------------------------------------------------%>

        <button style="position: fixed;bottom: 0px;right: 0px" type="button" class="btn btn-primary msgbtn"
                data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
            <i class="far fa-envelope"></i>
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">From:</label>
                                <input type="text" class="form-control" id="">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">To:</label>
                                <input type="text" class="form-control" id="recipient-name">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Message:</label>
                                <textarea class="form-control" id="message-text"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Send message</button>
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
    var centerPackages;

    $(function () {
        $('.detailer-washcenter').addClass("active");

        //-------------------------------------------------My Wash Centers-------------------------------------
        $.ajax({
            url: '/washCenters/user/' + user,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
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
                    if(obj.state=="UNAVAILABLE"){
                        $('#myWashCenters').append('<div class="col-md-4 col-sm-12  ">\n' +
                            '                    <div>\n' +
                            '                        <div class="card" style="width: 18rem; ">\n' +
                            '                            <button onclick="editCenter(event)" data-name="' + obj.name + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#edit_washcenter" type="button" class="btn-edit"><i\n' +
                            '                                    class="far fa-edit"></i></button>\n' +
                            '                            <button onclick="deleteCenter(event)" data-name="' + obj.name + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#delete_washcenter" type="button"\n' +
                            '                                    class="btn-delete"><i class="far fa-trash-alt"></i></button>\n' +
                            '\n' +
                            '                            <img src="/resources/dist/img/car.jpg" alt="...">\n' +
                            '                            <div class="card-body" onclick="seemore(event)" data-cid="' + obj.id + '" data-id="' + obj.user.id + '" data-city="' + obj.city + '" data-name="' + obj.name + '"  data-phone="' + obj.phone + '" data-state="' + obj.state + '" data-trate="' + obj.totalRate + '" data-toggle="modal" data-target="#seemore">\n' +
                            '\n' +
                            '                                <h5 style="font-weight: bold;display: block" class="card-title">' + obj.name + '</h5>\n' +
                            '                                <h6 class="card-text">' + obj.city + '</h6>\n' +
                            '                                <h6 class="card-text">' + obj.state + '</h6>\n' +

                            '\n' +
                            '                                <div>\n' +
                            '                                    ' + rateHtml + '\n' +
                            '                                </div>\n' +
                            '                                <h6 style="text-align:center; margin-top:10px;cursor: pointer" class="card-text">See\n' +
                            '                                    more </h6>\n' +
                            '\n' +
                            '                            </div>\n' +
                            '                                <button onclick="changeAvailabilty(event)" data-washcenterid="' + obj.id + '" style="color: white"  class="btn">Mark As Available</button>\n' +
                            '\n' +
                            '\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                </div>');

                    }else if(obj.state=="ACTIVE"){
                        $('#myWashCenters').append('<div class="col-md-4 col-sm-12  ">\n' +
                            '                    <div>\n' +
                            '                        <div class="card" style="width: 18rem; ">\n' +
                            '                            <button onclick="editCenter(event)" data-userid="' + obj.id + '" data-toggle="modal" data-target="#edit_washcenter" type="button" class="btn-edit"><i\n' +
                            '                                    class="far fa-edit"></i></button>\n' +
                            '                            <button onclick="deleteCenter(event)" data-name="' + obj.name + '"data-userid="' + obj.id + '" data-toggle="modal" data-target="#delete_washcenter" type="button"\n' +
                            '                                    class="btn-delete"><i class="far fa-trash-alt"></i></button>\n' +
                            '\n' +
                            '                            <img src="/resources/dist/img/car.jpg" alt="...">\n' +
                            '                            <div class="card-body" onclick="seemore(event)" data-cid="' + obj.id + '" data-id="' + obj.user.id + '" data-city="' + obj.city + '" data-name="' + obj.name + '"  data-phone="' + obj.phone + '" data-state="' + obj.state + '" data-trate="' + obj.totalRate + '" data-toggle="modal" data-target="#seemore">\n' +
                            '\n' +
                            '                                <h5 style="font-weight: bold;display: block" class="card-title">' + obj.name + '</h5>\n' +
                            '                                <h6 class="card-text">' + obj.city + '</h6>\n' +
                            '                                <h6 class="card-text">' + obj.state + '</h6>\n' +
                            '\n' +
                            '                                <div>\n' +
                            '                                    ' + rateHtml + '\n' +
                            '                                </div>\n' +
                            '                                <h6 style="text-align:center; margin-top:10px;cursor: pointer" class="card-text">See\n' +
                            '                                    more </h6>\n' +
                            '\n' +
                            '                            </div>\n' +
                            '                                <button onclick="changeAvailabilty(event)" data-washcenterid="' + obj.id + '" style="color: white"  class="btn">Mark As Unavailable</button>\n' +
                            '\n' +
                            '\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                </div>');

                    }else {
                        $('#myWashCenters').append('<div class="col-md-4 col-sm-12  ">\n' +
                            '                    <div>\n' +
                            '                        <div class="card" style="width: 18rem; ">\n' +
                            '                            <button onclick="editCenter(event)" data-name="' + obj.name + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#edit_washcenter" type="button" class="btn-edit"><i\n' +
                            '                                    class="far fa-edit"></i></button>\n' +
                            '                            <button onclick="deleteCenter(event)" data-name="' + obj.name + '" data-userid="' + obj.id + '" data-toggle="modal" data-target="#delete_washcenter" type="button"\n' +
                            '                                    class="btn-delete"><i class="far fa-trash-alt"></i></button>\n' +
                            '\n' +
                            '                            <img src="/resources/dist/img/car.jpg" alt="...">\n' +
                            '                            <div class="card-body" onclick="seemore(event)" data-cid="' + obj.id + '" data-id="' + obj.user.id + '" data-city="' + obj.city + '" data-name="' + obj.name + '"  data-phone="' + obj.phone + '" data-state="' + obj.state + '" data-trate="' + obj.totalRate + '" data-toggle="modal" data-target="#seemore">\n' +
                            '\n' +
                            '                                <h5 style="font-weight: bold;display: block" class="card-title">' + obj.name + '</h5>\n' +
                            '                                <h6 class="card-text">' + obj.city + '</h6>\n' +
                            '                                <h6 class="card-text">' + obj.state + '</h6>\n' +
                            '\n' +
                            '                                <div>\n' +
                            '                                    ' + rateHtml + '\n' +
                            '                                </div>\n' +
                            '                                <h6 style="text-align:center; margin-top:10px;cursor: pointer" class="card-text">See\n' +
                            '                                    more </h6>\n' +
                            '\n' +
                            '                            </div>\n' +
                            '\n' +
                            '\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                </div>');

                    }



                }
            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

        //-------------------------------------------------All Wash Centers-------------------------------------
        $.ajax({
            url: '/washCenters/washCenterDetails',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    if (obj.user.id != user) {
                        console.log(obj);
                        centerPackages = obj.packages;
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

                        $('#allWashCenters').append('<div class="col-md-4 col-sm-12  ">\n' +
                            '                    <div>\n' +
                            '                        <div class="card" style="width: 18rem; ">\n' +
                            '                            <div class="p-1 mt-3"\n' +
                            '                                 style="background-color: rgba(0,51,69,0.7);position: absolute;width: 200px;right: 0">\n' +
                            '                                <h5 style="color: white; text-align: center; font-weight: bold">' + obj.name + '</h5>\n' +
                            '                            </div>\n' +
                            '                            <img src="/resources/dist/img/car.jpg" alt="...">\n' +
                            '                            <div onclick="seemore(event)" data-cid="' + obj.id + '" data-id="' + obj.user.id + '" data-city="' + obj.city + '" data-name="' + obj.name + '"  data-phone="' + obj.phone + '" data-state="' + obj.state + '" data-trate="' + obj.totalRate + '" class="card-body" data-toggle="modal" data-target="#seemore" >\n' +
                            '\n' +
                            '                                <div>\n' +
                            '                                    ' + rateHtml + '\n' +
                            '                                </div>\n' +
                            '                                <h5 style="font-weight: bold;display: block" class="card-title">' + obj.city + '</h5>\n' +
                            '                                <h6 class="card-text mb-0">' + obj.phone + '</h6>\n' +
                            '                                <h6 class="card-text mb-2">Total Slot : ' + obj.totalSlot + '</h6>\n' +
                            '\n' +
                            '                                <h6  style="text-align:center; margin-top:10px;cursor: pointer" class="card-text">See\n' +
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
                console.log('err')
                console.log(err);
            }
        });

        //--------------------------------------------------Notification----------------------------------------

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

        //----------------------------------------All PAckages-----------------------------------------------
        $.ajax({
            url: '/packages/userandstate/' + user + '/ACCEPTED',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $("#loadAllPackages").empty();

                for (const obj of result.data) {
                    $("#loadAllPackages").append('<tr>\n' +
                        '                                                                        <td>\n' +
                        '                                                                            <div>\n' +
                        '                                                                                <input type="checkbox"\n' +
                        '                                                                                       class="custom"\n' +
                        '                                                                                        name="package" value=' + obj.id + ' >\n' +
                        '                                                                                <label \n' +
                        '                                                                                      ></label>\n' +
                        '                                                                            </div>\n' +
                        '                                                                        </td>\n' +
                        '                                                                        <td>' + obj.type.type + '</td>\n' +
                        '                                                                        <td>' + obj.price + '/=</td>\n' +
                        '                                                                        <td>' + obj.description + '</td>\n' +
                        '                                                                    </tr>');
                }
            },
            error: function (err) {
                console.log(err)

            }
        });


        $('#form').validate({
            rules: {
                mycentername: {
                    required: true
                },
                mycentercity: {
                    required: true
                },
                mycentercontact: {
                    required: true
                },
                totalslot: {
                    required: true
                }
            },

            submitHandler: function (form, event) {
                event.preventDefault();

                var vehicleTypeId = $('#vehicleOptions option:selected').val();

                var packages = [];

                var k = $('input[name="package"]:checked');
                for (const obj of k) {
                    console.log(obj.value);
                    var package = {id: obj.value};
                    packages.push(package);
                }


                $(".spinner-border").show();
                $('#submitBtn').prop('disabled', true)


                $.ajax({
                    url: '/washCenters',
                    method: 'post',
                    contentType: "application/json",
                    headers: {
                        "Authorization": "Bearer " + token
                    },
                    data: JSON.stringify({
                        id: "12345",
                        name: $("#mycentername").val(),
                        phone: $("#mycentercontact").val(),
                        user: {
                            id: user
                        },
                        city: $("#mycentercity").val(),
                        packages: packages,
                        totalRate: 0,
                        totalSlot: $("#totalslot").val(),
                        reviewRatings: [],
                        state: 'PENDING'
                    }),
                    success: function (result) {
                        location.assign("/dashboards/detailer?user=${user}&token=${token}&userType=${userType}");
                    },
                    error: function (err) {
                        location.assign("/dashboards/detailer?user=${user}&token=${token}&userType=${userType}");
                    }
                });


            }
        });


    });


    function deleteCenter(event) {
        var userId = event.path[1].getAttribute('data-userid');
        var name = event.path[1].getAttribute('data-name');
<%--        $('#deleteWashCenterId').text(userId);--%>
        $('#deleteWashCenterName').text(name);
        $('#confirmDeleteWashCenter').attr('data-userid', userId);
    }

    function ConfirmDeleteCenter(event) {
        var washcenterid = event.path[0].getAttribute('data-userid')
        $.ajax({
            url: '/washCenters/change_state?id=' + washcenterid + '&state=DELETED',
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                location.assign("/dashboards/detailer?user=${user}&token=${token}&userType=${userType}");
            },
            error: function (err) {
                alert("error occured while deleting")
                location.reload();
            }
        });
    }

    function editCenter(event) {
        var userId = event.path[1].getAttribute('data-userid');
        var name = event.path[1].getAttribute('data-name');
        $('#editWashCenterId').text(userId);
        $('#editWashCenterName').text(name);
        $('#confirmEditWashCenter').attr('data-userid', userId);


        $.ajax({
            url: '/washCenters/washcenterid/' + userId,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                console.log(result);
                $("#editCenterName").val(result.data.name);
                $("#editCenterCity").val(result.data.city);
                $("#editCenterContact").val(result.data.phone);

                $("#packagesToEdit").empty();
                for (const obj of result.data.packages) {
                    $("#packagesToEdit").append('<tr>\n' +
                        '                                                    <td>\n' +
                        '                                                        <div >\n' +
                        '                                                            <input type="checkbox"\n' +
                        '                                                                   name="checkbox" \n' +
                        '                                                                   value="' + obj.id + '">\n' +
                        '                                                            <label class="custom-control-label"\n' +
                        '                                                                   ></label>\n' +
                        '                                                        </div>\n' +
                        '                                                    </td>\n' +
                        '                                                    <td>' + obj.type.type + '</td>\n' +
                        '                                                    <td>' + obj.price + '</td>\n' +
                        '                                                    <td>' + obj.description + '</td>\n' +
                        '                                                </tr>');
                }

            },
            error: function (err) {
                alert("error occured while editing")
                console.log(err);
            }
        });

    }

    function editWashCenter() {
        var washcenterid = event.path[0].getAttribute('data-userid')

        //     selectedpackages.push($('input[name="checkbox"]:checked')[1].getAttribute('id'));

        packagestoedit = [];

        var selectedpackages = $('input[name="checkbox"]:checked');
        for (const obj of selectedpackages) {
            console.log(obj.value);
            var package = {id: obj.value};
            packagestoedit.push(package);
        }


        // $('input[name="checkbox"]:checked').each(function() {
        //    selectedpackages.push($(this).val());
        // });

        // var k = $('input[name="package"]:checked');
        // for (const obj of k) {
        //     console.log(obj.value);
        //     var package = {id: obj.value};
        //     packages.push(package);
        // }


        $.ajax({
            url: '/washCenters/' + washcenterid,
            method: 'put',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            data: JSON.stringify({
                id: "12345",
                name: $("#editCenterName").val(),
                phone: $("#editCenterContact").val(),
                user: {
                    id: user
                },
                city: $("#editCenterCity").val(),
                packages: packagestoedit,
                totalRate: '1',
                totalSlot: '1',
                reviewRatings: [],
                state: '1'
            }),
            success: function (result) {
                console.log(result)
            },
            error: function (err) {
                console.log(err)
            }
        });
    }

    function filterCenters() {
        var name = $("#searchbyname").val();
        var city = $("#searchbycity").val();
        $('#allWashCenters').empty();
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
                        $('#allWashCenters').append('<div class="col-md-4 col-sm-12  ">\n' +
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

    function seemore(event) {
        var cid = event.path[1].getAttribute('data-id')
        var centerid = event.path[1].getAttribute('data-cid')
        var city = event.path[1].getAttribute('data-city')
        var name = event.path[1].getAttribute('data-name')
        var trate = event.path[1].getAttribute('data-trate')

        var phone = event.path[1].getAttribute('data-phone')
        var state = event.path[1].getAttribute('data-state')

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
            '                                            <div class="tab-pane fade" id="custom-tabs-two-homee"\n' +
            '                                                 role="tabpanel"\n' +
            '                                                 aria-labelledby="custom-tabs-two-home-tab">\n' +

            '                                            </div>\n' +
            '                                            <div class="tab-pane fade active show"\n' +
            '                                                 id="custom-tabs-two-profile" role="tabpanel"\n' +
            '                                                 aria-labelledby="custom-tabs-two-profile-tab">\n' +
            '                                                <div class="row" id="ratings">\n' +
            '                                                    <div style="margin-bottom: 20px" class="col-md-2">\n' +
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
            '                                                        <p>Good...!</p>\n' +
            '                                                    </div>\n' +
            '                                                    <div style="margin-bottom: 20px" style="margin-bottom: 20px"\n' +
            '                                                         class="col-md-2">\n' +
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
            '                                                        <p>Good...!</p>\n' +
            '                                                    </div>\n' +
            '                                                    <div style="margin-bottom: 20px" class="col-md-2">\n' +
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
            '                                                        <p>Good...!</p>\n' +
            '                                                    </div>\n' +
            '                                                    <div style="margin-bottom: 20px" class="col-md-2">\n' +
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
            '                                                        <p>Good...!</p>\n' +
            '                                                    </div>\n' +
            '                                                    <div class="col-md-2">\n' +
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
            '                                                        <p>Good...!</p>\n' +
            '                                                    </div>\n' +
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
        console.log(centerid);
        $("#ratings").empty();

        $.ajax({
            url: '/review_ratings/wash_center/' + centerid,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {



                for (let i = 0; i < result.data.length; i++) {
                    console.log("i = " + i)
                    var ob = result.data[i];
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

    function changeAvailabilty(event) {
        var washcenterid = event.path[0].getAttribute('data-washcenterid');
        $.ajax({
            url: '/washCenters/available/'+user+'/'+washcenterid,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                if(result.code==200){
                    location.reload();
                }else {
                    Swal.fire({
                        title: 'Error',
                        html: '<h3 style="font-weight:bold;">' + result.message + '</h3>',
                        icon: 'error',
                        showCancelButton: false,
                        confirmButtonColor: 'rgba(0, 51, 69,0.8)',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Ok',
                        cancelButtonText: 'No'
                    })
                }

            },
            error: function (err) {
                Swal.fire({
                    title: 'Error',
                    html: '<h3 style="font-weight:bold;">Error</h3>',
                    icon: 'error',
                    showCancelButton: false,
                    confirmButtonColor: 'rgba(0, 51, 69,0.8)',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ok',
                    cancelButtonText: 'No'
                })
            }
        });
    }

</script>
