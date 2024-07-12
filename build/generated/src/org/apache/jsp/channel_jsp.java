package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.Cookie;
import java.io.*;

public final class channel_jsp extends org.apache.jasper.runtime.HttpJspBase
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
        String code=request.getParameter("id");

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
      out.write("            $(document).ready(function() {\n");
      out.write("                $('#home').click(function(){\n");
      out.write("                    showSection('home');\n");
      out.write("                });\n");
      out.write("                $('#videos').click(function(){\n");
      out.write("                    showSection('videos');\n");
      out.write("                });\n");
      out.write("                $('#playlists').click(function(){\n");
      out.write("                    showSection('playlists');\n");
      out.write("                });\n");
      out.write("                $('#about').click(function(){\n");
      out.write("                    showSection('about');\n");
      out.write("                });\n");
      out.write("                showSection('home');\n");
      out.write("                function showSection(section){\n");
      out.write("                    $('.home-section, .videos-section, .playlists-section, .about-section').hide();\n");
      out.write("                    $('.'+section+'-section').show();\n");
      out.write("                    $('.optionn').removeClass('activee');\n");
      out.write("                    $('#'+section).addClass('activee');\n");
      out.write("                }\n");
      out.write("              });\n");
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
      out.write("            <div class=\"mainarea\">\n");
      out.write("                    <div class=\"row py-3 bg-secondary\">\n");
      out.write("                        <div class=\"ml-5 my-auto\">\n");
      out.write("                            <img src=\"userimages/");
      out.print(code);
      out.write(".jpg\" style=\"height: 150px;width: 150px\" class=\"rounded-circle mx-auto\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-8\">\n");
      out.write("                            <h1 class=\"text-light mt-1\"><i>Yuvraj Singh</i></h1><br>\n");
      out.write("                            <h5 class=\"text-light\">@Yuvraj Singh | 38 Subscribers | 55 Videos</h5><br>\n");
      out.write("                            <h6 class=\"text-light\">Convey meaning through color with a handful of color utility classes. Includes support for styling links with hover states, too.</h6>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"row bg-dark\">\n");
      out.write("                        <h4 class=\"ml-5 optionn p-2\" id=\"home\">Home</h4>\n");
      out.write("                        <h4 class=\"ml-3 optionn p-2\" id=\"videos\">Videos</h4>\n");
      out.write("                        <h4 class=\"ml-3 optionn p-2\" id=\"playlists\">Playlists</h4>\n");
      out.write("                        <h4 class=\"ml-3 optionn p-2\" id=\"about\">About</h4>\n");
      out.write("                    </div>\n");
      out.write("                        <div class=\"home-section\">\n");
      out.write("                            <div class=\"mt-2\">\n");
      out.write("                                <div class=\"row ml-3\">\n");
      out.write("                                    <h2><u>Latest Video</u></h2>\n");
      out.write("                                </div><br>\n");

                            ResultSet rs=st.executeQuery("select * from video where user_code='"+code+"' limit 1");
                            while(rs.next()){

      out.write("\n");
      out.write("                                    <div class=\"row ml-3\">\n");
      out.write("                                        <div class=\"video-item\">\n");
      out.write("                                            <a class=\"text-dark\" href=\"video.jsp?id=");
      out.print(rs.getString("code"));
      out.write("\">\n");
      out.write("                                                <video class=\"vid mx-auto\" style=\"max-width:250px;\">\n");
      out.write("                                                        <source src=\"video/");
      out.print(rs.getString("code"));
      out.write(".mp4\" type=\"video/mp4\" controls muted>\n");
      out.write("                                                </video>\n");
      out.write("                                            </a>\n");
      out.write("                                        </div>\n");
      out.write("                                                <div class=\"ml-4\"></div>\n");
      out.write("                                        <div class=\"text-left\">\n");
      out.write("                                            <a class=\"text-dark\" href=\"video.jsp?id=");
      out.print(rs.getString("code"));
      out.write("\"><h3>");
      out.print(rs.getString("title"));
      out.write("</h3></a>\n");
      out.write("                                            <a href=\"channel.jsp?id=");
      out.print(rs.getString("user_code"));
      out.write("\"><p>Hello</p></a>\n");
      out.write("                                            <p>");
      out.print(rs.getString("dt"));
      out.write("</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");

                            }

      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"videos-section\" style=\"display: none;\">\n");
      out.write("                            <div class=\"mt-2\">\n");
      out.write("                                <div class=\"row ml-2\">\n");

                            ResultSet rs1=st.executeQuery("select * from video where user_code='"+code+"'");
                            while(rs1.next()){

      out.write("\n");
      out.write("                                    <div class=\"col-3\">\n");
      out.write("                                        <div class=\"video-item text-center\">\n");
      out.write("                                            <a class=\"text-dark\" href=\"video.jsp?id=");
      out.print(rs1.getString("code"));
      out.write("\">\n");
      out.write("                                                <video class=\"vid mx-auto\" style=\"max-width:300px; border-radius: 20px;\">\n");
      out.write("                                                        <source src=\"video/");
      out.print(rs1.getString("code"));
      out.write(".mp4\" type=\"video/mp4\" controls muted>\n");
      out.write("                                                </video>\n");
      out.write("                                            </a>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"text-center mt-1\">\n");
      out.write("                                            <a class=\"text-dark\" href=\"video.jsp?id=");
      out.print(rs1.getString("code"));
      out.write("\"><h3>");
      out.print(rs1.getString("title"));
      out.write("</h3></a>\n");
      out.write("                                            <p>");
      out.print(rs1.getString("dt"));
      out.write("</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");

                            }

      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"playlists-section\" style=\"display: none;\">\n");
      out.write("                            <div class=\"text-center mt-2\">\n");
      out.write("                                <h2><u>Playlists</u></h2><br>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"about-section\" style=\"display: none;\">\n");
      out.write("                            <div class=\"text-center mt-2\">\n");
      out.write("                                <h2><u>Description</u></h2><br>\n");

                            ResultSet rs2=st.executeQuery("select * from channel where usercode='"+code+"'");
                            while(rs2.next()){

      out.write("\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"col-2\"></div>\n");
      out.write("                                    <div class=\" col-8 mt-2 text-center\">\n");
      out.write("                                        <h6>");
      out.print(rs2.getString("description"));
      out.write("</h6>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");

                            }

      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                  </div>\n");
      out.write("            </div>\n");
      out.write("        </body>\n");
      out.write("    </html>\n");

                    cn.close();
            }
            catch(Exception e){
                out.println(e.getMessage());
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
