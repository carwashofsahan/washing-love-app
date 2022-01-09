<%@include file="/WEB-INF/jspf/header.jspf" %>

<body style="background-image: url('/resources/dist/img/back.jpg'); background-size: cover; height: auto; ">
<%--navbar--%>

<%--navbar end--%>

<section>
    <div class="container-fluid">

        <div style="margin-top:100px;background-color: white" class="container p-4" id="addwashcenterMainDiv">

            <h4 style="display: inline-block; margin-bottom: 30px;">My packages</h4>
            <a style="margin-left: 10px" href="#" class="btn btn-secondary" data-toggle="modal" data-target="#add_center">Add
                Packages</a>
            <div class="row" id="mypackages">



            </div>
        </div>


        <div class="modal fade mod" id="add_center" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div style="background-color: rgba(0, 51, 69,0.8);color: white"
                         class="modal-header">
                        <h4>Add Packages</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span style="color: white" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="form">
                            <div class="form-group">
                                <span class="form-label required">Vehicle Type</span>
                                <select class="form-control" id="vehicleOptions" name="vehicleOptions">

                                </select>
                                <span class="select-arrow"></span>
                            </div>

                            <div class="form-group">
                                <span class="form-label required">Price</span>
                                <input class="form-control" type="text" oninput="this.value=this.value.replace(/[^0-9]/g,'');"
                                       placeholder="Price" id="packagePrice" name="packagePrice">
                            </div>
                            <div class="form-group">
                                <span class="form-label required">Description</span>
                                <textarea class="form-control" rows="3" id="description" name="description"></textarea>
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel
                        </button>
                        <button type="submit" form="form" id="submitBtn" class="btn btn-success">
                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true" style="display: none"></span>
                            Add Package
                        </button>
                        <%--                                        ---------------------------------------------------------------------------------------------%>
                    </div>
                </div>
            </div>
        </div>

        <%--                        -------------------------------%>

        <%--                        ---------------------------------------------------------------------%>
        <div class="modal fade mod" id="edit_washcenter" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div style="background-color: rgba(0, 51, 69,0.8);color: white"
                         class="modal-header">
                        <h4>Edit Package</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span style="color: white" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <span class="form-label">Vehicle Type</span>
                                <input disabled class="form-control" type="text"
                                       placeholder="Full Name Here">
                            </div>
                            <div class="form-group">
                                <span class="form-label">Price</span>
                                <input class="form-control" type="text"
                                       placeholder="Price">
                            </div>


                            <div class="form-group">
                                <span class="form-label">Description</span>
                                <textarea class="form-control" id="" rows="3"></textarea>
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel
                        </button>
                        <button style="color: white" type="button" class="btn btn-warning" data-dismiss="modal">Edit
                        </button>
                        <%--                                        ---------------------------------------------------------------------------------------------%>
                    </div>
                </div>
            </div>
        </div>
        <%--                        ---------------------------------------------------------------------%>

        <%--                        -------------------------------%>
        <div class="modal fade mod" id="delete_package" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">


                    <div class="modal-body">

                        <h4 class="text-center">Do you want to delete <br>
                            <span class="font-weight-bold">Package Id<span id="deletePackageId"></span></span></h4>

                        <div class="col-12 text-center">
                        <button style="color: white; background-color: #da4453" type="button"
                                id="confirmDeletePackage"
                                onclick="ConfirmDeletePack(event)"
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

</section>
</body>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

<script>
    var token = '${token}';
    var user = '${user}';
    var notificationCount = 0;

    $(function () {
        $('.detailer-mypackage').addClass("active");

        getVehicleTypes();
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

        $('#form').validate({
            rules: {
                vehicleOptions: {
                    required: true
                },
                packagePrice: {
                    required: true
                },
                description: {
                    required: true
                }
            },

            submitHandler: function (form,event) {
                event.preventDefault();

                var vehicleTypeId = $('#vehicleOptions option:selected').val();


                $(".spinner-border").show();
                $('#submitBtn').prop('disabled', true)


                $.ajax({
                    url: '/packages',
                    method: 'post',
                    contentType: "application/json",
                    headers: {
                        "Authorization": "Bearer " + token
                    },
                    data: JSON.stringify({
                        id:"12345",
                        user: {
                            id: user
                        },
                        description: $("#description").val(),
                        type : {
                            id: vehicleTypeId
                        },
                        price: $('#packagePrice').val(),
                        state: 'PENDING'
                    }),
                    success: function (result) {

                    },
                    error: function (err) {

                    }
                });



            }
        });


        $.ajax({
            url: '/packages/user/'+user,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                console.log(result)
                $("#mypackages").empty();

                for (const obj of result.data) {

                    $("#mypackages").append('<div class="col-md-4 col-sm-12  ">\n' +
                        '                    <div>\n' +
                        '                        <div class="card" style="width: 18rem; ">\n' +
                        '                                <button data-toggle="modal" data-target="#edit_washcenter" type="button" class="btn-edit"><i\n' +
                        '                                        class="far fa-edit"></i></button>\n' +
                        '                                <button onclick="deletePackage(event)" data-userid="' + obj.id + '" data-toggle="modal" data-target="#delete_package" type="button"\n' +
                        '                                        class="btn-delete"><i class="far fa-trash-alt"></i></button>\n' +
                        '\n' +
                        '                                <div class="card-body" data-toggle="modal" data-target="#seemore">\n' +
                        '\n' +
                        '                                    <h5 style="font-weight: bold;display: block" class="mtcard-title">Vehicle Type : <span>'+obj.type.type+'</span>\n' +
                        '                                    </h5>\n' +
                        '                                    <h6 class="mb-0 card-text">'+obj.description+'</h6>\n' +
                        '                                    <h6 style="font-weight: bold;display: block" class="mtcard-title">Price : <span>'+obj.price+'/=</span>\n' +
                        '                                    </h6>\n' +
                        '                                    <h6 class="card-text">Status : <span style="color: #2E8B57">'+obj.state+'</span></h6>\n' +
                        '                                </div>\n' +
                        '                        </div>\n' +
                        '\n' +
                        '                    </div>\n' +
                        '                </div>');
                }
            },
            error: function (err) {
                console.log(err)

            }
        });



    });



    function getVehicleTypes() {
        $.ajax({
            url: '/vehicletypes',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                console.log(result)
                $("#vehicleOptions").empty();
                console.log(result);
                for (const obj of result.data) {
                    $("#vehicleOptions").append('<option value="'+obj.id+'">'+obj.type+'</option>');
                }
            },
            error: function (err) {
                console.log(err)

            }
        });

    }

    function deletePackage(event) {
        var userId = event.path[1].getAttribute('data-userid')
        console.log(userId)
        $('#deletePackageId').text(userId);
        $('#confirmDeletePackage').attr('data-userid', userId);
    }

    function ConfirmDeletePack(event) {
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
                alert("error occured while deleting")
                location.reload();
            }
        });
    }


</script>
<style type="text/css">
    .error {
            color: red !important;
            display: block;
        }
    .required:after {
        content:" *";
        color: red;
    }
</style>
