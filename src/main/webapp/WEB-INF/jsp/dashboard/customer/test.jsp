<div style="margin-top: 100px" class="container bootstrap snippet">
    <div class="row">


    </div>
    <div class="row">
        <div ><!--left col-->


            <div class="text-center">
                <img src="/resources/dist/img/1.jpg" class="avatar img-circle img-thumbnail"
                     alt="avatar">
                <h6>Upload a different photo...</h6>
                <input type="file" class="text-center center-block file-upload">
            </div>
            </hr><br>


        </div><!--/col-3-->
        <div >
            <form class="form">
                <h2>User Profile</h2>
                <div class="form-group">
                    <label for="email">Email address:</label>
                    <div class="relative">
                        <input class="form-control" type="email" required="" placeholder="kavindumadushan094@gmail.com"
                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" disabled>
                        <i class="fa fa-envelope"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">First Name:</label>
                    <div class="relative">
                        <input class="form-control" id="name" type="text" pattern="[a-zA-Z\s]+" required="" autofocus=""
                               title="Username should only contain letters. e.g. Kavindu" autocomplete=""
                               placeholder="Type your first name here...">
                        <i class="fa fa-user"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">Last Name:</label>
                    <div class="relative">
                        <input class="form-control" id="name" type="text" pattern="[a-zA-Z\s]+" required="" autofocus=""
                               title="Username should only contain letters. e.g. Madushan" autocomplete=""
                               placeholder="Type your last name here...">
                        <i class="fa fa-user"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Contact Number:</label>
                    <div class="relative">
                        <input class="form-control" type="text" maxlength="10"
                               oninput="this.value=this.value.replace(/[^0-9]/g,'');" required=""
                               placeholder="Type your Mobile Number...">
                        <i class="fa fa-phone"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">Address:</label>
                    <div class="relative">
                        <input class="form-control" type="url" pattern="https?://.+" required=""
                               placeholder="Type your Address...">
                        <i class="fa fa-building"></i>
                    </div>
                </div>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#test3">Change Password</button>
                <div style="" class="modal fade" id="test3" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 style="color: black">Change Password</h4>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label >Old Password:</label>
                                    <div class="relative">
                                        <input class="form-control" type="password" pattern="https?://.+" required=""
                                               placeholder="Type your Old Password...">
                                        <i class="fa fa-building"></i>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label >New Password:</label>
                                    <div class="relative">
                                        <input class="form-control" type="password" pattern="https?://.+" required=""
                                               placeholder="Type your New Password...">
                                        <i class="fa fa-building"></i>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label >Confirm Password:</label>
                                    <div class="relative">
                                        <input class="form-control" type="password" pattern="https?://.+" required=""
                                               placeholder="Re-enter your New Password...">
                                        <i class="fa fa-building"></i>
                                    </div>
                                </div>
                                <div style="float: right">
                                    <button type="button" class="btn btn-primary" >Cancel</button>
                                    <button type="button" class="btn btn-primary" >Save</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>



                <%--                <div class="form-group">--%>
                <%--                    <label for="email">Attachment:</label>--%>
                <%--                    <div class="relative">--%>
                <%--                        <div class="input-group">--%>
                <%--                            <label class="input-group-btn">--%>
                <%--            <span class="btn btn-default">--%>
                <%--                Browse&hellip; <input type="file" style="display: none;" multiple>--%>
                <%--            </span>--%>
                <%--                            </label>--%>
                <%--                            <input type="text" class="form-control" required="" placeholder="Attachment..." readonly>--%>
                <%--                            <i class="fa fa-link"></i>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>

                <div class="tright">
                    <a href="">
                        <button class="movebtn movebtnre" type="Reset"><i class="fa fa-fw fa-refresh"></i> Reset
                        </button>
                    </a>
                    <a href="">
                        <button class="movebtn movebtnsu" type="Submit">Submit <i class="fa fa-fw fa-paper-plane"></i>
                        </button>
                    </a>
                </div>
            </form>


            <div class="thanks" style="display: none;">
                <h4>Thank you!</h4>
                <p><small>Your message has been successfully sent.</small></p>
            </div>



        </div><!--/tab-content-->

    </div><!--/col-9-->
</div>