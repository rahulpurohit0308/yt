package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.Cookie;
import java.io.*;

public final class playlist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
                Cookie c[]=request.getCookies();
                String email=null;
                for(int i=0; i<c.length; i++){
                    if(c[i].getName().equals("login")){
                        email = c[i].getValue();
                        break;
                    }
                }
                if(email==null){
                    response.sendRedirect("index.jsp");
                }
                else{
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
                    Statement st=cn.createStatement();
                    String code=request.getParameter("id");
                    ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
                    if(rs.next()){
                        String user_code=rs.getString("code");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function() {\n");
      out.write("                $('#select').change(function(){\n");
      out.write("                  if($('#select option:selected').val() === 'other') {\n");
      out.write("                    $('#other-playlist').show();\n");
      out.write("                  } else {\n");
      out.write("                    $('#other-playlist').hide();\n");
      out.write("                  }\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-dark\">\n");
      out.write("        <div class=\"container bg-light rounded mt-5\">\n");
      out.write("            <div class=\"row col-sm-11 mx-auto\">\n");
      out.write("                <h4 class=\"mr-auto mt-4\">Select Playlist</h4>\n");
      out.write("                <a href=\"video.jsp?id=");
      out.print(code);
      out.write("\"><i class=\"fa fa-times text-dark mt-4\"></i></a>\n");
      out.write("            </div><hr><br><br>\n");
      out.write("            <div class=\"row col-sm-9 mx-auto\">\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <form method=\"post\" action=\"addtoplaylist.jsp?id=");
      out.print(code);
      out.write("&&code=");
      out.print(rs.getString("code"));
      out.write("\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"example-datetime-local-input select\" class=\"col-form-label\">Playlist : </label><br>\n");
      out.write("                            <select class=\"form-control\" name=\"playlist\" id=\"select\">\n");
      out.write("                                <option>Select Playlist</option>\n");

            ResultSet rs2=st.executeQuery("select * from playlist where user_code='"+user_code+"'");
            while(rs2.next()){

      out.write("\n");
      out.write("                                    <option  value =\"");
      out.print(rs2.getString("playlist"));
      out.write('"');
      out.write('>');
      out.print(rs2.getString("playlist"));
      out.write("</option>\n");

    }

      out.write(" \n");
      out.write("                                    <option  value=\"other\">Create Other Playlist...</option>\n");
      out.write("                            </select><br>\n");
      out.write("                            <div id=\"other-playlist\" style=\"display: none\">\n");
      out.write("                                <label for=\"other\">Name Playlist :</label>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" id=\"other\" name=\"other\">\n");
      out.write("                                <input type=\"\"\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                            <input type=\"submit\" class=\"btn btn-primary mb-5\" style=\"margin-left: 330px; margin-top: 35px\" value=\"Add to Playlist\">\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

                    }
                }
                    catch(Exception e){
                        e.getMessage();
                    }
                }
    }
    catch(Exception er){
        er.getMessage();
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
