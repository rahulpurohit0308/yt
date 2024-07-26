<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    try {
      Cookie c[]=request.getCookies();
      String email=null;
      int sn=0;
      String usercode=request.getParameter("usercode");
      String code1=request.getParameter("vidcode");
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
              Statement st = cn.createStatement();
              ResultSet rs=st.executeQuery("select MAX(sn) from history");
              if(rs.next()){
                  sn=rs.getInt(1);
              }
              sn++;
              ResultSet rs1 = st.executeQuery("select * from history where usercode='"+usercode+"' and vidcode='"+code1+"'");
              if(rs1.next()){
                  PreparedStatement ps=cn.prepareStatement("update history set sn=? where vidcode=? and usercode=?");
                  ps.setInt(1,sn);
                  ps.setString(2, code1);
                  ps.setString(3, usercode);
                  ps.executeUpdate();
              }
              else{
                PreparedStatement ps1=cn.prepareStatement("insert into history values(?,?,?)");
                ps1.setInt(1, sn);
                ps1.setString(2,usercode);
                ps1.setString(3,code1);
                ps1.executeUpdate();
              }
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