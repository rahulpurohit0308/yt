<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.util.*" pageEncoding="UTF-8"%>
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
                String category=request.getParameter("cat");
                PreparedStatement ps=cn.prepareStatement("update category set category=? where code=?");
                ps.setString(1,category);
                ps.setString(2,code);
                if(ps.executeUpdate()>0){
                    out.print("Success");
                }
                else{
                    out.print("Error");
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