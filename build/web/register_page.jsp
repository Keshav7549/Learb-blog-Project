<%-- 
    Document   : register_page
    Created on : 07-Feb-2022, 3:46:11 pm
    Author     : Keshav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyles.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        
        <%@include file="normal_navbar.jsp" %>
        
        <main class="primary-background"  style="padding-bottom: 40px; padding-top: 10px;">

            <div class="container">
                <div class="col-md-6 offset-md-3">

                    <div class="card">

                        <!--card form header-->
                        <div class="card-header text-center">
                            <span class="fa fa-user-plus fa-3x"></span><br>
                            Registration
                        </div>

                        <!--card form body--> 
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                
                                <div class="form-group">
                                    <label for="user_name">Username</label>
                                    <input name="uname" required="true" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="uemail" required="true" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="upass" required="true" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <div class="form-group">
                                    <label for="gender">Gender</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio"  id="gender" name="ugender" placeholder="gndr" value="Male"> Male &nbsp;
                                    <input type="radio"  id="gender" name="ugender" placeholder="gndr" value="Female"> Female
                                </div>
                                
                                 <div class="form-group">
                                     <textarea name="uinterests" class="form-control" id="" rows="3" placeholder="Enter text here"></textarea>
                                </div>
                                
                                <div class="form-check">
                                    <input name="ucheck" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree all terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none;" >
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please wait...</h4>
                                </div>
                                
                                <div class="container text-center" >
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </div>
                                
                                                                
                            </form>
                        </div>

                        <!--card form footer-->
                        <div class="card-header">

                        </div>
                    </div>

                </div>
            </div>
        </main>

        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myscript.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            
            //when document is ready just print whatever is there inside function
            $(document).ready(function(){
                console.log("loaded....")
                
                //form on submit call the below function body event
                $("#reg-form").on("submit",function(event){
                    
                    // event called to prevent calling the servlet page
                        event.preventDefault();
                        
                        //to hide submit button before submit and show loader
                        $("#submit-btn").hide();
                        $("#loader").show();
                        
                        //create form javascript object to get all the form details using form id
                        let form = new FormData(this);
                        
                        //send form to the register servlet using ajax call
                        $.ajax({
                            url: "RegisterServlet",
                            type: "POST",
                            data: form,
                            success: function (data, textStatus, jqXHR)
                            {
                                console.log(data);
                                
                                //to hide loader after submit and show button
                                 $("#submit-btn").show();
                                 $("#loader").hide();
                                 
                                 if(data.trim() === 'Done')
                                 {
                                 
                                 swal("Successfully Registered. Click ok to login.")
                                         .then((value) => {
                                            window.location = "login_page.jsp"
                                           });
                                 }
                                 else{
                                     swal(data);
                                 }
                            },
                            error: function (jqXHR, textStatus, errorThrown)
                            {
                                console.log(jqXHR)
                                
                                //to hide loader after submit and show button
                                 $("#submit-btn").show();
                                 $("#loader").hide();
                                 
                                 swal("Somethign went wrong. Try signing up again.");
                                 
                            },
                            processData: false,
                            contentType: false
                        });
                });
            });
            
        </script>
        
    </body>
</html>
