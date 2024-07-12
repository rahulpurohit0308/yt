<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    String email=null;
    String code=null;
    String channelcode=null;
    Cookie c[]=request.getCookies();
    for(int i=0; i<c.length; i++){
        if(c[i].getName().equals("login")){
            email = c[i].getValue();
            break;
        }
    }
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        Statement st1=cn.createStatement();
        ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
        if(rs.next()){
            code=rs.getString("code");
        }
%>
<div class="sidebar bg-dark">
    <div id="sbarmenu1">
        <a class="sbopt d-flex" href="index.jsp"><div class="my-auto"><i class="fa fa-home mx-4"></i><div class="sboption">Home</div></div></a>
        <a class="sbopt d-flex" href="subscriptions.jsp"><div class="my-auto"><i class="fa fa-institution mx-4"></i><div class="sboption">Subscriptions</div></div></a>
        <a class="sbopt d-flex" href="library.jsp"><div class="my-auto"><i class="fa fa-folder mx-4"></i><div class="sboption">Library</div></div></a>
        <a class="sbopt d-flex" href="history.jsp"><div class="my-auto"><i class="fa fa-history mx-4"></i><div class="sboption">History</div></div></a><hr>
    </div>
    <div id="sbarmenu2" class="d-none">
        <a class="sbopt d-flex" href="liked.jsp"><div class="my-auto"><i class="fa fa-thumbs-up mx-4"></i><div class="sboption">Liked Videos</div></div></a>
        <a class="sbopt d-flex" href="watchlater.jsp"><div class="my-auto"><i class="fa fa-clock-o mx-4"></i><div class="sboption">Watch Later</div></div></a>
        <a class="sbopt d-flex" href="yourvideos.jsp"><div class="my-auto"><i class="fa fa-home mx-4"></i><div class="sboption">Your Videos</div></div></a><hr>
    </div>
    <div id="sbarmenu3" class="d-none">
        <h6 class="ml-4 mb-3 text-light"><u>Subscriptions</u></h6>
<%
        ResultSet rs1 = st.executeQuery("select * from subs where user_code='"+code+"'");
        while(rs1.next()){
            channelcode = rs1.getString("channel_code");
%>
        <a class="sbopt d-flex" href="channel.jsp?id=<%=channelcode%>">
            <div class="row my-auto">
                <img src="userimages/<%=channelcode%>.jpg" style="height:30px;width:30px" class="rounded-circle ml-4 mr-3">
<%
            ResultSet rs2 = st1.executeQuery("select * from users where code='"+channelcode+"'");
            if(rs2.next()){
%>
                <div class="sboption"><h6><%=rs2.getString("name")%></h6></div>
<%
            }
%>
            </div>
        </a>
<%
        }
%>
    </div>
</div>
<%
    }
    catch(Exception e){
        out.print(e.getMessage());
    }
%>