
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/Validate"})

public class Validate extends HttpServlet {

    private static final long serialVersionUID = 1l;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
           
            out.println("hello");
            Class.forName("com.mysql.jdbc.Driver");
                         

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rtmsdb", "root", "");
            
         
            
            PreparedStatement pst = conn.prepareStatement("Select username, password from users where username=? and password=?");
            
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
             rd.forward(request,response);
            } else {
                out.println("Incorrect Login Credentials");
            }

            
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

}
