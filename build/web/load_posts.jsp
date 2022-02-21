<%@page import="java.util.*"%>
<%@page import="com.learn.blog.entities.Post"%>
<%@page import="com.learn.blog.helper.ConnectionProvider"%>
<%@page import="com.learn.blog.dao.PostDao"%>

<div class="row">
    
    <% 
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    
    //fetch all posts only when catId = 0 in profile.jsp
    //fetch catid value from profile.jsp page
    int cid = Integer.parseInt(request.getParameter("cid"));
    
    //Set list of post type as null initially
    List<Post> posts = null;
    
    //if category id is 0 then only display all posts
    if(cid == 0)
    {
        posts = dao.getAllPosts();
    }
    // if anything except 0 then display posts accoring to category
    else{
        posts = dao.getPostByCatId(cid);
    }   
    
    // in case no posts are available print default mmessage
    if(posts.size() == 0)
    {
        out.println("<h3 class='container text-center' >No posts in this category.</h3>");
        return;
    }
    
    for(Post val : posts)
    {
        %>
        <div class="col-md-4 m-auto">
            <div class="card">
                <img src="post_pics/<%= val.getpPic()  %>" class="card-img-top" alt="...">
                <div class="card-body">
                    <b><%= val.getpTitle() %></b>
                    <p><%= val.getpContent() %></p>
                    
                </div>
                    
                    <div class="card-footer text-center primary-background">
                        <a href="#!" class="btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span> 10</span></a>
                        <a href="show_blog_page.jsp?post_id=<%= val.getPid() %>" class="btn-outline-light btn-sm">Read more...</a>
                        <a href="#!" class="btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 5</span></a>
                    </div>
            </div>
        </div>
        <%
    }
    
%>

</div>
