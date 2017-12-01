<%-- 
    Document   : Index
    Created on : Oct 24, 2017, 10:27:25 PM
    Author     : user
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="apc.edu.ph.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RTMS Download</title>
    </head>

    <link rel="stylesheet" href="newcss.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <body class="w3-blue">
        <%
            String id = request.getParameter("userid");
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/rtmsdb";
            String userid = "root";
            String password = "";
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
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement = connection.createStatement();
                String sql = "Select users.username, users.password, users.employee_id,employee.firstName, employee.lastName, department.name AS department from users "
                        + "LEFT JOIN employee ON users.employee_id = employee.id "
                        + "LEFT JOIN department ON employee.department_id = department.id";
                
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    user.setId(resultSet.getInt("employee_id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setPassword(resultSet.getString("password"));
                    user.setFirstName(resultSet.getString("firstName"));
                    user.setLastName(resultSet.getString("lastName"));

                }
                connection.close();
            } catch (Exception e) {
                out.println("OUCH");
                e.printStackTrace();
            }

        %>
        <div class ="w3-card w3-white w3-display-middle w3-quarter">
            <h1 class="w3-center">Login</h1>
            <form class="w3-container" action="Validate" method="post"></br>

                <label>Username</label>
                <input class="w3-input" type="text" name="username"></br>

                <label>Password</label>
                <input class="w3-input" type="password" name="password"></br>

                <button class="w3-btn w3-blue w3-block" type="submit">Login</button></br>

            </form>
        </div>
    </body>
</html>