<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
<%
    try{
        String email=null;
        String code=null;
        String vidcode=null;
        String channelcode=null;
        String usercode=null;
        String dt=null;
        int subs=0;
        int res=0;
        String search = request.getParameter("search");
        Cookie c[]=request.getCookies();
        for(int i=0; i<c.length; i++){
            if(c[i].getName().equals("login")){
                email = c[i].getValue();
                break;
            }
        }
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
    ResultSet rs4 = st.executeQuery("select * from users where name like'%" + search + "%' and code<>'"+code+"'");
    while(rs4.next()){
        usercode = rs4.getString("code");
%>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 col-xl-3 text-center my-auto">
                        <a href="channel.jsp?id=<%=usercode%>">
                            <img src="userimages/<%=usercode%>.jpg" style="height:120px;width: 120px" class="rounded-circle">
                        </a>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-6 col-lg-6 col-xl-6">
                        <a href="channel.jsp?id=<%=usercode%>"><h3 class="text-dark"><%=rs4.getString("name")%></h3></a>
<%
    ResultSet rs5 = st1.executeQuery("select count(*) as p from subs where channel_code='"+usercode+"'");
    if(rs5.next()){
        subs=rs5.getInt("p");
    }
%>
                        <p class="text-dark" style="display:inline;font-size: 16px;font-weight: 600"><u class='subscount'><%=subs%></u> Subscribers</p>
                        <p class="text-dark"><%=rs4.getString("des")%></p>
                    </div>
<%
        ResultSet rs10 = st1.executeQuery("select count(*) as p from subs where user_code='"+code+"' and channel_code='"+usercode+"'");
        if(rs10.next()){
            res = rs10.getInt("p");
        }
        if(res==0){
%>
            <button class="btn btn-danger mr-3 mt-2 mx-auto subscribebtn" rel='<%=usercode%>' style="height: 40px">Subscribe</button>
<%
        }
        else{
%>
            <button class="btn btn-light mr-3 mt-2 mx-auto subscribebtn" rel='<%=usercode%>' style="height: 40px">Subscribed</button>
<%
        }
%>
                </div>
<%
    }
%>
<hr class='my-4'>
                <div class="row">
<%
    ResultSet rs2 = st.executeQuery("select * from video where title like'%" + search + "%'");
    while(rs2.next()){
        vidcode = rs2.getString("code");
        channelcode = rs2.getString("user_code");
        dt=rs2.getString("dt");
%>
                    <div class="col-6 col-lg-4 col-xl-4 col-md-5 text-center ml-3 my-auto">
                        <a href="video.jsp?id=<%=vidcode%>">
                            <video style="border-radius: 5px;">
                                <source src="video/<%=vidcode%>.mp4" type="video/mp4" controls autoplay>
                            </video>
                        </a>
                    </div>
                    <div class="col-5">
                        <a href="video.jsp?id=<%=code%>"><h5 class="text-dark mb-3"><%=rs2.getString("title")%></h5></a>
                        <div class="row">
<%
    ResultSet rs11 = st2.executeQuery("select * from views where vidcode='"+vidcode+"'");
    while(rs11.next()){
%>
                                <p class="text-dark ml-3"><%=rs11.getInt("views")%> views</p>
<%
    }
%>
                                <p class="text-dark ml-3" style="line-height:20px"><%=dt%></p>
                            </div>
                            <div class="row">
                                <a href="channel.jsp?id=<%=channelcode%>" class="ml-3 mr-2"><img src="userimages/<%=channelcode%>.jpg" style="height:30px;width:30px" class="rounded-circle"></a>
<%
    ResultSet rs3 = st2.executeQuery("select * from users where code='"+channelcode+"'");
    while(rs3.next()){
%>
                                <a href="channel.jsp?id=<%=channelcode%>"><p class="text-dark"><u><%=rs3.getString("name")%></u></p></a>
<%
    }
%>
                            </div>
                            <p><%=rs2.getString("descrip")%></p>
                        </div>
<%
    }
%>
                </div><br>
            </div>
        </div>
        <script>
            $(document).ready(function(){
                $('.subscribebtn').click(function(){
                    var subscount = $(this).closest('.row').find('.subscount').text();
                    subscount = parseInt(subscount, 10);
                    var usercode = $(this).attr('rel');
                    if('<%=email%>'=='null'){
                        $("#login").modal();
                    }
                    else{
                        $.post("subsfrmsch.jsp",{code:'<%=code%>',usercode:usercode});
                        var btntext = $(this).text();
                        $(this).toggleClass('btn-danger btn-light');
                        if(btntext == "Subscribe"){
                            $(this).text("Subscribed");
                            $(this).closest('.row').find('.subscount').text(subscount+1);
                        }
                        else {
                            $(this).text("Subscribe");
                            $(this).closest('.row').find('.subscount').text(subscount-1);
                        }
                    }
                });
            })
        </script>
    </body>
</html>
<%
                cn.close();
        }
        catch(Exception e){
            out.print(e.getMessage());
        }
%>