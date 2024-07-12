package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.Cookie;
import java.io.*;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
                    ResultSet rs=st.executeQuery("select * from admin where email='"+email+"'");
                    if(rs.next()){
    
        
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta name=\"viewport\" http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8; width=device-width; initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"adminstyle.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function() {\n");
      out.write("                $('.menu-btn').click(function() {\n");
      out.write("                  $('.sidebar').toggleClass('active');\n");
      out.write("                  $('.content').toggleClass('active');\n");
      out.write("                });\n");
      out.write("                $('#cat').click(function(){\n");
      out.write("                    showSection('cat');\n");
      out.write("                    $(\"#msg\").attr(\"class\",\"\");\n");
      out.write("                    $(\"#msg\").html(\"\");\n");
      out.write("                });\n");
      out.write("                $('#user').click(function(){\n");
      out.write("                    showSection('user');\n");
      out.write("                    $(\"#msg\").attr(\"class\",\"\");\n");
      out.write("                    $(\"#msg\").html(\"\");\n");
      out.write("                });\n");
      out.write("                $('#vid').click(function(){\n");
      out.write("                    showSection('vid');\n");
      out.write("                    $(\"#msg\").attr(\"class\",\"\");\n");
      out.write("                    $(\"#msg\").html(\"\");\n");
      out.write("                });\n");
      out.write("                showSection('cat');\n");
      out.write("                function showSection(section){\n");
      out.write("                    $('#catsection, #usersection, #vidsection').hide();\n");
      out.write("                    $('#'+section+'section').show();\n");
      out.write("                    $('.sbopt').removeClass('bg-white text-dark');\n");
      out.write("                    $('#'+section).addClass('bg-white text-dark');\n");
      out.write("                } \n");
      out.write("              });\n");
      out.write("              $(document).on(\"click\",\".btn-primary\",function(){\n");
      out.write("                var cat = $(\"#catt\").val();\n");
      out.write("                $.post(\n");
      out.write("                    \"insertcategory.jsp\",{cat:cat},function(data){\n");
      out.write("                        data=data.trim();\n");
      out.write("                        if(data==\"Success\"){\n");
      out.write("                            $(\".catform\").load(\"catform.jsp\");\n");
      out.write("                            $(\".cattable\").load(\"cattable.jsp\");\n");
      out.write("                            $(\"#msg\").attr(\"class\",\"alert alert-success\");\n");
      out.write("                            $(\"#msg\").html(\"Record Inserted\");\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("            });\n");
      out.write("            $(document).on(\"click\",\".delcat\",function(){\n");
      out.write("                var id = $(this).attr(\"rel\");\n");
      out.write("                $(\"#\"+id).fadeOut(1000);\n");
      out.write("                $.post(\n");
      out.write("                    \"deletecategory.jsp\",{id:id},function(data){\n");
      out.write("                        data=data.trim();\n");
      out.write("                        if(data==\"Success\"){\n");
      out.write("                            $(\"#msg\").attr(\"class\",\"alert alert-warning\");\n");
      out.write("                            $(\"#msg\").html(\"Record Deleted\");\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("            });\n");
      out.write("            var id=0;\n");
      out.write("            $(document).on(\"click\",\".editcat\",function(){\n");
      out.write("                id=$(this).attr(\"rel\");\n");
      out.write("                $(\"#msg\").attr(\"class\",\"\");\n");
      out.write("                $(\"#msg\").text(\"\");\n");
      out.write("                $.post(\n");
      out.write("                    \"editcategory.jsp\",{id:id},function(data){\n");
      out.write("                        $(\".catform\").html(data);\n");
      out.write("                        $(\"#catt\").focus();\n");
      out.write("                    });\n");
      out.write("            });\n");
      out.write("            $(document).on(\"click\",\".updatecat\",function(){\n");
      out.write("                var cat=$(\"#catt\").val();\n");
      out.write("                $.post(\n");
      out.write("                    \"updatecategory.jsp\",{id:id,cat:cat},function(data){\n");
      out.write("                        data=data.trim();\n");
      out.write("                        if(data==\"Success\"){\n");
      out.write("                            $(\"#msg\").attr(\"class\",\"alert alert-primary\");\n");
      out.write("                            $(\"#msg\").text(\"Record Updated\");\n");
      out.write("                            $(\".catform\").load(\"catform.jsp\");\n");
      out.write("                            $(\".cattable\").load(\"cattable.jsp\");\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("            });\n");
      out.write("            $(document).on(\"click\",\".blkuser\",function(){\n");
      out.write("                var id = $(this).attr(\"rel\");\n");
      out.write("                $.post(\n");
      out.write("                    \"blockuser.jsp\",{id:id},function(data){\n");
      out.write("                        data=data.trim();\n");
      out.write("                        if(data==0){\n");
      out.write("                            $(\"#msg\").attr(\"class\",\"alert alert-danger\");\n");
      out.write("                            $(\"#msg\").text(\"User Blocked\");\n");
      out.write("                        }\n");
      out.write("                        else if(data==1){\n");
      out.write("                            $(\"#msg\").attr(\"class\",\"alert alert-success\");\n");
      out.write("                            $(\"#msg\").text(\"User Unblocked\");\n");
      out.write("                        }\n");
      out.write("                        $(\"#usersection\").load(\"blocklist.jsp\");\n");
      out.write("                    }\n");
      out.write("                )\n");
      out.write("            })\n");
      out.write("            $(document).on(\"click\",\".deletevid\",function(){\n");
      out.write("                var id = $(this).attr(\"rel\");\n");
      out.write("                $(\"#\"+id).fadeOut(1000);\n");
      out.write("                $.post(\n");
      out.write("                    \"deletevideo.jsp\",{id:id},function(data){\n");
      out.write("                        data=data.trim();\n");
      out.write("                        if(data==\"Success\"){\n");
      out.write("                            $(\"#msg\").attr(\"class\",\"alert alert-warning\");\n");
      out.write("                            $(\"#msg\").html(\"Video Deleted\");\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("            });\n");
      out.write("            function toggleVisibility() {\n");
      out.write("                if ($(window).width() <= 715) {\n");
      out.write("                    $('.menu-btn').addClass('d-none');\n");
      out.write("                } else {\n");
      out.write("                    $('.menu-btn').removeClass('d-none');\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            toggleVisibility();\n");
      out.write("            $(window).resize(function(){\n");
      out.write("                toggleVisibility();\n");
      out.write("            });\n");
      out.write("            function sidebarVisibility() {\n");
      out.write("                if ($(window).width() <= 715) {\n");
      out.write("                    $('.sbopt2').addClass('d-none');\n");
      out.write("                } else {\n");
      out.write("                    $('.sbopt2').removeClass('d-none');\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            sidebarVisibility();\n");
      out.write("            $(window).resize(function(){\n");
      out.write("                sidebarVisibility();\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-dark bg-dark fixed-top\">\n");
      out.write("            <div class=\"d-flex justify-content-start\">\n");
      out.write("                <i class=\"fa fa-navicon text-light mr-3 menu-btn\"></i>\n");
      out.write("                <a class=\"navbar-brand\" href=\"dashboard.jsp\"><i class=\"fa fa-youtube-play text-danger mx-3\"></i>YT Administration</a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"d-flex justify-content-end\">\n");
      out.write("                <a class=\"navbar-brand\" href=\"logout.jsp?id=");
      out.print(email);
      out.write("\">Logout</a>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"container-fluid content\">\n");
      out.write("            <div class=\"sidebar bg-dark border-right\">\n");
      out.write("                <div class=\"sbarmenu\">\n");
      out.write("                    <div class=\"sbopt d-flex\" id=\"cat\"><div class=\"my-auto\"><i class=\"fa fa-th-list mx-4\"></i><div class=\"sbopt2\">Categories</div></div></div>  \n");
      out.write("                    <div class=\"sbopt d-flex\" id=\"user\"><div class=\"my-auto\"><i class=\"fa fa-users mx-4\"></i><div class=\"sbopt2\">Users</div></div></div>\n");
      out.write("                    <div class=\"sbopt d-flex\" id=\"vid\"><div class=\"my-auto\"><i class=\"fa fa-youtube-play mx-4\"></i><div class=\"sbopt2\">Videos</div></div></div>\n");
      out.write("                    <div class=\"sbopt d-flex\" id=\"cmnt\"><div class=\"my-auto\"><i class=\"fa fa-comments mx-4\"></i><div class=\"sbopt2\">Comments</div></div></div><hr>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"mainarea\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-2\"></div>\n");
      out.write("                    <div class=\"col-8\">\n");
      out.write("                        <div id=\"msg\"></div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-2\"></div>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"catsection\">\n");
      out.write("                    <div class=\"catform\">\n");
      out.write("                        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "catform.jsp", out, false);
      out.write(" \n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"cattable\">\n");
      out.write("                        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "cattable.jsp", out, false);
      out.write(" \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"usersection\">\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "blocklist.jsp", out, false);
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div id=\"vidsection\">\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "videos.jsp", out, false);
      out.write(" \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

                    }
                    else{
                        response.sendRedirect("index.jsp?invalid=1");
                    }
                    cn.close();
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
                }
            }
            catch(Exception er){
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
