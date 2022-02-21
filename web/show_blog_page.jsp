<%@page import="java.util.*"%>
<%@page import="com.learn.blog.entities.Category"%>
<%@page import="com.learn.blog.entities.Post"%>
<%@page import="com.learn.blog.helper.ConnectionProvider"%>
<%@page import="com.learn.blog.dao.PostDao"%>
<%@page import="com.learn.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    //get session created in loginservlet page for the user type session variable which is currentuser
    User user = (User) session.getAttribute("currentUser");

    //if user object has no session variable then it's a new user so redirect it to login_page.jsp using response object and sendRedirectMethod()
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<%    int postId = Integer.parseInt(request.getParameter("post_id"));

    PostDao pd = new PostDao(ConnectionProvider.getConnection());
    Post p = pd.getPostByPostId(postId);
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>
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
        <!-- Navbar start -->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-coffee"></span> Learn Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-home"> Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-bars"> Courses
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Java</a>
                            <a class="dropdown-item" href="#">Python</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">C++</a>
                        </div>
                    </li>

                    <!--Create post-->
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-sticky-note"> Posts</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-vcard"> Contact</a>
                    </li>


                    <!--About us-->
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-rocket"> About</a>
                    </li>
                </ul>

                <ul class="navbar-nav mr-right">

                    <!-- user profile icon -->
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle ">  <%= user.getName()%> </a>
                    </li>

                    <!-- Logout -->
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-power-off "> Logout</a>
                    </li>
                </ul>

            </div>
        </nav>
        <!--Navbar end-->

        <!--Start of main content of body-->

        <div class="container">
            <div class="row my-4">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4><%= p.getpTitle()%></h4>
                        </div>

                        <div class="card-body">
                            <img src="post_pics/<%= p.getpPic()  %>" class="card-img-top" alt="...">
                            <p><br><%= p.getpContent()%></p>
                            <p><br><%= p.getpCode()%></p>
                        </div>

                        <div class="card-footer primary-background">
                             <a href="#!" class="btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span> 10</span></a>
                             <a href="#!" class="btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 5</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End of main content of body-->


        <!--Start of profile modal-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">LearnBlog</h5>
                        <button type="button" class="btn-close btn-outline-light" data-dismiss="modal" aria-label="Close"><span class="fa fa-times"></span></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%> " class="img-fluid" style="width: 100px;  max-height: 100px; border-radius: 50%; "/>
                            <br>
                            <h5 class="modal-title" id="exampleModalLabel"> <%= user.getName()%></h5>
                        </div>
                        <br>
                        <!--user profile details-->
                        <div id="profile-details">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">Email : </th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender : </th>
                                        <td><%= user.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Interests : </th>
                                        <td><%= user.getAbout()%></td>
                                    </tr>

                                    <tr>
                                        <th scope="row">Registered user since : </th>
                                        <td><%= user.getDateTime()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--user profile details end-->

                        <!--profile editing code-->
                        <div id="profile-edit" style="display: none">
                            <h5 class=" text-center">Edit Profile</h5>
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>Name :  </td>
                                        <td><input type="text" class="form-control" name="u_name" value="<%= user.getName()%>" required="true"></td> 
                                    </tr>

                                    <tr> 
                                        <td>Email : </td>
                                        <td><input type="email" class="form-control" name="u_mail" value="<%= user.getEmail()%>" required="true"></td>
                                    </tr>

                                    <tr> 
                                        <td>Password : </td>
                                        <td><input type="password" class="form-control" name="u_pass" value="<%= user.getPassword()%>" required="true"></td>
                                        <td><span id="eyepass" class="fa fa-eye" style="margin-top: 8px; margin-left: -15px;"></span></td>
                                    </tr>

                                    <tr> 
                                        <td>Confirm Password : </td>
                                        <td><input type="password" class="form-control" name="u_pass" value="<%= user.getPassword()%>" required="true"></td>
                                        <td><span id="eyepass" class="fa fa-eye" style="margin-top: 8px; margin-left: -15px;"></span></td>
                                    </tr>

                                    <tr> 
                                        <td>Gender : </td>
                                        <td><%= user.getGender()%></td>
                                    </tr>

                                    <tr> 
                                        <td>Interests : </td>
                                        <td><textarea class="form-control" name="u_about" required="true" rows="3"><%= user.getAbout()%></textarea></td>
                                    </tr>

                                    <tr> 
                                        <td>Profile picture : </td>
                                        <td><input type="file" class="form-control" name="u_pic" required="true"></td>
                                    </tr>

                                </table>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-primary ">Save</button>
                                </div>
                            </form>
                        </div>
                        <!--profile edit code end-->

                    </div>
                    <div class="modal-footer">
                        <button id="profile-edit-btn" type="button" class="btn btn-primary">Edit</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Profile Modal-->

        <!--Posts Modal start-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create a post</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form id="post-form-id" action="AddPostServlet" method="POST">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>--- Select category ---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {

                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }

                                    %>  

                                </select>
                            </div>


                            <!--// for post title-->
                            <div class="form-group">
                                <input type="text" name="pTitle" placeholder="Enter post title" class="form-control"/>
                            </div>

                            <!--// for post content-->
                            <div class="form-group">
                                <textarea name="pContent" placeholder="Enter content here..." class="form-control" style="height: 200px;"></textarea>
                            </div>

                            <!--// for post code if any-->
                            <div class="form-group">
                                <textarea name="pCode"  placeholder="Enter code here..." class="form-control" style="height: 100px;"></textarea>
                            </div>

                            <!--// for pic related to post-->
                            <div class="form-group">
                                <label>Select photo</label>
                                <br>
                                <input name="pFile" type="file" />
                            </div>

                            <!--Post button to submit posts-->
                            <div class="post-btn text-center">

                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>
        <!--Posts Modal end-->


        <!--scripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/myscript.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                //edit button is set to not clicked
                let editBtnClicked = false;

                // if edit button is clicked for first time then do if block and change value of editBtnClicked to true
                $('#profile-edit-btn').click(function () {

                    if (editBtnClicked == false)
                    {
                        //   hide profile details dashboard and show the profile details edit option
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editBtnClicked = true;
                        $(this).text("Back");
                    } else
                            //  if edit button is clicked once and now clicked again then do else block 
                            {
                                // show the profile details dashboard and hide edit profile details option
                                $('#profile-details').show();
                                $('#profile-edit').hide();
                                editBtnClicked = false;
                                $(this).text("Edit");
                            }
                })

//                                        // show password on click eye icon   - to be completed later
//                                        $('#eyepass').click(function() {
//                                                    
//                                                })
            });  //document.ready(function(){}); closed


        </script>

        <!--post form coding submit action-->
        <script>
            $(document).ready(function (e) {
                $('#post-form-id').on("submit", function (event) {
                    event.preventDefault();
                    console.log("submitted");

                    let form = new FormData(this);

                    // now requesting to server for asynchronous call
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "Done")
                            {
                                swal("Done", "Post saved successfully", "success");
                            } else {
                                swal("Error", "Oops! Something went wrong", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error", "Oops! Something went wrong", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>


    </body>
</html>
