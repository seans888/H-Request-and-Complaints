/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apc.edu.ph;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mathew
 */
@WebServlet(name = "new_ticket", urlPatterns = {"/new_ticket"})
public class new_ticket extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int empid = user.getEmpId();
        String roomno = request.getParameter("roomno");
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/rtmsdb";
        String userid = "root";
        String pass = "";
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        int roomno_id = 0;
        int category_id = 0;
        int check_in_id = 0;
        int dept_id = 0;
        List<Integer> employees = new ArrayList<>();
        int chosen_one = 0;
        String query = "AYKO";
        PreparedStatement pst = null;
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection(connectionUrl, userid, pass);
            query = "SELECT id FROM room WHERE roomno = " + roomno;
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                roomno_id = Integer.parseInt(resultSet.getString("id"));
            }

            query = "SELECT id FROM check_in WHERE room_id = " + roomno_id;
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                check_in_id = Integer.parseInt(resultSet.getString("id"));
            }

            query = "SELECT id FROM category WHERE name = '" + category + "'";
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                category_id = Integer.parseInt(resultSet.getString("id"));
            }

            query = "SELECT department_id FROM category WHERE id = " + category_id;
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                dept_id = Integer.parseInt(resultSet.getString("department_id"));
            }
            query = "SELECT id FROM employee WHERE level = 1 AND department_id = " + dept_id;
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                employees.add(Integer.parseInt(resultSet.getString("id")));
            }
            Random randomGenerator = new Random();
            int index = randomGenerator.nextInt(employees.size());
            chosen_one = employees.get(index);

            query = "INSERT INTO ticket(category_id, check_in_id, employee_responsible_id, employee_create_id, description) VALUES (?,?,?,?,?)";
            pst = connection.prepareStatement(query);
            pst.setInt(1, category_id);
            pst.setInt(2, check_in_id);
            pst.setInt(3, chosen_one);
            pst.setInt(4, empid);
            pst.setString(5, description);
            pst.execute();
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);
            

        } catch (SQLException ex) {
            Logger.getLogger(new_ticket.class.getName()).log(Level.SEVERE, null, ex);
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
