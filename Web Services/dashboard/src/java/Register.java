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
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String employee_id = request.getParameter("employee_id");

        try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rtmsdb", "root", "");

            PreparedStatement pst = conn.prepareStatement("insert into users ('username','password','employee_id') values('" + username + "','" + password + "','" + employee_id + "')");
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, employee_id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
            } else {
                out.println("Incorrect Login Credentials");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

}
