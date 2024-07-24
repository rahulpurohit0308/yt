package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.Cookie;
import java.io.*;

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

      out.write('\n');

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        Statement st1=cn.createStatement();
        Statement st2=cn.createStatement();

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"jquery-3.6.4.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function(){\n");
      out.write("                $(\".catbtn\").click(function(){\n");
      out.write("                    var id = $(this).attr(\"rel\");\n");
      out.write("                    $(\".categories\").addClass(\"d-none\");\n");
      out.write("                    $(\"#\"+id).removeClass(\"d-none\");\n");
      out.write("                    $(\".catbtn\").removeClass(\"activecat\");\n");
      out.write("                    $(\".catbtn\"+id).addClass(\"activecat\");\n");
      out.write("                })\n");
      out.write("            })\n");
      out.write("        </script>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"container-fluid content\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "sidebar.jsp", out, false);
      out.write("\n");
      out.write("            <div class=\"mainarea mt-1\">\n");
      out.write("                <div class=\"row ml-2 pb-2\">\n");
      out.write("                    <button class=\"btn btn-secondary catbtn catbtnAll activecat mr-2 py-2\" style=\"border-radius: 18px;height: 40px\" rel=\"All\">All</button>\n");

    ResultSet rs4 = st.executeQuery("select * from category ORDER BY RAND() limit 9");
    while(rs4.next()){

      out.write("\n");
      out.write("                    <button class=\"btn btn-secondary catbtn catbtn");
      out.print(rs4.getString("code"));
      out.write(" mx-2\" style=\"border-radius: 18px;height: 40px\" rel=\"");
      out.print(rs4.getString("code"));
      out.write('"');
      out.write('>');
      out.print(rs4.getString("category"));
      out.write("</button>\n");

    }

      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"categories\" id=\"All\">\n");
      out.write("                    <div class=\"row\">\n");

    ResultSet rs2 = st.executeQuery("select * from video ORDER BY RAND()");
    while(rs2.next()){
        String usercode = rs2.getString("user_code");

      out.write("\n");
      out.write("                        <div class=\"col-sm-6 col-md-6 col-lg-4 col-xl-3\">\n");
      out.write("                            <div class=\"video-item\">\n");
      out.write("                                <a href=\"video.jsp?id=");
      out.print(rs2.getString("code"));
      out.write("\">\n");
      out.write("                                    <video style=\"border-radius: 5px;\">\n");
      out.write("                                        <source src=\"video/");
      out.print(rs2.getString("code"));
      out.write(".mp4\" type=\"video/mp4\" controls autoplay>\n");
      out.write("                                    </video>\n");
      out.write("                                </a>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <a href=\"channel.jsp?id=");
      out.print(rs2.getString("user_code"));
      out.write("\" class=\"mx-3\"><img src=\"userimages/");
      out.print(usercode);
      out.write(".jpg\" style=\"height:30px;width:30px\" class=\"rounded-circle\"></a>\n");
      out.write("                                <a href=\"video.jsp?id=");
      out.print(rs2.getString("code"));
      out.write("\"><h5 class=\"text-dark text-center mb-3\">");
      out.print(rs2.getString("title"));
      out.write("</h5></a>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\" style=\"line-height:4px\">\n");

        ResultSet rs3 = st1.executeQuery("select * from users where code='"+usercode+"'");
        while(rs3.next()){

      out.write("\n");
      out.write("                                <a href=\"channel.jsp?id=");
      out.print(usercode);
      out.write("\"><p class=\"text-dark ml-3\"><u>");
      out.print(rs3.getString("name"));
      out.write("</u></p></a>\n");

        }

      out.write("\n");
      out.write("                                <p class=\"text-dark ml-3\">");
      out.print(rs2.getString("dt"));
      out.write("</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");

    }

      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");

    ResultSet rs5 = st.executeQuery("select * from category");
    while(rs5.next()){

      out.write("\n");
      out.write("                <div class=\"categories d-none\" id=\"");
      out.print(rs5.getString("code"));
      out.write("\">\n");
      out.write("                    <div class=\"row\">\n");

        ResultSet rs6 = st1.executeQuery("select * from video where cat_code='"+rs5.getString("code")+"' ORDER BY RAND()");
        while(rs6.next()){
            String usercode1 = rs6.getString("user_code");

      out.write("\n");
      out.write("                        <div class=\"col-sm-6 col-md-6 col-lg-4 col-xl-3\">\n");
      out.write("                            <div class=\"video-item\">\n");
      out.write("                                <a href=\"video.jsp?id=");
      out.print(rs6.getString("code"));
      out.write("\">\n");
      out.write("                                    <video style=\"border-radius: 5px;\">\n");
      out.write("                                        <source src=\"video/");
      out.print(rs6.getString("code"));
      out.write(".mp4\" type=\"video/mp4\" controls autoplay>\n");
      out.write("                                    </video>\n");
      out.write("                                </a>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <a href=\"channel.jsp?id=");
      out.print(rs6.getString("user_code"));
      out.write("\" class=\"mx-3\"><img src=\"userimages/");
      out.print(usercode1);
      out.write(".jpg\" style=\"height:30px;width:30px\" class=\"rounded-circle\"></a>\n");
      out.write("                                <a href=\"video.jsp?id=");
      out.print(rs6.getString("code"));
      out.write("\"><h5 class=\"text-dark text-center mb-3\">");
      out.print(rs6.getString("title"));
      out.write("</h5></a>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\" style=\"line-height:4px\">\n");

            ResultSet rs7 = st2.executeQuery("select * from users where code='"+usercode1+"'");
            while(rs7.next()){

      out.write("\n");
      out.write("                                <a href=\"channel.jsp?id=");
      out.print(usercode1);
      out.write("\"><p class=\"text-dark ml-3\"><u>");
      out.print(rs7.getString("name"));
      out.write("</u></p></a>\n");

            }

      out.write("\n");
      out.write("                                <p class=\"text-dark ml-3\">");
      out.print(rs6.getString("dt"));
      out.write("</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");

        }

      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");

    }

      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

                cn.close();
        }
        catch(Exception e){
            response.sendRedirect("index.jsp");
        }

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
