/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author student
 */
@WebServlet(urlPatterns = {"/NewTicket"})
public class NewTicket extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            out.println("<!DOCTYPE html>\n" +
"<html>\n" +
"<title>Create New Ticket - RCTMS</title>\n" +
"<head>\n" +
"<meta charset=\"UTF-8\">\n" +
"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"<link rel=\"stylesheet\" href=\"newcss.css\">"
                    + "<link rel=\"stylesheet\" href=\"stylr.css\">\n" +
"<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Raleway\">\n" +
"<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n" +
"<style>\n" +
"html,body,h1,h2,h3,h4,h5 {font-family: \"Raleway\", sans-serif}\n" +
"</style>\n" +
"</head>\n" +
"<body class=\"w3-light-grey\">\n" +
"\n" +
"<!-- Top container -->\n" +
"<div class=\"w3-bar w3-top w3-blue w3-large\" style=\"z-index:4\">\n" +
"  <button class=\"w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey\" onclick=\"w3_open();\"><i class=\"fa fa-bars\"></i>  Menu</button>\n" +
"  <span class=\"w3-bar-item w3-right\">Logo</span>\n" +
"</div>\n" +
"\n" +
"<!-- Sidebar/menu -->\n" +
"<nav class=\"w3-sidebar w3-collapse w3-white w3-animate-left\" style=\"z-index:3;width:300px;\" id=\"mySidebar\"><br>\n" +
"  <div class=\"w3-container w3-row\">\n" +
"    <div class=\"w3-col s4\">\n" +
"      <img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6PTjvcbPe7Np7aF-0iyfrnehYbTDXfGNlbpmyKCFN8I47Srj2Gg\" class=\"w3-circle w3-margin-right\" style=\"width:46px\">\n" +
"    </div>\n" +
"    <div class=\"w3-col s8 w3-bar\">\n" +
"      <span><strong>RCTMS</strong></span><br>\n" +
"      <a href=\"#\" class=\"w3-bar-item w3-button\"><i class=\"fa fa-envelope\"></i></a>\n" +
"      <a href=\"#\" class=\"w3-bar-item w3-button\"><i class=\"fa fa-user\"></i></a>\n" +
"      <a href=\"#\" class=\"w3-bar-item w3-button\"><i class=\"fa fa-cog\"></i></a>\n" +
"    </div>\n" +
"  </div>\n" +
"  <hr>\n" +
"  <div class=\"w3-container\">\n" +
"    <h5>Dashboard</h5>\n" +
"  </div>\n" +
"  <div class=\"w3-bar-block\">\n" +
"    <a href=\"#\" class=\"w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black\" onclick=\"w3_close()\" title=\"close menu\"><i class=\"fa fa-remove fa-fw\"></i>  Close Menu</a>\n" +
"    <a href=\"index.html\" class=\"w3-bar-item w3-button w3-padding w3-blue\"><i class=\"fa fa-users fa-fw\"></i>  Overview</a>\n" +
"    <a href=\"NewTicket\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-eye fa-fw\"></i>  Views</a>\n" +
"    <a href=\"#\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-edit fa-fw\"></i>  New Ticket</a>\n" +
"    <a href=\"#\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-bell fa-fw\"></i>  News</a>\n" +
"    <a href=\"#\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-history fa-fw\"></i>  History</a>\n" +
"  </div>\n" +
"</nav>\n" +
"\n" +
"\n" +
"<!-- Overlay effect when opening sidebar on small screens -->\n" +
"<div class=\"w3-overlay w3-hide-large w3-animate-opacity\" onclick=\"w3_close()\" style=\"cursor:pointer\" title=\"close side menu\" id=\"myOverlay\"></div>\n" +
"\n" +
"<!-- !PAGE CONTENT! -->\n" +
"<div class=\"w3-main\" style=\"margin-left:300px;margin-top:43px;\">\n" +
"\n" +
"  <!-- Header -->\n" +
"  <header class=\"w3-container\" style=\"padding-top:22px\">\n" +
"    <h5><b><i class=\"fa fa-dashboard\"></i> My Dashboard</b></h5>\n" +
"  </header>\n" +
"  \n" +
"  \n" +
"\n" +
"\n" +
"  <div class=\"w3-row-padding w3-margin-bottom\">\n" +
"   \n" +
"  </div>\n" +
"\n" +
"  <div class=\"w3-panel\">\n" +
"    <div class=\"w3-row-padding\" style=\"margin:0 -16px\">\n" +
"      <form action=\"/action_page.php\">\n" +
"    <label for=\"gname\">Guest Name:</label>\n" +
"    <input type=\"text\" id=\"gname\" name=\"guestname\" placeholder=\"Enter Guest's Name\">\n" +
"\n" +
"    <label for=\"rnum\">Room Number</label>\n" +
"    <input type=\"text\" id=\"rnum\" name=\"roomNum\" placeholder=\"Enter Room Number\">\n" +
"    \n" +
"    <label for=\"category\">Category</label>\n" +
"    <input type=\"text\" id=\"category\" name=\"catry\" placeholder=\"Enter Category\">\n" +
"\n" +
"    <label for=\"department\">Department</label>\n" +
"    <select id=\"department\" name=\"dept\">\n" +
"      <option value=\"australia\">Engineering</option>\n" +
"      <option value=\"canada\">House Keeping</option>\n" +
"      <option value=\"usa\">Food and Beverages</option>\n" +
"    </select>\n" +
"    \n" +
"  <label for=\"nature\">Nature</label>\n" +
"    <select id=\"nature\" name=\"natre\">\n" +
"      <option value=\"request\">Request</option>\n" +
"      <option value=\"complaint\">Complaint</option>\n" +
"    </select>\n" +
"  \n" +
"    <input type=\"submit\" value=\"Submit\">\n" +
"  </form>\n" +
"      \n" +
"    </div>\n" +
"  </div>\n" +
"  <hr>\n" +
"  \n" +
"\n" +
"  <br>\n" +
" \n" +
"\n" +
"  <!-- Footer -->\n" +
"  <footer class=\"w3-container w3-padding-16 w3-light-grey\">\n" +
"    <h4>FOOTER</h4>\n" +
"    <p>Powered by <a href=\"https://www.w3schools.com/w3css/default.asp\" target=\"_blank\">w3.css</a></p>\n" +
"  </footer>\n" +
"\n" +
"  <!-- End page content -->\n" +
"</div>\n" +
"\n" +
"<script>\n" +
"// Get the Sidebar\n" +
"var mySidebar = document.getElementById(\"mySidebar\");\n" +
"\n" +
"// Get the DIV with overlay effect\n" +
"var overlayBg = document.getElementById(\"myOverlay\");\n" +
"\n" +
"// Toggle between showing and hiding the sidebar, and add overlay effect\n" +
"function w3_open() {\n" +
"    if (mySidebar.style.display === 'block') {\n" +
"        mySidebar.style.display = 'none';\n" +
"        overlayBg.style.display = \"none\";\n" +
"    } else {\n" +
"        mySidebar.style.display = 'block';\n" +
"        overlayBg.style.display = \"block\";\n" +
"    }\n" +
"}\n" +
"\n" +
"// Close the sidebar with the close button\n" +
"function w3_close() {\n" +
"    mySidebar.style.display = \"none\";\n" +
"    overlayBg.style.display = \"none\";\n" +
"}\n" +
"</script>\n" +
"\n" +
"</body>\n" +
"</html>\n" +
"");
            out.println("<title>Servlet NewTicket</title>");            
           
            out.println("<h1>Servlet NewTicket at " + request.getContextPath() + "</h1>");
           
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
