<%-- 
    Document   : index
    Created on : Oct 11, 2017, 10:38:07 AM
    Author     : ZDGV
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Front Desk - RCTMS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="refresh" content="5" >
    <link rel="stylesheet" href="newcss.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    </style>
    <body class="w3-light-grey">
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

            int guestCount = 0, activeTix = 0, closedTix = 0, escCount = 0;
            try {
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement = connection.createStatement();
                String sql = "select count(*) from check_in where status = 'Active'";
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    guestCount = Integer.parseInt(resultSet.getString("count(*)"));
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement = connection.createStatement();
                String sql = "select count(*) from ticket where status = 'Open'";
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    activeTix = Integer.parseInt(resultSet.getString("count(*)"));
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement = connection.createStatement();
                String sql = "select count(*) from ticket where status = 'Closed'";
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    closedTix = Integer.parseInt(resultSet.getString("count(*)"));
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement = connection.createStatement();
                String sql = "select count(*) from ticket where level > 1";
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    escCount = Integer.parseInt(resultSet.getString("count(*)"));
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            float tixToEscRatio = closedTix / escCount;

            int hkTixCount = 0;

            try {
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement = connection.createStatement();
                String sql = "SELECT count(*) FROM ticket "
                        + "LEFT JOIN category ON ticket.category_id = category.id "
                        + "WHERE category.department_id = 1";

                resultSet = statement.executeQuery(sql);

                while (resultSet.next()) {
                    hkTixCount = Integer.parseInt(resultSet.getString("count(*)"));
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();

            }

            int fbTixCount = 0;

            try {
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement = connection.createStatement();
                String sql = "SELECT count(*) FROM ticket "
                        + "LEFT JOIN category ON ticket.category_id = category.id "
                        + "WHERE category.department_id = 3";

                resultSet = statement.executeQuery(sql);

                while (resultSet.next()) {
                    fbTixCount = Integer.parseInt(resultSet.getString("count(*)"));
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();

            }

        %>
        <!-- Top container -->
        <div class="w3-bar w3-top w3-blue w3-large" style="z-index:4">
            <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
            <span class="w3-bar-item w3-right">Logo</span>
        </div>

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-collapse w3-white " style="z-index:3;width:300px;" id="mySidebar"><br>
            <div class="w3-container w3-row">
                <div class="w3-col s4">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6PTjvcbPe7Np7aF-0iyfrnehYbTDXfGNlbpmyKCFN8I47Srj2Gg" class="w3-circle w3-margin-right" style="width:46px">
                </div>
                <div class="w3-col s8 w3-bar">
                    <span>Welcome, <strong>Mia</strong></span><br>
                    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
                    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
                    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
                <a href="home.jsp" class="w3-bar-item w3-button w3-padding "><i class="fa fa-users fa-fw"></i>  Overview</a>
                <a href="Tickets.jsp" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-ticket"></i>  Tickets</a>
                <a href="NewTicket.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-edit"></i>  New Ticket</a>
                <a href="Notification.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bell fa-fw"></i>  Notification</a>
                <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i>  History</a>
            </div>
        </nav>


        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px">
                <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5>
            </header>

            <div class="w3-row-padding w3-margin-bottom">

                <div class="w3-quarter">
                    <div class="w3-container w3-blue w3-padding-16">
                        <div class="w3-left"><i class="fa fa-ticket w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3><%                                out.println(activeTix);
                                %></h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Pending Tickets</h4>
                    </div>  
                </div>

                <div class="w3-quarter">
                    <div class="w3-container w3-green w3-padding-16">
                        <div class="w3-left"><i class="fa fa-check w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3><%
                                out.println(closedTix);
                                %></h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Tickets Resolved</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-pink w3-padding-16">
                        <div class="w3-left"><i class="fa fa-angle-double-up w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3><%
                                out.println(escCount);
                                %></h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Escalated</h4>
                    </div>
                </div>

                <div class="w3-quarter">
                    <div class="w3-container w3-purple w3-text-white w3-padding-16">
                        <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3><%
                                out.println(guestCount);
                                %></h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Guests</h4>
                    </div>
                </div>

            </div>

            <div class="w3-container w3-third">
                <h2>Housekeeping</h2>
                <div class="w3-container w3-blue w3-padding-16">
                    <div class="w3-left"><i class="fa fa-ticket w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3><%
                            out.println(hkTixCount);
                            %></h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4>Pending Tickets</h4>
                </div> </br>


                <!-- Housekeeping tickets -->


                <% for (int i = 1; i <= hkTixCount; i++) {%>
                <div class="w3-card-2 w3-white"><div class="w3-container w3-green">
                        </br>
                    </div><div class="w3-container w3-padding-16">
                        <div class="w3-left"></div><h4>
                            <i class="material-icons">room</i>
                            <%try {
                                    connection = DriverManager.getConnection(connectionUrl, userid, password);
                                    statement = connection.createStatement();
                                    String sql = "Select ticket.description, room.roomno from ticket "
                                            + "LEFT JOIN category ON ticket.category_id = category.id "
                                            + "LEFT JOIN check_in ON ticket.check_in_id = check_in.id "
                                            + "LEFT JOIN room ON check_in.room_id = room.id "
                                            + "WHERE category.department_id = 1";

                                    resultSet = statement.executeQuery(sql);
                                    if (resultSet.absolute(i)) {
                                        out.println(resultSet.getString("roomno"));
                                    }
                                    connection.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }%></h4>
                        <div class="w3-clear"></div>
                        <h5><%try {
                                connection = DriverManager.getConnection(connectionUrl, userid, password);
                                statement = connection.createStatement();
                                String sql = "Select ticket.description, room.roomno from ticket "
                                        + "LEFT JOIN category ON ticket.category_id = category.id "
                                        + "LEFT JOIN check_in ON ticket.check_in_id = check_in.id "
                                        + "LEFT JOIN room ON check_in.room_id = room.id "
                                        + "WHERE category.department_id = 1";

                                resultSet = statement.executeQuery(sql);
                                if (resultSet.absolute(i)) {
                                    out.println(resultSet.getString("description"));
                                }
                                connection.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }%></h5>

                    </div></div> </br>
                    <%}%>
            </div>
            <!-- End of Housekeeping tickets -->


            <!-- Food & Beverage tickets -->
            <div class="w3-container w3-third"><h2>Food & Beverages</h2>
                <div class="w3-container w3-blue w3-padding-16">
                    <div class="w3-left"><i class="fa fa-ticket w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3><%
                            out.println(fbTixCount);
                            %></h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4>Pending Tickets</h4>
                </div> </br>



                <% for (int i = 1; i <= fbTixCount; i++) {%>
                <div class="w3-card-2 w3-white"><div class="w3-container w3-green">
                        </br>
                    </div><div class="w3-container w3-padding-16">
                        <div class="w3-left"></div><h4>
                            <i class="material-icons">room</i>
                            <%try {
                                    connection = DriverManager.getConnection(connectionUrl, userid, password);
                                    statement = connection.createStatement();
                                    String sql = "Select ticket.description, room.roomno from ticket "
                                            + "LEFT JOIN category ON ticket.category_id = category.id "
                                            + "LEFT JOIN check_in ON ticket.check_in_id = check_in.id "
                                            + "LEFT JOIN room ON check_in.room_id = room.id "
                                            + "WHERE category.department_id = 3";

                                    resultSet = statement.executeQuery(sql);
                                    if (resultSet.absolute(i)) {
                                        out.println(resultSet.getString("roomno"));
                                    }
                                    connection.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }%></h4>
                        <div class="w3-clear"></div>
                        <h5><%try {
                                connection = DriverManager.getConnection(connectionUrl, userid, password);
                                statement = connection.createStatement();
                                String sql = "Select ticket.description, room.roomno from ticket "
                                        + "LEFT JOIN category ON ticket.category_id = category.id "
                                        + "LEFT JOIN check_in ON ticket.check_in_id = check_in.id "
                                        + "LEFT JOIN room ON check_in.room_id = room.id "
                                        + "WHERE category.department_id = 3";

                                resultSet = statement.executeQuery(sql);
                                if (resultSet.absolute(i)) {
                                    out.println(resultSet.getString("description"));
                                }
                                connection.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }%></h5>

                    </div></div> </br>
                    <%}%>
            </div>
            <!-- End of Food & Beverage Tickets -->
            <div class="w3-container w3-third"><h2>Engineering</h2></div>

            <button class="w3-button w3-circle w3-grey" style="position: fixed; bottom: 20px; right: 15px; text-align: center;"><i class="material-icons">&#xe87f;</i></button>
            <!-- Footer -->
            <footer class="w3-container w3-padding-16 w3-light-grey">
                <h4>FOOTER</h4>
                <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">will of god</a></p>
            </footer>

            <!-- End page content -->
        </div>

        <script>
            // Get the Sidebar
            var mySidebar = document.getElementById("mySidebar");

            // Get the DIV with overlay effect
            var overlayBg = document.getElementById("myOverlay");

            // Toggle between showing and hiding the sidebar, and add overlay effect
            function w3_open() {
                if (mySidebar.style.display === 'block') {
                    mySidebar.style.display = 'none';
                    overlayBg.style.display = "none";
                } else {
                    mySidebar.style.display = 'block';
                    overlayBg.style.display = "block";
                }
            }

            // Close the sidebar with the close button
            function w3_close() {
                mySidebar.style.display = "none";
                overlayBg.style.display = "none";
            }
        </script>

    </body>
</html>
