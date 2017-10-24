<%-- 
    Document   : error
    Created on : Oct 12, 2017, 4:49:00 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello may error: <%=(String)request.getAttribute("Error")%></h1>
    </body>
</html>
