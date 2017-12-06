<%-- 
    Document   : Registration
    Created on : Dec 3, 2017, 10:02:02 PM
    Author     : user
--%>

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
        <div class ="w3-card w3-white w3-display-middle w3-quarter">
            <h1 class="w3-center">Register</h1>
            <form class="w3-container" action="Process" method="get"></br>

               
                <label>Employee I.D.</label>
                <input class="w3-input" type="text" name="employee_id"></br>
                
                <label>Username</label>
                <input class="w3-input" type="text" name="username"></br>

                <label>Password</label>
                <input class="w3-input" type="text" name="password"></br>
                
                <label>Confirm Password</label>
                <input class="w3-input" type="text" name="cpassword"></br>


                <button class="w3-btn w3-blue w3-block" type="submit" onclick="test(form)">Submit</button></br>

            </form>
        </div>
    </body>
</html>