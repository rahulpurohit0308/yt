<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    try {
      Cookie c[]=request.getCookies();
      String email=null;
      String vidcode=request.getParameter("vidcode");
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
              PreparedStatement ps=cn.prepareStatement("delete from playlistvideos where vidcode='"+vidcode+"' and playlistcode='"+plcode+"'");
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
      }
  }
  catch(Exception e){
      out.println("dashboard.jsp");
  }  
%>