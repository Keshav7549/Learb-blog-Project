package com.learn.blog.servlets;

import com.learn.blog.dao.UserDao;
import com.learn.blog.entities.Message;
import com.learn.blog.entities.User;
import com.learn.blog.helper.ConnectionProvider;
import com.learn.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // fetch all user data from profile.jsp page
            String u_name = request.getParameter("u_name");
            String u_mail = request.getParameter("u_mail");
            String u_pass = request.getParameter("u_pass");
            String u_about = request.getParameter("u_about");

            //to get profile image as part file object
            Part part = request.getPart("u_pic");
            // will return image name with extension from the profile pic uploaded by user in profile.jsp page
            String image_name = part.getSubmittedFileName();

            // get the user from the session created earlier in User class
            HttpSession session = request.getSession();

            //get the session of the currentUser logged in
            User user = (User) session.getAttribute("currentUser");

            // set all the values fetched above from profile.jsp edit page and set using setter method of user class
            user.setEmail(u_mail);
            user.setName(u_name);
            user.setPassword(u_pass);
            user.setAbout(u_about);

            // this variable created to get old file path of /pics folder before setting new file path
            String old_file_path = user.getProfile();

            user.setProfile(image_name);

            //Now we changed the set data in user class for all the values we fetched from profile.jsp edit page 
            // We will need UserDao object to make these user changes in the database
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean val = dao.UpdateUser(user);

            if (val) {
                out.println("updated to DB");

                //fetch path of pics folder
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();

                // delete file using helper class deleteFile() method
                String old_path = request.getRealPath("/") + "pics" + File.separator + old_file_path;
                if (! old_file_path.equals("default.png")) {
                    Helper.deleteFile(old_path);
                }
                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Profile updated usccessfully...");
                    Message msg = new Message("Profile updated successfully...", "success", "alert-success");

                    session.setAttribute("msg", msg);

                } else {
                    out.println("Profile saving error...");
                    Message msg = new Message("Profile saving error...", "error", "alert-danger");

                    session.setAttribute("msg", msg);
                }
                response.sendRedirect("profile.jsp");
            } else {
                out.println("Profile saving error - not updated");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
