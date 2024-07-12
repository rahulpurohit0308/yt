<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    try {
      Cookie c[]=request.getCookies();
      String email=null;
      String plcode=request.getParameter("plcode");
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
              PreparedStatement ps=cn.prepareStatement("delete from playlist where code='"+plcode+"'");
              ps.executeUpdate();
              cn.close();
          }
          catch(Exception er){
              out.print(er.getMessage());
          }
      }
  }
  catch(Exception e){
      out.println(e.getMessage());
  }  
%>