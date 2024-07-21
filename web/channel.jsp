<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
<%
    try{
        Cookie c[]=request.getCookies();
        String email=null;
        for(int i=0; i<c.length; i++){
            if(c[i].getName().equals("login")){
                email = c[i].getValue();
                break;
            }
        }
        String name=null;
        int videocount = 0;
        int subscount = 0;
        int views = 0;
        String des= null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        Statement st1=cn.createStatement();
        String code=request.getParameter("id");
        String usercode=null;
        int res = 0;
        ResultSet rs9 = st.executeQuery("select * from views where channelcode='"+code+"'");
        while(rs9.next()){
            views += rs9.getInt("views");
        }
        ResultSet rs3 = st.executeQuery("select * from users where email='"+email+"'");
        if(rs3.next()){
            usercode = rs3.getString("code");
        }
        ResultSet rs5 = st.executeQuery("select * from users where code='"+code+"'");
        if(rs5.next()){
            name = rs5.getString("name");
            des = rs5.getString("des");
        }
        ResultSet rs6 = st.executeQuery("select count(*) as videocount from video where user_code='"+code+"'");
        if(rs6.next()){
            videocount = rs6.getInt("videocount");
        }
        ResultSet rs7 = st.executeQuery("select count(*) as subscount from subs where channel_code='"+code+"'");
        if(rs7.next()){
            subscount = rs7.getInt("subscount");
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="channelstyle.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function() {
                var code = "<%=code%>";
                var usercode = "<%=usercode%>";
                $('#home').click(function(){
                    showSection('home');
                });
                $('#videos').click(function(){
                    showSection('videos');
                });
                $('#playlists').click(function(){
                    showSection('playlists');
                });
                $('#about').click(function(){
                    showSection('about');
                });
                showSection('home');
                function showSection(section){
                    $('.home-section, .videos-section, .playlists-section, .about-section').hide();
                    $('.'+section+'-section').show();
                    $('.optionn').removeClass('activee');
                    $('#'+section).addClass('activee');
                }
                $('.subscribebtn').click(function(){
                    var subscount = $(".subscount").text();
                    if('<%=email%>'=='null'){
                        $("#login").modal();
                    }
                    else{
                        $.post("subscribe.jsp",{code:code,usercode:usercode});
                        var btntext = $(this).text();
                        $('.subscribebtn').toggleClass('btn-danger');
                        $('.subscribebtn').toggleClass('btn-light');
                        if(btntext == "Subscribe"){
                            $(this).text("Subscribed");
                            $('.subscount').text(Number(subscount)+1);
                        }
                        else {
                            $(this).text("Subscribe");
                            $('.subscount').text(Number(subscount)-1);
                        }
                    }
                });
              });
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container-fluid content">
            <jsp:include page="sidebar.jsp" />
            <div class="mainarea">
                <div class="row py-3 bg-secondary">
                    <div class="mx-auto my-auto">
                        <img src="userimages/<%=code%>.jpg" style="height: 150px;width: 150px" class="rounded-circle">
                    </div>
                    <div class="mx-auto col-xs-8 col-sm-8 details">
                        <h1 class="text-light" style="font-family: Poppins,sans-serif"><%=name%></h1>
                        <h5 class="text-light subscount" style="display:inline"><%=subscount%> Subscribers | <%=videocount%> Videos | <%=views%> Views</h5>
                        <h6 class="text-light"><%=des%></h6>
                    </div>
<%
                        if(usercode==null){
%>
                        <button class="btn btn-danger mr-3 mt-2 mx-auto subscribebtn" style="height: 40px">Subscribe</button>
<%
                        }
                        else{
                            if (!(usercode.equals(code))){
                                ResultSet rs4 = st1.executeQuery("select count(*) as p from subs where user_code='"+usercode+"' and channel_code='"+code+"'");
                                if(rs4.next()){
                                    res = rs4.getInt("p");
                                }
                                if(res==0){
%>
                    <button class="btn btn-danger mr-3 mt-2 mx-auto subscribebtn" style="height: 40px">Subscribe</button>
<%
                                }
                                else{
%>
                    <button class="btn btn-light mr-3 mt-2 mx-auto subscribebtn" style="height: 40px">Subscribed</button>
<%                                
                                }
                            }
                        }
%>
                </div>
                <div class="row bg-dark">
                    <h4 class="ml-5 optionn p-2" id="home">Home</h4>
                    <h4 class="ml-3 optionn p-2" id="videos">Videos</h4>
                    <h4 class="ml-3 optionn p-2" id="playlists">Playlists</h4>
                </div>
                <div class="home-section">
                    <div class="row mt-3">
                        <p class="heading1 ml-3"><u>Latest Video</u></p>
                    </div>
<%
                            ResultSet rs=st.executeQuery("select * from video where user_code='"+code+"' limit 1");
                            while(rs.next()){
%>
                    <div class="row">
                        <div class="col-sm-8 col-md-6 col-lg-4 col-xl-4">
                            <a class="text-dark" href="video.jsp?id=<%=rs.getString("code")%>">
                                <video style="border-radius:5px"><source src="video/<%=rs.getString("code")%>.mp4" type="video/mp4" controls muted></video>
                            </a>
                        </div>
                        <div class="col-sm-4 col-md-6 col-lg-8 col-xl-8">
                            <a class="text-dark" href="video.jsp?id=<%=rs.getString("code")%>"><h6><%=rs.getString("title")%></h6></a>
                            <p><%=rs.getString("dt")%></p>
                            <p class="mt-2"><%=rs.getString("descrip")%></p>
                        </div>
                    </div>
<%
                            }
%>
                </div>
            <div class="videos-section" style="display: none;">
                <div class="row mt-2">
<%
                            ResultSet rs1=st.executeQuery("select * from video where user_code='"+code+"'");
                            while(rs1.next()){
%>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <a href="video.jsp?id=<%=rs1.getString("code")%>">
                        <video style="border-radius: 5px;"><source src="video/<%=rs1.getString("code")%>.mp4" type="video/mp4" controls muted></video>
                    </a>
                    <div class="text-center mt-1">
                        <a class="text-dark" href="video.jsp?id=<%=rs1.getString("code")%>"><h6><%=rs1.getString("title")%></h6></a>
                        <p><%=rs1.getString("dt")%></p>
                    </div>
                </div>
<%
                            }
%>
                </div>
            </div>
            <div class="playlists-section" style="display: none;">
                <div class="row mt-2">
<%
                ResultSet rs8 = st.executeQuery("select distinct * from playlist where usercode='"+code+"' AND privacy = 'public'");
                while(rs8.next()){
%>
                    <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                        <a href="playlist.jsp?id=<%=rs8.getString("code")%>">
                            <img src="playlist/<%=rs8.getString("code")%>.jpg" style="height:auto;width: 100%;border-radius: 5px">
                        </a>
                        <div class="text-center mt-1">
                            <a class="text-dark" href="playlist.jsp?id=<%=rs8.getString("code")%>"><h6><%=rs8.getString("playlist")%></h6></a>
                            <p><%=rs8.getString("dt")%></p>
                        </div>
                    </div>
<%
                }
%>
                </div>
                </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
                    cn.close();
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
%>