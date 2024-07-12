<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    String code=request.getParameter("code");
    String comment=request.getParameter("comment");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
            PreparedStatement ps = cn.prepareStatement("update comment set comment=? where code=?");
            ps.setString(1,comment);
            ps.setString(2,code);
            ps.executeUpdate();
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
%>