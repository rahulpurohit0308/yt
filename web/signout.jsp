<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
            String email = request.getParameter("id");
            try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
                    Statement st=cn.createStatement();
                    ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
                    if(rs.next()){
                            Cookie c = new Cookie("login", email);
                            c.setMaxAge(0);
                            response.addCookie(c);
                            out.println("Success");
                    }
                    cn.close();
            }
            catch(Exception er){
                out.println(er.getMessage());
            }
%>