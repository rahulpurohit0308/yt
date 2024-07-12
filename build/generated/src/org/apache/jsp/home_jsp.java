package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.Cookie;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
            try{
            String video_code=null;
            String code=null;
            int flag=0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
            Statement st=cn.createStatement();
            Statement st1=cn.createStatement();
            ResultSet rs4 = st.executeQuery("select * from users where email='"+email+"'");
            while(rs4.next()){
                code = rs4.getString("code");
            }
            ResultSet rs5 = st1.executeQuery("select * from channel where usercode='"+code+"'");
            if(rs5.next()){
                flag = 1;
            }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function() {\n");
      out.write("                var email = \"");
      out.print(email);
      out.write("\";\n");
      out.write("                var flag = \"");
      out.print(flag);
      out.write("\" ;\n");
      out.write("                var code = \"");
      out.print(code);
      out.write("\";\n");
      out.write("                if(email==\"null\"){\n");
      out.write("                    $(\".navbar\").css(\"padding\",\"10px\");\n");
      out.write("                }\n");
      out.write("                $('.menu-btn').click(function() {\n");
      out.write("                  $('.sidebar').toggleClass('active');\n");
      out.write("                  $('.mainarea').toggleClass('active');\n");
      out.write("                  $('#sbarmenu2').toggleClass('d-none');\n");
      out.write("                  $('#sbarmenu3').toggleClass('d-none');\n");
      out.write("                });\n");
      out.write("                $(\".signin\").click(function(){\n");
      out.write("                    $(\"#login\").modal();\n");
      out.write("                });\n");
      out.write("                $(\".notification\").click(function(){\n");
      out.write("                    if(email===\"null\"){\n");
      out.write("                        $(\"#login\").modal();\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        $(\"#notification\").modal();\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("                $(\"#submit\").click(function(){\n");
      out.write("                    var email = $(\"#email\").val();\n");
      out.write("                    var pass = $(\"#pass\").val();\n");
      out.write("                    $.post(\"check.jsp\",{email:email,pass:pass},function(data){\n");
      out.write("                        data=data.trim();\n");
      out.write("                        if(data==\"Success\"){\n");
      out.write("                            location.reload();\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("                });\n");
      out.write("                $(\".signout\").click(function(){\n");
      out.write("                    $.post(\"signout.jsp\",{id:email},function(data){\n");
      out.write("                        data=data.trim();\n");
      out.write("                        if(data==\"Success\"){\n");
      out.write("                            location.reload();\n");
      out.write("                        }\n");
      out.write("                    })\n");
      out.write("                })\n");
      out.write("                $(\".upload\").click(function(){\n");
      out.write("                    if(email==\"null\"){\n");
      out.write("                        $(\"#login\").modal();\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        if(flag==\"0\"){\n");
      out.write("                            $(\"#makechannel\").modal();\n");
      out.write("                        }\n");
      out.write("                        else{\n");
      out.write("                            $(\"#uploadvideo\").modal();\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("                $('#selectcat').change(function(){\n");
      out.write("                  if($('#selectcat option:selected').val() === 'other') {\n");
      out.write("                    $('#other-textfield').show();\n");
      out.write("                  } else {\n");
      out.write("                    $('#other-textfield').hide();\n");
      out.write("                  }\n");
      out.write("                });\n");
      out.write("                $(\".selvideo\").click(function(){\n");
      out.write("                    var title = $(\"#vidtitle\").val();\n");
      out.write("                    var descrip = $(\"#viddescrip\").val();\n");
      out.write("                    var category = $(\"#selectcat\").val();\n");
      out.write("                    var categori = $(\"#other\").val();\n");
      out.write("                    $.post(\"addvideo.jsp\",{id:code,title:title,descrip:descrip,category:category,categori:categori},function(data){\n");
      out.write("                        $(\"#selectvideo\").modal();\n");
      out.write("                    });\n");
      out.write("                })\n");
      out.write("              });\n");
      out.write("        </script>\n");
      out.write("        <style>\n");
      out.write("            @media only screen and (max-width:1200px){\n");
      out.write("                .sboption{\n");
      out.write("                    display: none;\n");
      out.write("                }\n");
      out.write("                .menu-btn{\n");
      out.write("                    display: none;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
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
      out.write("            <div class=\"modal\" id=\"login\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h4 class=\"modal-title\">Login</h4>\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" style=\"color:black\">&times;</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <div id=\"lg_msg\"></div>\n");
      out.write("                            <label>Email</label>\n");
      out.write("                            <input type=\"text\" id=\"email\" class=\"form-control\"><br>\n");
      out.write("                            <label>Password</label>\n");
      out.write("                            <input type=\"password\" id=\"pass\" class=\"form-control\"><br>\n");
      out.write("                            <button class=\"btn btn-danger\" id=\"submit\" data-dismiss=\"modal\">Login</button><br>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <span>Don't have an account <i style=\"color:red;cursor:pointer\" id=\"sg\" data-dismiss=\"modal\" >Sign Up</i></span>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal\" id=\"notification\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h4 class=\"modal-title\">Notifications</h4>\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" style=\"color:black\">&times;</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <label>Notification 1</label><br>\n");
      out.write("                            <label>Notification 2</label><br>\n");
      out.write("                            <label>Notification 3</label><br>\n");
      out.write("                            <label>Notification 4</label>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal\" id=\"uploadvideo\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h4 class=\"modal-title\">Upload Video</h4>\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" style=\"color:black\">&times;</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <label for=\"example-datetime-local-input\" class=\"col-form-label\">Video Name : </label>\n");
      out.write("                            <input class=\"form-control\" type=\"Text\" name=\"title\" id=\"vidtitle\">\n");
      out.write("                            <label for=\"example-datetime-local-input\" class=\"col-form-label\">Video Description : </label>\n");
      out.write("                            <input class=\"form-control\" type=\"Text\" name=\"descrip\" id=\"viddescrip\">\n");
      out.write("                            <label for=\"example-datetime-local-input select\" class=\"col-form-label\">Video Category : </label><br>\n");
      out.write("                            <select class=\"form-control\" name=\"category\" id=\"selectcat\">\n");
      out.write("                                <option>Select Category</option>\n");

    ResultSet rs6=st.executeQuery("select * from category");
    while(rs6.next()){

      out.write("\n");
      out.write("                                    <option  value =\"");
      out.print(rs6.getString("category"));
      out.write('"');
      out.write('>');
      out.print(rs6.getString("category"));
      out.write("</option>\n");

    }

      out.write("\n");
      out.write("                                    <option  value=\"other\">Other</option>\n");
      out.write("                            </select><br>\n");
      out.write("                            <div class=\"mb-3\" id=\"other-textfield\" style=\"display:none\">\n");
      out.write("                                <label>Please Specify Category :</label>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" id=\"other\" name=\"other\">\n");
      out.write("                            </div>\n");
      out.write("                            <input type=\"submit\" class=\"btn btn-primary selvideo mb-5\" data-dismiss=\"modal\" value=\"Select Video\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal\" id=\"selectvideo\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h4 class=\"modal-title\">Select Video</h4>\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" style=\"color:black\">&times;</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <form method=\"post\" ACTION=\"add_video.jsp?id=");
      out.print(video_code);
      out.write("\" name=\"uploadForm\" ENCTYPE='multipart/form-data'>\n");
      out.write("                                <label>Add Video</label>\n");
      out.write("                                <input type=\"file\" name=\"uploadFile\" size=\"40\">\n");
      out.write("                                <input type=\"submit\" class=\"btn btn-primary mt-3\" name=\"Submit\" value=\"Submit\">\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"mainarea mt-2\">\n");
      out.write("                <div class=\"row\">\n");

    ResultSet rs2 = st.executeQuery("select * from video ORDER BY RAND()");
    while(rs2.next()){
        String usercode = rs2.getString("user_code");

      out.write("\n");
      out.write("                    <div class=\"col-sm-6 col-md-6 col-lg-4 col-xl-3\">\n");
      out.write("                        <div class=\"video-item\">\n");
      out.write("                            <a href=\"video.jsp?id=");
      out.print(rs2.getString("code"));
      out.write("\">\n");
      out.write("                                <video style=\"border-radius: 5px;\">\n");
      out.write("                                    <source src=\"video/");
      out.print(rs2.getString("code"));
      out.write(".mp4\" type=\"video/mp4\" controls autoplay>\n");
      out.write("                                </video>\n");
      out.write("                            </a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <a href=\"channel.jsp?id=");
      out.print(rs2.getString("user_code"));
      out.write("\" class=\"mx-3\"><img src=\"userimages/");
      out.print(usercode);
      out.write(".jpg\" style=\"height:30px;width:30px\" class=\"rounded-circle\"></a>\n");
      out.write("                            <a href=\"video.jsp?id=");
      out.print(rs2.getString("code"));
      out.write("\"><h5 class=\"text-dark text-center mb-3\">");
      out.print(rs2.getString("title"));
      out.write("</h5></a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row\" style=\"line-height:4px\">\n");

    ResultSet rs3 = st1.executeQuery("select * from users where code='"+usercode+"'");
    while(rs3.next()){

      out.write("\n");
      out.write("                            <a href=\"channel.jsp?id=");
      out.print(usercode);
      out.write("\"><p class=\"text-dark ml-3\"><u>");
      out.print(rs3.getString("name"));
      out.write("</u></p></a>\n");

    }

      out.write("\n");
      out.write("                            <p class=\"text-dark ml-3\">");
      out.print(rs2.getString("dt"));
      out.write("</p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");

    }

      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

                    cn.close();
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
        }
        catch(Exception er){
            out.print(er.getMessage());
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
