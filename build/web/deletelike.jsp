<%-- 
    Document   : deletelike
    Created on : 29 Jun, 2023, 2:48:44 PM
    Author     : Rahul
--%>

<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Cookie c[]=request.getCookies();
                String code = request.getParameter("id");
                String email=null;
                for(int i=0;i<c.length;i++){
                    if(c[i].getName().equals("login")){
                        email=c[i].getValue();
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
                        PreparedStatement ps=cn.prepareStatement("delete from likes where video_code='"+code+"' && email='"+email+"' ");
                        if(ps.executeUpdate()>0){
                            response.sendRedirect("video.jsp?id="+code+"");
                        }
                        else{
                            response.sendRedirect("video.jsp?id="+code+"");
                        }
                    }
                    catch(Exception er){
                        out.println(er.getMessage());
                    }
                }
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
        %>
    </body>
</html>