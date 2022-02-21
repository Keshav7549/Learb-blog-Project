<%-- 
    Document   : login_page
    Created on : 06-Feb-2022, 5:40:37 am
    Author     : Keshav
--%>

<%@page import="com.learn.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyles.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <!--login form-->
        <main class="d-flex align-items-center primary-background" style="height:80vh;"> 
            <div class="container">
                <div class="row">
                    <div class="col-md-5 offest-md4">
                        <div class="card">

                            <!-- login page form header-->
                            <div class="card-header primary-background text-white text-center ">
                                <br>
                                <span class="fa fa-user-circle fa-3x"></span>
                                <p>Login Here</p>
                            </div>

                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>   
                            
                            <!--bootstrap alert used for div tag-->
                            <div class="alert <%= m.getCssClass() %> text-center" role="alert">
                                <%= m.getContent() %>   <!-- This is jsp's implicit method to get all the content/entities of class object ie; Message  -->
                            </div>

                            <%
                                    session.removeAttribute("msg");
                                }
                            %>



                            <!--login card body-->
                            <div class="card-body">
                                <form action="LoginServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="umail" required="true" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="upass" required="true" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <!--                                    <div class="form-check">
                                                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                                            <label class="form-check-label" for="exampleCheck1">Save user details</label>
                                                                        </div>-->

                                    <div class="container text-center">
                                        <br><button type="submit" class="btn btn-primary">Submit</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <!--scripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="js/myscript.js" type="text/javascript"></script>
    </body>
</html>
