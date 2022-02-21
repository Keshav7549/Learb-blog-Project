<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something went wrong...</title>
        
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
        <div class="container text-center" style="margin-top: 100px;">
            <img src="img/error.png" class="img-fluid" alt="error"/>
            
            <br><h3 class="display-3">Oops! something went wrong...</h3>
            <h5>Error occured for <%= exception %></h5>
            <br><a href="index.jsp" class="btn-primary btn-lg text-white">Home</a>
        </div>
    </body>
</html>
