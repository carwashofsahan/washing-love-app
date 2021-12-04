<%@include file="/WEB-INF/jspf/header.jspf" %>
<body>
<section>
    <div style="display: block;" class="modal emailpg" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">E-mail</h5>

                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="fromEmail" class="col-form-label">From:</label>
                            <input  type="text" class="form-control" disabled id="fromEmail">
                        </div>
                        <div class="form-group">
                            <label for="toEmail" class="col-form-label">To:</label>
                            <input  type="text" class="form-control" disabled id="toEmail">
                        </div>
                        <div class="form-group">
                            <label for="message" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="message"></textarea>
                        </div>
                    </form>
                </div>
                <span id="msg"></span>
                <div class="modal-footer">

                    <button onclick="sendEmail()" type="button" class="btn btn-primary">Send E-mail</button>
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
    $(function () {
        $.ajax({
            url: '/users/'+user,
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $('#fromEmail').val(result.data.email)

            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

        $.ajax({
            url: '/users/sender',
            method: 'get',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (result) {
                $('#toEmail').val(result.data)

            },
            error: function (err) {
                console.log('err')
                console.log(err);
            }
        });

    });

    function sendEmail() {
        $('#msg').empty()
        $.ajax({
            url: '/emails',
            method: 'post',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            data: JSON.stringify({
                id: '1234',
                sender: $('#fromEmail').val(),
                date:new Date(),
                emailBody:$('#message').val()

            }),
            success: function (result) {
                $('#message').val('');
                if(result.code==200){

                    $('#msg').append('<label style="color: #00A7AA">Email send success</label>');
                }else {
                    $('#msg').append('<label style="color: red">' + result.message + '</label>');
                }


            },
            error: function (err) {
                $('#msg').append('<label style="color: red">' + result.message + '</label>');
            }
        });
    }
</script>