
import com.mysql.jdbc.Connection;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author student
 */
@WebServlet(urlPatterns = {"/NewTicketz"})
public class NewTicketz extends HttpServlet {
    
 
    String guestName, roomNum, dept, category;
    String query;
    Connection conn;    
    Statement state;
    ResultSet res;
    DatabaseConnection dbconn;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            dbconn   = new DatabaseConnection();
           
            
            guestName = request.getParameter("guestName");
            roomNum = request.getParameter("roomNum");
            category = request.getParameter("category");
            dept = request.getParameter("dept");
              
             conn=dbconn.setConnection();
             state = conn.createStatement();
             
             query = "insert into ticket ('guestName','roomNum','category','description') values('"+guestName+"','"+roomNum+"','"+category+"','"+dept+"')";

             
              out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
                         
            out.println(query);
             
            out.println("</body>");
            out.println("</html>");
             
             
            
        }catch (Exception e){
            request.setAttribute("Error", e);
            RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
             rd.forward(request,response);
        }
        finally{
             RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
             rd.forward(request,response);
            }
    }

       @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
