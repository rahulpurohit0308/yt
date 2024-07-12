<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
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
        Statement st2=cn.createStatement();
        ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
        if(rs.next()){
            code=rs.getString("code");
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="jquery-3.6.4.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container-fluid content">
            <jsp:include page="sidebar.jsp" />
            <div class="mainarea mt-2">
<%
        if(email!=null){
%>
                <div class="row">
<%
    ResultSet rs1 = st.executeQuery("select * from subs where user_code = '"+code+"'");
    while(rs1.next()){
        channelcode = rs1.getString("channel_code");
        ResultSet rs2 = st1.executeQuery("select * from video where user_code='"+channelcode+"' order by dt desc");
        while(rs2.next()){
%>
                    <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                        <div class="video-item">
                            <a href="video.jsp?id=<%=rs2.getString("code")%>">
                                <video style="border-radius: 5px;">
                                    <source src="video/<%=rs2.getString("code")%>.mp4" type="video/mp4" controls autoplay>
                                </video>
                            </a>
                        </div>
                        <div class="row">
                            <a href="channel.jsp?id=<%=rs2.getString("user_code")%>" class="mx-3"><img src="userimages/<%=channelcode%>.jpg" style="height:30px;width:30px" class="rounded-circle"></a>
                            <a href="video.jsp?id=<%=rs2.getString("code")%>"><h5 class="text-dark text-center mb-3"><%=rs2.getString("title")%></h5></a>
                        </div>
                        <div class="row" style="line-height:4px">
<%
                ResultSet rs3 = st2.executeQuery("select * from users where code='"+channelcode+"'");
                if(rs3.next()){
%>
                            <a href="channel.jsp?id=<%=channelcode%>"><p class="text-dark ml-3"><u><%=rs3.getString("name")%></u></p></a>
<%
                }
%>
                            <p class="text-dark ml-3"><%=rs2.getString("dt")%></p>
                        </div>
                    </div>
<%
            }
        }
%>
                </div>
<%
        }
        else{
%>
                <div class="row" style="height:80vh">
                    <div class='mx-auto my-auto'>
                        <div class='row'><span class="fa fa-frown-o mx-auto" style='font-size:100px'></span></div>
                        <div class='row'><h6 class='mx-auto'>Don't miss new videos</h6></div>
                        <div class='row'><p class='mx-auto'>Sign in to see updates from favorite YT channels</p></div>
                        <div class='row'><button class='btn btn-primary signin mx-auto'>Sign In</button></div>
                    </div>
                </div>
<%
        }
%>
            </div>
        </div>
    </body>
</html>
<%
                cn.close();
        }
        catch(Exception e){
            out.print(e.getMessage());
        }
%>