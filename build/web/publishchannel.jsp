<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String channel = request.getParameter("name");
                String descrip=request.getParameter("descrip");
                String dt = new java.util.Date() + "";
                String user_code=request.getParameter("id");
                LinkedList l = new LinkedList();
                for(int i=0;i<=9;i++){
                    l.add(i+"");
                }
                for(char c='A';c<='Z';c++){
                    l.add(c+"");
                }
                for(char c='a';c<='z';c++){
                    l.add(c+"");
                }
                Collections.shuffle(l);
                String code="";
                for (int i=0;i<8;i++){
                    code=code+l.get(i);
                }
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
                        Statement st=cn.createStatement();
                        int sn=0;
                        ResultSet rs=st.executeQuery("select MAX(sn) from channel");
                        if(rs.next()){
                            sn=rs.getInt(1);
                        }
                        sn++;
                        code=code+"_"+sn;
                        PreparedStatement ps = cn.prepareStatement("insert into channel values (?,?,?,?,?,?)");
                        ps.setInt(1,sn);
                        ps.setString(2,code);
                        ps.setString(3,channel);
                        ps.setString(4,user_code);
                        ps.setString(5,descrip);
                        ps.setString(6, dt);                        
                        
                        if(ps.executeUpdate()==0){
                            response.sendRedirect("makechannel.jsp?again=1");
                        }
                        else{
                            response.sendRedirect("home.jsp");
                        }
                }
                  catch(Exception er){
                      out.println(er.getMessage());
                  }
                } 
            catch (Exception er) {
                out.println(er.getMessage());
            }
        
        %>
    </body>
</html>