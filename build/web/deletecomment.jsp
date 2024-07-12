<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
      String cmnt=request.getParameter("id");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
            PreparedStatement ps=cn.prepareStatement("delete from comment where code='"+cmnt+"'");
            if(ps.executeUpdate()>0){
                out.print("Success");
            }
            else{
                out.print("Error");
            }
            cn.close();
        }
        catch(Exception er){
            response.sendRedirect(er.getMessage());
        }
%>