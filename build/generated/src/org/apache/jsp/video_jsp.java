package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.Cookie;
import java.io.*;

public final class video_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String code = request.getParameter("id");
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
      out.write("        <link rel=\"stylesheet\" href=\"video_style.css\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"jquery-3.6.4.min.js\"></script>\n");
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
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-8 col-xl-8 col-12\">\n");
      out.write("                        <video controls><source src=\"video/");
      out.print(code);
      out.write(".mp4\" type=\"video/mp4\"></video>\n");

        ResultSet rs4 = st.executeQuery("select * from video where code='"+code+"'");
        while(rs4.next()){
            String usercode1 = rs4.getString("user_code");
            ResultSet rs5 = st1.executeQuery("select * from users where code='"+usercode1+"'");
            while(rs5.next()){

      out.write("\n");
      out.write("                        <h4 class=\"ml-2\" style=\"font-family: Arial\">");
      out.print(rs4.getString("title"));
      out.write("</h4>\n");
      out.write("                        <p class=\"ml-2\" style=\"font-size:14px\">");
      out.print(rs4.getString("dt"));
      out.write("</p>\n");
      out.write("                        <div class=\"d-flex justify-content-between align-items-center\">\n");
      out.write("                            <div class=\"text-left\">\n");
      out.write("                                <a href=\"channel.jsp?id=");
      out.print(usercode1);
      out.write("\" style=\"display: inline;\"><img src=\"userimages/");
      out.print(rs5.getString("code"));
      out.write(".jpg\" style=\"height:50px;width:50px\" class=\"rounded-circle\"></a>\n");
      out.write("                                <p style=\"font-size:20px; display: inline;\" class=\"ml-2\">");
      out.print(rs5.getString("name"));
      out.write("</p>\n");
      out.write("                                <button class=\"btn btn-danger d-none ml-2\" style=\"height: 40px\">Subscribe</button>\n");
      out.write("                                <button class=\"btn btn-light ml-2\" style=\"height: 40px\">Subscribed</button>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <button class=\"like-button\"><i class=\"fa fa-thumbs-up\"></i></button>\n");
      out.write("                                <button class=\"dislike-button\"><i class=\"fa fa-thumbs-down\"></i></button>\n");
      out.write("                                <button class=\"watchlater-button ml-2\"><i class=\"fa fa-clock-o\"></i></button>                                \n");
      out.write("                                <button class=\"playlist-button ml-2\"><i class=\"fa fa-plus\"></i></button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");

        }
    }

      out.write("\n");
      out.write("                        <div class=\"ml-1 mt-3 p-1\" style=\"background-color: silver; border-radius: 5px\">\n");
      out.write("                            <h5>116 views</h5>\n");
      out.write("                            <p>Description is too longggggggggggggggggg.</p>\n");
      out.write("                        </div>\n");
      out.write("                        <h3 class=\"ml-2 mt-2\" style=\"font-family: Arial\"><u>Comments</u></h3>\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <img src=\"userimages/unnamed.jpg\" style=\"height:40px;width:40px\" class=\"rounded-circle ml-5 mt-2\">\n");
      out.write("                            <input class=\"form-control ml-3 mt-2\" style=\"width:60%\" placeholder=\"Add comment...\">\n");
      out.write("                            <button class=\"btn btn-secondary text-light ml-3\">Cancel</button>\n");
      out.write("                            <button class=\"btn btn-primary text-dark ml-2\" style=\"font-size:400\">Comment</button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-4 col-xl-4 col-12 mt-2\">\n");

        ResultSet rs2 = st.executeQuery("select * from video where code <> '"+code+"' order by RAND()");
        while(rs2.next()){
        String usercode2 = rs2.getString("user_code");
        String title = rs2.getString("title");
        String dt = rs2.getString("dt");

      out.write("\n");
      out.write("                            <div class=\"row ml-lg-0 ml-xl-0 ml-4\">\n");
      out.write("                                <a class=\"text-dark\" href=\"video.jsp?id=");
      out.print(rs2.getString("code"));
      out.write("\">\n");
      out.write("                                    <video style=\"height:90px;width:160px;border-radius: 4px\">\n");
      out.write("                                            <source src=\"video/");
      out.print(rs2.getString("code"));
      out.write(".mp4\" type=\"video/mp4\" controls muted>\n");
      out.write("                                    </video>\n");
      out.write("                                </a>\n");
      out.write("                                <div class=\"ml-2\">\n");

            ResultSet rs3 = st1.executeQuery("select * from users where code ='"+ usercode2 +"'");
            while(rs3.next()){

      out.write("\n");
      out.write("                                    <a class=\"text-dark\" href=\"video.jsp?id=");
      out.print(rs2.getString("code"));
      out.write("\"><h6>");
      out.print(title);
      out.write("</h6></a>\n");
      out.write("                                    <a href=\"channel.jsp?id=");
      out.print(usercode2);
      out.write("\"><p>");
      out.print(rs3.getString("name"));
      out.write("</p></a>\n");
      out.write("                                    <p>");
      out.print(dt);
      out.write("</p>\n");

            }

      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");

    }

      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

        }
        catch(Exception e){
            out.println(e.getMessage());
        }

      out.write('\n');
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
