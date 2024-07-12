package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.Cookie;
import java.io.*;

public final class category_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"styles.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"col-8 col-md-5 col-lg-5 col-xl-5 mx-auto mt-5 card\">\n");
      out.write("                <form method=\"post\" action=\"insertcategory.jsp\" class=\"form-group p-3\">\n");
      out.write("                    <label for=\"example-datetime-local-input\" class=\"col-form-label\">Category Name : </label>\n");
      out.write("                    <input class=\"form-control\" type=\"Text\" name=\"category\" id=\"example-datetime-local-input\">\n");
      out.write("                    <input type=\"submit\" class=\"btn btn-primary m-2\" value=\"Add\">\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-8 col-md-5 col-lg-5 col-xl-5 mx-auto mt-5 card\">\n");
      out.write("                <h4 class=\"mx-auto my-3\"><u>Categories</u></h4>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <table class=\"table table-light table-striped table-hover\">\n");

ResultSet rs1 = st.executeQuery("select * from category");
while(rs1.next()){

      out.write("\n");
      out.write("                        <tr class=\"heading-td\">\n");
      out.write("                            <td class=\"\"><h5>");
      out.print(rs1.getString("category"));
      out.write("</h5></td>\n");
      out.write("                            <td><a href=\"editcategory.jsp?id=");
      out.print(rs1.getString("code"));
      out.write("\" class=\"text-dark\"><span class=\"fa fa-edit\"></span></a></td>\n");
      out.write("                            <td><a href=\"deletecategory.jsp?id=");
      out.print(rs1.getString("code"));
      out.write("\" class=\"text-dark\"><span class=\"fa fa-trash\"></span></a></td>\n");
      out.write("                        </tr>\n");

            }

      out.write("\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-8 col-md-5 col-lg-5 col-xl-5 mx-auto mt-5 card\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-6\">\n");
      out.write("                        <h4 class=\"mx-auto my-3\"><u>Active Users</u></h4>\n");
      out.write("                        <table class=\"table table-light table-striped table-hover\">\n");

ResultSet rs2 = st.executeQuery("select * from users where status =1");
while(rs2.next()){

      out.write("\n");
      out.write("                            <tr class=\"heading-td\">\n");
      out.write("                                <td class=\"\"><h5>");
      out.print(rs2.getString("name"));
      out.write("</h5></td>\n");
      out.write("                                <td><a href=\"blockuser.jsp?id=");
      out.print(rs2.getString("code"));
      out.write("\" class=\"text-dark\"><span class=\"fa fa-toggle-off\">Block</span></a></td>\n");
      out.write("                            </tr>\n");

            }

      out.write("\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-6\">\n");
      out.write("                        <h4 class=\"mx-auto my-3\"><u>Blocked Users</u></h4>\n");
      out.write("                        <table class=\"table table-light table-striped table-hover\">\n");

ResultSet rs3 = st.executeQuery("select * from users where status=0");
while(rs3.next()){

      out.write("\n");
      out.write("                            <tr class=\"heading-td\">\n");
      out.write("                                <td class=\"\"><h5>");
      out.print(rs3.getString("name"));
      out.write("</h5></td>\n");
      out.write("                                <td><a href=\"blockuser.jsp?id=");
      out.print(rs3.getString("code"));
      out.write("\" class=\"text-dark\"><span class=\"fa fa-toggle-on\">Unblock</span></a></td>\n");
      out.write("                            </tr>\n");

            }

      out.write("\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-8 col-md-5 col-lg-5 col-xl-5 mx-auto mt-5 card\">\n");
      out.write("                <h4 class=\"mx-auto my-3\"><u>Videos</u></h4>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <table class=\"table table-light table-striped table-hover\">\n");

ResultSet rs4 = st.executeQuery("select * from video");
while(rs4.next()){

      out.write("\n");
      out.write("                        <tr class=\"heading-td\">\n");
      out.write("                            <td class=\"\"><h5>");
      out.print(rs4.getString("title"));
      out.write("</h5></td>\n");
      out.write("                            <td><a href=\"deletevideo.jsp?id=");
      out.print(rs4.getString("code"));
      out.write("\" class=\"text-dark\"><span class=\"fa fa-trash\"></span></a></td>\n");
      out.write("                        </tr>\n");

            }

      out.write("\n");
      out.write("                    </table>\n");
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
