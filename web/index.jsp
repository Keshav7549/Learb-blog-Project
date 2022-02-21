<%-- 
    Document   : index
    Created on : 05-Feb-2022, 4:13:29 pm
    Author     : Keshav
--%>

<%@page import="com.learn.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyles.css" rel="stylesheet" type="text/css"/>
        
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 86%, 64% 69%, 30% 85%, 0% 70%, 0 0);
            }
        </style>
    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>

        <!--//banner-->
        <div class="container-fluid m-0 p-0">

            <div class="jumbotron primary-background text-white">

                <div class="container">

                    <h3 class="display-3">Welcome to Learn Blog</h3>
                    <p>The world of learning is here <span class="fa fa-book"></span><br>
                        Thousands of different programming languages have been created, and more are being created every year. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.
                    </p>
                    <p>
                        Many programming languages are written in an imperative form (i.e., as a sequence of operations to perform) while other languages use the declarative form (i.e. the desired result is specified, not how to achieve it). To discover learning about new technologies get started with us.
                    </p>

                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Get Started</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>

                </div>
            </div>

        </div>

        <!--cards-->
        <div class="container">
            
            <!--first row for 3 cards-->
            <div class="row mb-2">

                    <!-- card 1 -->
                <div class="col-md-4">
                    <div class="card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more...</a>
                        </div>
                    </div>
                </div>
                
                <!--card 2-->
                <div class="col-md-4">
                    <div class="card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more...</a>
                        </div>
                    </div>
                </div>
                
                <!-- card 3 -->
                <div class="col-md-4">
                    <div class="card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">C/C++</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more...</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!--second row for other 3 cards-->
            <div class="row">

                    <!-- card 1 -->
                <div class="col-md-4">
                    <div class="card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Kotlin</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more...</a>
                        </div>
                    </div>
                </div>
                
                <!--card 2-->
                <div class="col-md-4">
                    <div class="card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Linux</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more...</a>
                        </div>
                    </div>
                </div>
                
                <!-- card 3 -->
                <div class="col-md-4">
                    <div class="card">
                        <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Android</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--scripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="js/myscript.js" type="text/javascript"></script>


    </body>
</html>
