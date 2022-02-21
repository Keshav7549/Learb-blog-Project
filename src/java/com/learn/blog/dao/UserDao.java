
package com.learn.blog.dao;

import com.learn.blog.entities.User;
import java.sql.*;

public class UserDao {
    
    private Connection con;
    boolean f=false;
    public UserDao(Connection con) {
        this.con = con;
    }
    
    
    //method to insert user data
      public boolean saveUser(User user)
      {
          try{
              
              //Create query first
              String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
              
              //Store it im db using preparedstatement
              PreparedStatement pstmt = this.con.prepareStatement(query);
              
              //set column values for every ?
              pstmt.setString(1, user.getName());
              pstmt.setString(2, user.getEmail());
              pstmt.setString(3, user.getPassword());
              pstmt.setString(4, user.getGender());
              pstmt.setString(5, user.getAbout());
              
              //execute the insert/update statement
              pstmt.executeUpdate();
              
              //set boolean to true once query is executed successfully
              f=true;
          }
          
          catch(Exception e)
          {
              e.printStackTrace();
          }
          
          return f;
      }
      
      //get user by user email and password
      
        public User getUserByEmailAndPassword(String email, String password)
        {
            User user = null;
            
            try{
                
                String query = "select * from user where email = ? and password = ?";
                
                //create prepared statement object and pass your query to be executed
                PreparedStatement pstmt = this.con.prepareStatement(query);
                
                //set object values for ? in the query using setString() for values entered by user received in getUserByEmailAndPassword() method
                pstmt.setString(1, email);
                pstmt.setString(2, password);
                
                //execute the above select query using executeQuery() and store result in resultset object
                ResultSet rs = pstmt.executeQuery();
                
                //if resultset object is not empty or any row data is present in db for that select query then if block continues
                if(rs.next())
                {
                 
                    //initialize previous user variable which was null by creating new User class object
                    user = new User();
                    
                    //set each column value in user object for that row from where resultset data is coming from db
                    
                    //data coming db present in rs object
                    String name = rs.getString("name");
                    
                    //setting db data for name we fetched from result set object into name column present in db
                    user.setName(name);
                    
                    //combining above two lines in one line as below
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setGender(rs.getString("gender"));
                    user.setAbout(rs.getString("about"));
                    user.setId(rs.getInt("id"));
                    user.setDateTime(rs.getTimestamp("rdate"));
                    user.setProfile(rs.getString("profile"));
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            return user;
        }
      
        // method to update user details taken from profile.jsp edit page into the DB
        public boolean UpdateUser(User user)
        {
            boolean val = false;
            try{
                    String query = "Update user set name = ?, email = ?, password = ?, gender = ?, about = ?, profile = ? where id = ? ";
                    
                    PreparedStatement pstmt = con.prepareStatement(query);
                    
                    pstmt.setString(1, user.getName());
                    pstmt.setString(2, user.getEmail());
                    pstmt.setString(3, user.getPassword());
                    pstmt.setString(4, user.getGender());
                    pstmt.setString(5, user.getAbout());
                    pstmt.setString(6, user.getProfile());
                    pstmt.setInt(7, user.getId());
                    
                    pstmt.executeUpdate();
                    val = true;
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            return val;
        }
    
}
