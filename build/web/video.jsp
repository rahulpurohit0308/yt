<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
<%
    String code = request.getParameter("id");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        Statement st1=cn.createStatement();
        Statement st2=cn.createStatement();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="video_style.css">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="jquery-3.6.4.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container-fluid content">
            <jsp:include page="sidebar.jsp" />
            <div class="mainarea mt-1">
                <div class="col-lg-8 col-xl-8 col-12">
                    <video style="width: 100%" controls><source src="video/<%=code%>.mp4" type="video/mp4"></video>
                </div>
<%
        ResultSet rs4 = st.executeQuery("select * from video where code='"+code+"'");
        while(rs4.next()){
            String usercode1 = rs4.getString("user_code");
            ResultSet rs5 = st1.executeQuery("select * from users where code='"+usercode1+"'");
            while(rs5.next()){
%>
                    <h5 class="ml-2"><%=rs4.getString("title")%></h5>
                    <p class="ml-2" style="font-size:14px"><%=rs4.getString("dt")%></p>
                    <div class="col-lg-8 col-xl-8 col-12">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="text-left">
                                <a href="channel.jsp?id=<%=usercode1%>" style="display: inline;"><img src="userimages/<%=rs5.getString("code")%>.jpg" style="height:50px;width:50px" class="rounded-circle"></a>
                                <p style="font-size:20px; display: inline;" class="ml-2"><%=rs5.getString("name")%></p>
                                <button class="btn btn-danger d-none ml-3" style="height: 40px">Subscribe</button>
                                <button class="btn btn-secondary ml-3" style="height: 40px">Unsubscribe</button>
                            </div>
                            <div>
                                <button class="like-button"><i class="fa fa-thumbs-up"></i></button>
                                <button class="dislike-button"><i class="fa fa-thumbs-down"></i></button>
                                <button class="watchlater-button"><i class="fa fa-clock-o"></i></button>                                
                                <button class="playlist-button"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
<%
        }
    }
%>
            </div>
        </div>
    </body>
</html>
<%
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
%>
