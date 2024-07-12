<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
    Statement st=cn.createStatement();
%>
<div class="col-8 col-md-5 col-lg-5 col-xl-8 mx-auto mt-5 card">
    <h4 class="mx-auto my-3"><u>Videos</u></h4>
    <div class="row">
        <table class="table table-light table-striped table-hover">
<%
    ResultSet rs = st.executeQuery("select * from video");
    while(rs.next()){
%>
            <tr class="heading-td" id="<%=rs.getString("code")%>">
                <td><h5><%=rs.getString("title")%></h5></td>
                <td><i rel="<%=rs.getString("code")%>" class="deletevid"><span class="fa fa-trash"></span></i></td>
            </tr>
<%
            }
%>
        </table>
    </div>
</div>
<%
    }catch(Exception er){
        out.println(er.getMessage());
    }
%>