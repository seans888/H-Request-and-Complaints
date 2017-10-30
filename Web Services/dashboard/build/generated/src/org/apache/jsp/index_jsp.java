package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Statement;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <title>Front Desk - RCTMS</title>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"newcss.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Raleway\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("    <style>\r\n");
      out.write("        html,body,h1,h2,h3,h4,h5 {font-family: \"Raleway\", sans-serif}\r\n");
      out.write("    </style>\r\n");
      out.write("    <body class=\"w3-light-grey\">\r\n");
      out.write("        ");

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
        
      out.write("\r\n");
      out.write("        <!-- Top container -->\r\n");
      out.write("        <div class=\"w3-bar w3-top w3-blue w3-large\" style=\"z-index:4\">\r\n");
      out.write("            <button class=\"w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey\" onclick=\"w3_open();\"><i class=\"fa fa-bars\"></i>  Menu</button>\r\n");
      out.write("            <span class=\"w3-bar-item w3-right\">Logo</span>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <!-- Sidebar/menu -->\r\n");
      out.write("        <nav class=\"w3-sidebar w3-collapse w3-white w3-animate-left\" style=\"z-index:3;width:300px;\" id=\"mySidebar\"><br>\r\n");
      out.write("            <div class=\"w3-container w3-row\">\r\n");
      out.write("                <div class=\"w3-col s4\">\r\n");
      out.write("                    <img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6PTjvcbPe7Np7aF-0iyfrnehYbTDXfGNlbpmyKCFN8I47Srj2Gg\" class=\"w3-circle w3-margin-right\" style=\"width:46px\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"w3-col s8 w3-bar\">\r\n");
      out.write("                    <span>Welcome, <strong>Mia</strong></span><br>\r\n");
      out.write("                    <a href=\"#\" class=\"w3-bar-item w3-button\"><i class=\"fa fa-envelope\"></i></a>\r\n");
      out.write("                    <a href=\"#\" class=\"w3-bar-item w3-button\"><i class=\"fa fa-user\"></i></a>\r\n");
      out.write("                    <a href=\"#\" class=\"w3-bar-item w3-button\"><i class=\"fa fa-cog\"></i></a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <hr>\r\n");
      out.write("            <div class=\"w3-container\">\r\n");
      out.write("                <h5>Dashboard</h5>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"w3-bar-block\">\r\n");
      out.write("                <a href=\"#\" class=\"w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black\" onclick=\"w3_close()\" title=\"close menu\"><i class=\"fa fa-remove fa-fw\"></i>  Close Menu</a>\r\n");
      out.write("                <a href=\"#\" class=\"w3-bar-item w3-button w3-padding w3-blue\"><i class=\"fa fa-users fa-fw\"></i>  Overview</a>\r\n");
      out.write("                <a href=\"Tickets.jsp\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-ticket\"></i>  Tickets</a>\r\n");
      out.write("                <a href=\"NewTicket.jsp\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-edit\"></i>  New Ticket</a>\r\n");
      out.write("                <a href=\"#\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-bell fa-fw\"></i>  Notification</a>\r\n");
      out.write("                <a href=\"#\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-history fa-fw\"></i>  History</a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- Overlay effect when opening sidebar on small screens -->\r\n");
      out.write("        <div class=\"w3-overlay w3-hide-large w3-animate-opacity\" onclick=\"w3_close()\" style=\"cursor:pointer\" title=\"close side menu\" id=\"myOverlay\"></div>\r\n");
      out.write("\r\n");
      out.write("        <!-- !PAGE CONTENT! -->\r\n");
      out.write("        <div class=\"w3-main\" style=\"margin-left:300px;margin-top:43px;\">\r\n");
      out.write("\r\n");
      out.write("            <!-- Header -->\r\n");
      out.write("            <header class=\"w3-container\" style=\"padding-top:22px\">\r\n");
      out.write("                <h5><b><i class=\"fa fa-dashboard\"></i> My Dashboard</b></h5>\r\n");
      out.write("            </header>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"w3-row-padding w3-margin-bottom\">\r\n");
      out.write("                ");

                    int guestCount = 0;
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
                
      out.write("\r\n");
      out.write("                <div class=\"w3-quarter\">\r\n");
      out.write("                    <div class=\"w3-container w3-blue w3-padding-16\">\r\n");
      out.write("                        <div class=\"w3-left\"><i class=\"fa fa-ticket w3-xxxlarge\"></i></div>\r\n");
      out.write("                        <div class=\"w3-right\">\r\n");
      out.write("                            <h3></h3>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"w3-clear\"></div>\r\n");
      out.write("                        <h4>Pending Tickets</h4>\r\n");
      out.write("                    </div>  \r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"w3-quarter\">\r\n");
      out.write("                    <div class=\"w3-container w3-green w3-padding-16\">\r\n");
      out.write("                        <div class=\"w3-left\"><i class=\"fa fa-check w3-xxxlarge\"></i></div>\r\n");
      out.write("                        <div class=\"w3-right\">\r\n");
      out.write("                            <h3>99</h3>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"w3-clear\"></div>\r\n");
      out.write("                        <h4>Tickets Resolved</h4>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"w3-quarter\">\r\n");
      out.write("                    <div class=\"w3-container w3-pink w3-padding-16\">\r\n");
      out.write("                        <div class=\"w3-left\"><i class=\"fa fa-angle-double-up w3-xxxlarge\"></i></div>\r\n");
      out.write("                        <div class=\"w3-right\">\r\n");
      out.write("                            <h3>25</h3>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"w3-clear\"></div>\r\n");
      out.write("                        <h4>Escalated</h4>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"w3-quarter\">\r\n");
      out.write("                    <div class=\"w3-container w3-purple w3-text-white w3-padding-16\">\r\n");
      out.write("                        <div class=\"w3-left\"><i class=\"fa fa-users w3-xxxlarge\"></i></div>\r\n");
      out.write("                        <div class=\"w3-right\">\r\n");
      out.write("                            <h3>");

                                out.println(guestCount);
                                
      out.write("</h3>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"w3-clear\"></div>\r\n");
      out.write("                        <h4>Guests</h4>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <hr>\r\n");
      out.write("            <div class=\"w3-container\">\r\n");
      out.write("                <h5>General Stats</h5>\r\n");
      out.write("                <p>New Tickets Today</p>\r\n");
      out.write("                <div class=\"w3-grey\">\r\n");
      out.write("                    <div class=\"w3-container w3-center w3-padding w3-blue\" style=\"width:70%\">+70%</div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <p>Tickets Resolved to Escalation Ratio</p>\r\n");
      out.write("                <div class=\"w3-grey\">\r\n");
      out.write("                    <div class=\"w3-container w3-center w3-padding w3-green\" style=\"width:90%\">90%</div>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

                    float occRatio = 0;
                    occRatio = (guestCount / (float) 20) * 100;
                    String formattedOcc = String.format("%.0f", occRatio) + "%";
                
      out.write("\r\n");
      out.write("                <p>Tickets Resolved to Escalation Ratio</p>\r\n");
      out.write("                <div class=\"w3-grey\">\r\n");
      out.write("                    <div class=\"w3-container w3-center w3-padding w3-purple\" style=\"width:");
out.println(formattedOcc);
      out.write('"');
      out.write('>');
out.println(formattedOcc);
      out.write("</div>\r\n");
      out.write("                </div>\r\n");
      out.write("                         <p>Complaint Rate</p>\r\n");
      out.write("                         <div class=\"w3-grey\">\r\n");
      out.write("                         <div class=\"w3-container w3-center w3-padding w3-pink\" style=\"width:15%\">10%</div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <hr>\r\n");
      out.write("\r\n");
      out.write("                <!-- Footer -->\r\n");
      out.write("                <footer class=\"w3-container w3-padding-16 w3-light-grey\">\r\n");
      out.write("                    <h4>FOOTER</h4>\r\n");
      out.write("                    <p>Powered by <a href=\"https://www.w3schools.com/w3css/default.asp\" target=\"_blank\">w3.css</a></p>\r\n");
      out.write("                </footer>\r\n");
      out.write("\r\n");
      out.write("                <!-- End page content -->\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <script>\r\n");
      out.write("                // Get the Sidebar\r\n");
      out.write("                var mySidebar = document.getElementById(\"mySidebar\");\r\n");
      out.write("\r\n");
      out.write("                // Get the DIV with overlay effect\r\n");
      out.write("                var overlayBg = document.getElementById(\"myOverlay\");\r\n");
      out.write("\r\n");
      out.write("                // Toggle between showing and hiding the sidebar, and add overlay effect\r\n");
      out.write("                function w3_open() {\r\n");
      out.write("                    if (mySidebar.style.display === 'block') {\r\n");
      out.write("                        mySidebar.style.display = 'none';\r\n");
      out.write("                        overlayBg.style.display = \"none\";\r\n");
      out.write("                    } else {\r\n");
      out.write("                        mySidebar.style.display = 'block';\r\n");
      out.write("                        overlayBg.style.display = \"block\";\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("\r\n");
      out.write("                // Close the sidebar with the close button\r\n");
      out.write("                function w3_close() {\r\n");
      out.write("                    mySidebar.style.display = \"none\";\r\n");
      out.write("                    overlayBg.style.display = \"none\";\r\n");
      out.write("                }\r\n");
      out.write("            </script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
