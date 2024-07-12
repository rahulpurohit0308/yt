package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.Cookie;

public final class navbar_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String email=null;
    String code=null;
    int flag=0;
    try{
        Cookie c[]=request.getCookies();
        for(int i=0; i<c.length; i++){
            if(c[i].getName().equals("login")){
                email = c[i].getValue();
                break;
            }
        }
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
            Statement st=cn.createStatement();
            Statement st1=cn.createStatement();
            ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
            if(rs.next()){
                code=rs.getString("code");
            }
            ResultSet rs5 = st1.executeQuery("select * from users where code='"+code+"'");
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
      out.write("            $(document).ready(function(){\n");
      out.write("               var email = \"");
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
      out.write("                        data=data.trim();\n");
      out.write("                        if(data==\"Success\"){\n");
      out.write("                            $(\"#selectvideo\").modal();\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("                })\n");
      out.write("            });\n");
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
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-dark bg-dark fixed-top\">\n");
      out.write("            <i class=\"fa fa-navicon text-light menu-btn\"></i>\n");
      out.write("            <a class=\"navbar-brand\" href=\"index.jsp\"><i class=\"fa fa-youtube-play text-danger mx-2\"></i>YT</a>\n");
      out.write("            <form class=\"form-inline mx-auto\">\n");
      out.write("                <input class=\"form-control bg-dark text-light\" id=\"searchbox\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n");
      out.write("                <button class=\"btn bg-light text-dark\" id=\"searchbutton\" type=\"submit\"><i class=\"fa fa-search\"></i></button>\n");
      out.write("            </form>\n");
      out.write("            <i class=\"fa fa-upload text-light mx-2 upload\"></i>\n");
      out.write("            <i class=\"fa fa-bell text-light mx-2 notification\"></i>\n");

                if(email!=null){

      out.write("\n");
      out.write("            <a href=\"#\" class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\"><img src=\"userimages/");
      out.print(rs.getString("code"));
      out.write(".jpg\" style=\"height:30px;width:30px\" class=\"rounded-circle\"></a>\n");
      out.write("            <div class=\"dropdown-menu\" id=\"dropdown-menu-right\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                <a class=\"dropdown-item\" href=\"channel.jsp?id=");
      out.print(code);
      out.write("\"> Your Channel</a>\n");
      out.write("                <a class=\"dropdown-item\" href=\"edit.jsp?id=");
      out.print(email);
      out.write("\">Edit Profile</a>\n");
      out.write("                <div class=\"dropdown-divider\"></div>\n");
      out.write("                <div class=\"dropdown-item signout\" style=\"cursor: pointer\">Sign Out</div>\n");
      out.write("            </div>\n");

                } else{

      out.write("\n");
      out.write("            <button class=\"btn btn-primary ml-2 signin\">Sign In</button>\n");

                }

      out.write("\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"modal\" id=\"login\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h4 class=\"modal-title\">Login</h4>\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" style=\"color:black\">&times;</button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <div id=\"lg_msg\"></div>\n");
      out.write("                        <label>Email</label>\n");
      out.write("                        <input type=\"text\" id=\"email\" class=\"form-control\"><br>\n");
      out.write("                        <label>Password</label>\n");
      out.write("                        <input type=\"password\" id=\"pass\" class=\"form-control\"><br>\n");
      out.write("                        <button class=\"btn btn-danger\" id=\"submit\" data-dismiss=\"modal\">Login</button><br>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-footer\">\n");
      out.write("                        <span>Don't have an account <i style=\"color:red;cursor:pointer\" id=\"sg\" data-dismiss=\"modal\" >Sign Up</i></span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"modal\" id=\"notification\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h4 class=\"modal-title\">Notifications</h4>\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" style=\"color:black\">&times;</button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <label>Notification 1</label><br>\n");
      out.write("                        <label>Notification 2</label><br>\n");
      out.write("                        <label>Notification 3</label><br>\n");
      out.write("                        <label>Notification 4</label>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"modal\" id=\"uploadvideo\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\" style=\"width:80%;\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h4 class=\"modal-title\">Upload Video</h4>\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" style=\"color:black\">&times;</button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <label for=\"example-datetime-local-input\" class=\"col-form-label\">Video Name : </label>\n");
      out.write("                        <input class=\"form-control\" type=\"Text\" name=\"title\" id=\"vidtitle\">\n");
      out.write("                        <label for=\"example-datetime-local-input\" class=\"col-form-label\">Video Description : </label>\n");
      out.write("                        <textarea class=\"form-control\" type=\"Text\" name=\"descrip\" id=\"viddescrip\"></textarea>\n");
      out.write("                        <label for=\"example-datetime-local-input select\" class=\"col-form-label\">Video Category : </label><br>\n");
      out.write("                        <select class=\"form-control\" name=\"category\" id=\"selectcat\">\n");
      out.write("                            <option>Select Category</option>\n");

    ResultSet rs1=st.executeQuery("select * from category");
    while(rs1.next()){

      out.write("\n");
      out.write("                            <option  value =\"");
      out.print(rs1.getString("category"));
      out.write('"');
      out.write('>');
      out.print(rs1.getString("category"));
      out.write("</option>\n");

    }

      out.write("\n");
      out.write("                            <option  value=\"other\">Other</option>\n");
      out.write("                        </select><br>\n");
      out.write("                        <div class=\"mb-3\" id=\"other-textfield\" style=\"display:none\">\n");
      out.write("                            <label>Please Specify Category :</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"other\" name=\"other\">\n");
      out.write("                        </div>\n");
      out.write("                        <input type=\"submit\" class=\"btn btn-primary selvideo mb-5\" data-dismiss=\"modal\" value=\"Select Video\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"modal\" id=\"selectvideo\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h4 class=\"modal-title\">Select Video</h4>\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" style=\"color:black\">&times;</button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <form method=\"post\" ACTION=\"add_video.jsp?id=");
      out.print(code);
      out.write("\" name=\"uploadForm\" ENCTYPE='multipart/form-data'>\n");
      out.write("                            <label>Add Video</label>\n");
      out.write("                            <input type=\"file\" name=\"uploadFile\" size=\"40\">\n");
      out.write("                            <input type=\"submit\" class=\"btn btn-primary mt-3\" name=\"Submit\" value=\"Submit\">\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

        }
        catch(Exception e){
            out.print(e.getMessage());
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
