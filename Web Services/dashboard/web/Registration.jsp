<%-- 
<<<<<<< HEAD
    Document   : Notification
    Created on : Nov 15, 2017, 11:43:08 PM
    Author     : zdgv
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="apc.edu.ph.User"%>
<!DOCTYPE html>
<html>
    <title>Front Desk - RCTMS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="newcss.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    </style>
    <body class="w3-light-grey">
        <%
            session = request.getSession(false);
            if (session.getAttribute("user") == null) {
                String url = request.getContextPath() + "/index.jsp";
                response.sendRedirect(url);
            }
            User user = (User) session.getAttribute("user");
            session = request.getSession(false);
            if (session.getAttribute("user") == null) {
                String url = request.getContextPath() + "/index.jsp";
                response.sendRedirect(url);
            }

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
            connection = DriverManager.getConnection(connectionUrl, userid, password);
        %>
        <!-- Top container -->
        <div class="w3-bar w3-top w3-blue w3-large" style="z-index:4">
            <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
            <form action="Logout" method="post">
                <span class="w3-bar-item w3-right"><button class="w3-button w3-hover-none">Logout <i class="fa fa-sign-out"></i></button></span>
            </form>
        </div>

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div class="w3-container w3-row">
                <a href="NewTicket.jsp"></a>
                <div class="w3-col w3-center">
                    </br>
                    <img src="${user.picLink}" class="w3-circle w3-margin-right w3-image" style="width:46px">
                </div>
                <div class="w3-col w3-center w3-bar">
                    <span>Welcome, <strong> ${user.firstName} </strong></span><br>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
                <a href="home.jsp" class="w3-bar-item w3-button w3-padding "><i class="fa fa-users fa-fw"></i>  Overview</a>
                <a href="Tickets.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-ticket"></i>  Tickets</a>
                <a href="NewTicket.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-edit"></i>  New Ticket</a>
                <!--<a href="Notification.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bell fa-fw"></i>  Notification</a>-->
                <a href="Profile.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw"></i>  Profile</a>
                <%                    if (user.getDepartment().equals("Administrator")) {
                %>  
                <a href="Feedbacks.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-comment fa-fw"></i>  Feedbacks</a>
                <a href="Registration.jsp" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-address-card	 fa-fw"></i>  New User</a><%
                    }%>
            </div>
        </nav>


        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <div class="w3-container w3-green">
                </br><h2>Registration</h2>
            </div>
            <div class="w3-container" style="margin-bottom: 15px; padding: 4px 12px;">

                <script>
                    function test(form) {
                        if (form.username.value === "") {
                            alert("Username must not be blank");
                        }
                        if (form.password.value === "") {
                            alert("Password must not be blank");
                        }
                        if (form.password.value !== form.cpassword.value) {
                            alert("Password did not match");
                        }

                    }
                </script>


                <div class ="w3-card w3-white">
                    <h1 class="w3-center">Register</h1>
                    <form class="w3-container" action="Register" method="get"></br>

                        <label>Username</label>
                        <input class="w3-input" type="text" name="username"></br>

                        <label>Password</label>
                        <input class="w3-input" type="password" name="password"></br>

                        <label>Confirm Password</label>
                        <input class="w3-input" type="password" name="cpassword"></br>

                        <label>Profile Pic Link:</label>
                        <input class="w3-input" type="text" name="prof_pic"></br>

                        <label>Employee I.D.</label>
                        <input class="w3-input" type="text" name="employee_id"></br>

                        <button class="w3-btn w3-blue w3-block" type="submit" >Submit</button></br>

                    </form>
                </div>


            </div> 


            <button class="w3-button material-icons w3-red w3-circle w3-display-bottomright w3-margin" style="width:50px;height:50px;position:fixed;"
                    onclick="document.getElementById('id01').style.display = 'block'"><b>!</b></button><!-- End page content -->
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
        <!-- The Modal -->
        <div id="id01" class="w3-modal">
            <div class="w3-modal-content">
                <div class="w3-card-4 test" >

                    <div class="w3-container w3-red">
                        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
                        <h2>Experienced a Problem?</h2>
                    </div>

                    <form class="w3-container" action="new_feedback" method="POST"></br>

                        <label>Please tell us your experiences</label>
                        <textarea class="w3-input" type="text" name="feedback"></textarea></br>

                        <a href="Feedback.jsp"> <button class="w3-btn w3-blue" type="submit">Submit</button></a></br></br>
                    </form>

                </div> 
            </div>
        </div>
    </body>
</html>
