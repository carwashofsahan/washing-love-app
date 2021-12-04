<%@include file="/WEB-INF/jspf/header.jspf" %>
<body>
<section>
    <div class="container">
        <div class="row">
            <div style="background-color: rgba(0, 51, 69,0.8);margin-top: 100px" class="col-md-12">
                <div style="color: white" class="request-cta">
                    <h4 style="padding: 20px">E-mails</h4>
                    <div id="emailList">

                    </div>

                </div>

            </div>
            <div style="" class="modal fade" id="test2" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>E-mail</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>

                                <div class="form-group">
                                    <label for="emailTo" class="col-form-label">To:</label>
                                    <input  type="text" class="form-control" disabled id="emailTo">
                                </div>
                                <div class="form-group">
                                    <label for="message" class="col-form-label">Message:</label>
                                    <textarea class="form-control" id="message"></textarea>
                                </div>
                            </form>
                            <div class="modal-footer">

                                <button onclick="confirmSendReply(event)" id="sendReply" type="button" class="btn btn-primary">
                                    <span class="spinner-border spinner-border-sm" role="status"
                                          aria-hidden="true" style="display: none"></span>
                                    Send E-mail</button>
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
    $(function () {
        $.ajax({
            url: '/emails',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                for (var obj of result.data) {
                    $('#emailList').append('<div onclick="sendReply(event)" data-to="' + obj.sender + '" data-emailid="' + obj.id + '" data-toggle="modal" data-target="#test2"\n' +
                        '                             style="opacity: 0.5;background-color: white;border: unset"\n' +
                        '                             class="alert alert-warning alert-dismissible fade show" role="alert">\n' +
                        '                            <strong>'+obj.sender+' : </strong> '+obj.emailBody+'\n' +
                        '                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>\n' +
                        '                        </div>');
                }
            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

    });

    function sendReply(event) {
        var to = event.path[0].getAttribute('data-to')
        var emailid = event.path[0].getAttribute('data-emailid')
        $('#emailTo').val(to);
        $('#sendReply').attr('data-to', to);
        $('#sendReply').attr('data-emailid', emailid);
    }

    function confirmSendReply(event) {
        var to = event.path[0].getAttribute('data-to')
        var emailid = event.path[0].getAttribute('data-emailid')
        $(".spinner-border").show();
        $("#sendReply").prop('disabled', true);

        $.ajax({
            url: '/emails/reply/'+to+'/'+$('#message').val()+'/'+emailid,
            method: 'post',
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