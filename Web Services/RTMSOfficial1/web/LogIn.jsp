<%-- 
    Document   : LogIn
    Created on : Oct 24, 2017, 10:27:25 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <link rel="stylesheet" href="newcss.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <body class="w3-blue">
        <div class ="w3-card w3-white w3-display-middle w3-quarter">
            <h1 class="w3-center">Login</h1>
            <form class="w3-container" action="Validate" method="POST"></br>

                <label>Username</label>
                <input class="w3-input" type="text" name="username"></br>

                <label>Password</label>
                <input class="w3-input" type="password" name="password"></br>
               
                <button class="w3-btn w3-blue w3-block" type="submit">Login</button></br>
                
            </form>
        </div>
    </body>
</html>