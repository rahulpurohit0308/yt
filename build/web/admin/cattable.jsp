<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
    Statement st=cn.createStatement();
%>
<div class="col-8 col-md-5 col-lg-5 col-xl-8 mx-auto mt-5 card">
    <h4 class="mx-auto my-3"><u>Categories</u></h4>
    <div class="row">
        <table class="table table-light table-striped table-hover newdata">
<%
ResultSet rs1 = st.executeQuery("select * from category");
while(rs1.next()){
%>
            <tr class="heading-td" id="<%=rs1.getString("code")%>">
                <td><h5><%=rs1.getString("category")%></h5></td>
                <td><i rel="<%=rs1.getString("code")%>" class="editcat"><span class="fa fa-edit"></span></i></td>
                <td><i rel="<%=rs1.getString("code")%>" class="delcat"><span class="fa fa-trash"></span></i></td>
            </tr>
<%
            }
        }
catch(Exception er){
    out.println(er.getMessage());
}
%>
        </table>
    </div>
</div>