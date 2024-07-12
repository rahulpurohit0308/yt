<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
 <%
            try {
              Cookie c[]=request.getCookies();
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
                      int status=0;
                      String code=request.getParameter("id");
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
                      Statement st = cn.createStatement();
                      ResultSet rs1 = st.executeQuery("select * from users where code='"+code+"'");
                      if(rs1.next()){
                        status = Integer.parseInt(rs1.getString("status"));
                        status =~status&1;
                      }
                      PreparedStatement ps=cn.prepareStatement("update users set status=? where code=?");
                      ps.setInt(1, status);
                      ps.setString(2, code);
                      if(ps.executeUpdate()>0){
                          out.print(status);
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
