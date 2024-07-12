<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
    Statement st=cn.createStatement();
%>
<div class="container">
    <div class=" col-8 col-md-5 col-lg-5 col-xl-8 mx-auto mt-5 card">
        <div class="row">
            <div class="col-lg-6">
                <h4 class="mx-auto my-3"><u>Active Users</u></h4>
                <table class="table table-light table-striped table-hover">
<%
    ResultSet rs = st.executeQuery("select * from users where status =1");
    while(rs.next()){
%>
                    <tr class="heading-td">
                        <td class=""><h5><%=rs.getString("name")%></h5></td>
                        <td><span rel="<%=rs.getString("code")%>" class="fa fa-toggle-off btn btn-warning text-dark blkuser">Block</span></td>
                    </tr>
<%
            }
%>
                </table>
            </div>
            <div class="col-lg-6">
                <h4 class="mx-auto my-3"><u>Blocked Users</u></h4>
                <table class="table table-light table-striped table-hover">
<%
ResultSet rs1 = st.executeQuery("select * from users where status=0");
while(rs1.next()){
%>
                                        <tr class="heading-td">
                                            <td class=""><h5><%=rs1.getString("name")%></h5></td>
                                            <td><span rel="<%=rs1.getString("code")%>" class="fa fa-toggle-on btn btn-warning text-dark blkuser">Unblock</span></td>
                                        </tr>
<%
            }
        } catch(Exception er){
            out.println(er.getMessage());
        }
%>
                </table>
            </div>
        </div>
    </div>
</div>