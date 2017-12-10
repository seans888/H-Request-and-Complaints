
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import apc.edu.ph.User;

@WebServlet(urlPatterns = {"/Validate"})

public class Validate extends HttpServlet {

    private static final long serialVersionUID = 1l;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String id = request.getParameter("userid");
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/rtmsdb";
        String userid = "root";
        String pass = "";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        User user = new User();

        try {
            connection = DriverManager.getConnection(connectionUrl, userid, pass);
            statement = connection.createStatement();
            String sql = "Select users.id, users.username, users.password, users.prof_pic,users.employee_id,employee.firstName, employee.lastName, department.name AS department from users "
                    + "LEFT JOIN employee ON users.employee_id = employee.id "
                    + "LEFT JOIN department ON employee.department_id = department.id WHERE users.username = '" + username + "'";
           
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                user.setUserId(resultSet.getInt("id "));
                user.setEmpId(resultSet.getInt("employee_id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setFirstName(resultSet.getString("firstName"));
                user.setLastName(resultSet.getString("lastName"));
                user.setPicLink(resultSet.getString("prof_pic"));
                user.setDepartment(resultSet.getString("department"));
                session.setAttribute("user", user);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rtmsdb", "root", "");

            PreparedStatement pst = conn.prepareStatement("Select * from users where username=? and password=?");
            pst.setString(1, username);
            pst.setString(2, password);
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
