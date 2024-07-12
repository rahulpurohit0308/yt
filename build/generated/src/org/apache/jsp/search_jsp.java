package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.Cookie;
import java.io.*;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
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
        String email=null;
        String code=null;
        String vidcode=null;
        String channelcode=null;
        String usercode=null;
        String dt=null;
        int subs=0;
        int videos=0;
        int views=0;
        int res=0;
        String search = request.getParameter("search");
        Cookie c[]=request.getCookies();
        for(int i=0; i<c.length; i++){
            if(c[i].getName().equals("login")){
                email = c[i].getValue();
                break;
            }
        }
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        Statement st1=cn.createStatement();
        Statement st2=cn.createStatement();
        ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
        if(rs.next()){
            code=rs.getString("code");
        }

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
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <script>\n");
      out.write("        $(document).ready(function(){\n");
      out.write("            $('.subscribebtn').click(function(){\n");
      out.write("                var subscount = $(\".subscount\").text();\n");
      out.write("                var usercode = $(this).data('usercode');\n");
      out.write("                if('");
      out.print(email);
      out.write("'=='null'){\n");
      out.write("                    $(\"#login\").modal();\n");
      out.write("                }\n");
      out.write("                else{\n");
      out.write("                    $.post(\"subscribe.jsp\",{code:'");
      out.print(code);
      out.write("',usercode:usercode});\n");
      out.write("                    var btntext = $(this).text();\n");
      out.write("                    if(btntext == \"Subscribe\"){\n");
      out.write("                        $(this).text(\"Subscribed\");\n");
      out.write("                        $(this).toggleClass('btn-danger btn-light');\n");
      out.write("                        $(this).text(Number(subscount)+1);\n");
      out.write("                    }\n");
      out.write("                    else {\n");
      out.write("                        $(this).text(\"Subscribe\");\n");
      out.write("                        $(this).toggleClass('btn-danger btn-light');\n");
      out.write("                        $(this).text(Number(subscount)-1);\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("        })\n");
      out.write("    </script>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"container-fluid content\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "sidebar.jsp", out, false);
      out.write("\n");
      out.write("            <div class=\"mainarea mt-2\">\n");

    ResultSet rs4 = st.executeQuery("select * from users where name like'%" + search + "%' and code<>'"+code+"'");
    while(rs4.next()){
        usercode = rs4.getString("code");

      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-xs-6 col-sm-6 col-md-4 col-lg-3 col-xl-3 text-center my-auto\">\n");
      out.write("                        <a href=\"channel.jsp?id=");
      out.print(usercode);
      out.write("\">\n");
      out.write("                            <img src=\"userimages/");
      out.print(usercode);
      out.write(".jpg\" style=\"height:120px;width: 120px\" class=\"rounded-circle\">\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-xs-4 col-sm-4 col-md-6 col-lg-6 col-xl-6\">\n");
      out.write("                        <a href=\"channel.jsp?id=");
      out.print(usercode);
      out.write("\"><h3 class=\"text-dark\">");
      out.print(rs4.getString("name"));
      out.write("</h3></a>\n");

    ResultSet rs5 = st1.executeQuery("select count(*) as p from subs where channel_code='"+usercode+"'");
    if(rs5.next()){
        subs=rs5.getInt("p");
    }

      out.write("\n");
      out.write("                        <p class=\"text-dark\" style=\"display:inline;font-size: 16px;font-weight: 600\"><u class='subscount'>");
      out.print(subs);
      out.write("</u> Subscribers</p>\n");
      out.write("                        <p class=\"text-dark\">");
      out.print(rs4.getString("des"));
      out.write("</p>\n");
      out.write("                    </div>\n");

        ResultSet rs10 = st1.executeQuery("select count(*) as p from subs where user_code='"+code+"' and channel_code='"+usercode+"'");
        if(rs10.next()){
            res = rs10.getInt("p");
        }
        if(res==0){

      out.write("\n");
      out.write("            <button class=\"btn btn-danger mr-3 mt-2 mx-auto subscribebtn\" id='");
      out.print(usercode);
      out.write("' style=\"height: 40px\">Subscribe</button>\n");

        }
        else{

      out.write("\n");
      out.write("            <button class=\"btn btn-light mr-3 mt-2 mx-auto subscribebtn\" id='");
      out.print(usercode);
      out.write("' style=\"height: 40px\">Subscribed</button>\n");

        }

      out.write("\n");
      out.write("                </div>\n");

    }

      out.write("\n");
      out.write("<hr class='my-4'>\n");
      out.write("                <div class=\"row\">\n");

    ResultSet rs2 = st.executeQuery("select * from video where title like'%" + search + "%'");
    while(rs2.next()){
        vidcode = rs2.getString("code");
        channelcode = rs2.getString("user_code");
        dt=rs2.getString("dt");

      out.write("\n");
      out.write("                    <div class=\"col-6 col-lg-4 col-xl-4 col-md-5 text-center ml-3 my-auto\">\n");
      out.write("                        <a href=\"video.jsp?id=");
      out.print(vidcode);
      out.write("\">\n");
      out.write("                            <video style=\"border-radius: 5px;\">\n");
      out.write("                                <source src=\"video/");
      out.print(vidcode);
      out.write(".mp4\" type=\"video/mp4\" controls autoplay>\n");
      out.write("                            </video>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-5\">\n");
      out.write("                        <a href=\"video.jsp?id=");
      out.print(code);
      out.write("\"><h5 class=\"text-dark mb-3\">");
      out.print(rs2.getString("title"));
      out.write("</h5></a>\n");
      out.write("                        <div class=\"row\">\n");

    ResultSet rs11 = st2.executeQuery("select * from views where vidcode='"+vidcode+"'");
    while(rs11.next()){

      out.write("\n");
      out.write("                                <p class=\"text-dark ml-3\">");
      out.print(rs11.getInt("views"));
      out.write(" views</p>\n");

    }

      out.write("\n");
      out.write("                                <p class=\"text-dark ml-3\" style=\"line-height:20px\">");
      out.print(dt);
      out.write("</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <a href=\"channel.jsp?id=");
      out.print(channelcode);
      out.write("\" class=\"ml-3 mr-2\"><img src=\"userimages/");
      out.print(channelcode);
      out.write(".jpg\" style=\"height:30px;width:30px\" class=\"rounded-circle\"></a>\n");

    ResultSet rs3 = st2.executeQuery("select * from users where code='"+channelcode+"'");
    while(rs3.next()){

      out.write("\n");
      out.write("                                <a href=\"channel.jsp?id=");
      out.print(channelcode);
      out.write("\"><p class=\"text-dark\"><u>");
      out.print(rs3.getString("name"));
      out.write("</u></p></a>\n");

    }

      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <p>");
      out.print(rs2.getString("descrip"));
      out.write("</p>\n");
      out.write("                        </div>\n");

    }

      out.write("\n");
      out.write("                </div><br>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

                cn.close();
        }
        catch(Exception e){
            out.print(e.getMessage());
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
