package com.learn.blog.dao;

import com.learn.blog.entities.Category;
import com.learn.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<Category>();

        try {
            String q = "Select * from categories";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);

            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");

                Category c = new Category(cid, name, description);
                list.add(c);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public boolean savePostDetails(Post p){
        boolean flag = false;
        
        try{
            String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values (?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,p.getpTitle());
            pstmt.setString(2,p.getpContent());
            pstmt.setString(3,p.getpCode());
            pstmt.setString(4,p.getpPic());
            pstmt.setInt(5,p.getCatId());
            pstmt.setInt(6,p.getUserId());
            
            pstmt.executeUpdate();
            
            flag = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
//    display all posts
    public List<Post> getAllPosts()
    {
        List<Post> list = new ArrayList<Post>();
        try{
            PreparedStatement p = con.prepareStatement("Select * from posts order by pid desc");
            ResultSet rs = p.executeQuery();
            
            while(rs.next())
            {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                int userId = rs.getInt("userId");
                
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
            
                //fetch every post row detail and add it in list object
                list.add(post);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
   // display post when specific category is clicked
    public List<Post> getPostByCatId(int catId)
    {
        List<Post> list = new ArrayList<>();
        try{
        PreparedStatement p = con.prepareStatement("Select * from posts where catId = ?");
        p.setInt(1,catId);
            ResultSet rs = p.executeQuery();
            
            while(rs.next())
            {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                
                int userId = rs.getInt("userId");
                
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
            
                //fetch every post row detail and add it in list object
                list.add(post);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getPostByPostId(int PostId)
    {
        Post post = null;
        try{
             String query = "Select * from posts where pid = ?";
        PreparedStatement pt = this.con.prepareStatement(query);
        pt.setInt(1, PostId);
        ResultSet rs = pt.executeQuery();
        
        if(rs.next())
        {
                       
            int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int cid = rs.getInt("catId");
                int userId = rs.getInt("userId");
                
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
        }
        
        }
       catch(Exception e){
           e.printStackTrace();
       }
        
        return post;
    }
}
