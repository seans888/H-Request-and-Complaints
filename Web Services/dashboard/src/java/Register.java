//Register.java
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import apc.edu.ph.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author zdgv
 */
@WebServlet(urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String prof_pic = request.getParameter("prof_pic");
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/rtmsdb";
        String userid = "root";
        String pass = "";
        PreparedStatement pst = null;
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DriverManager.getConnection(connectionUrl, userid, pass);

            statement = connection.createStatement();

            String sql = "INSERT INTO users(username,password,prof_pic,employee_id) VALUES(?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, prof_pic);
            pst.setInt(4, employee_id);

            pst.execute();
            
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet new_feedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println(pst);
            out.println("</body>");
            out.println("</html>");
        }
    }
}
