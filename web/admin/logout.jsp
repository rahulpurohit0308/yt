<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("id").trim().length()==0){
        response.sendRedirect("index.jsp?empty=1");
    }
    else{
        String email = request.getParameter("id");
        try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("select * from admin where email='"+email+"'");
                if(rs.next()){
                         Cookie c = new Cookie("login", email);
                            c.setMaxAge(0);
                            response.addCookie(c);
                            response.sendRedirect("index.jsp");
                }
                else{
                    response.sendRedirect("index.jsp?invalid=1");
                }
                cn.close();
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
    }
%>