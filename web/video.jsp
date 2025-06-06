<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
<%
    String email=null;
    String usercode="";
    String usercode1="";
    String descrip="";
    String code = request.getParameter("id");
    int likevidstatus=2;
    int videolikes=0;
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
        Statement st3=cn.createStatement();
        ResultSet rs7 = st.executeQuery("select * from users where email='"+email+"'");
        if(rs7.next()){
            usercode = rs7.getString("code");
        }
        ResultSet rs4 = st.executeQuery("select * from video where code='"+code+"'");
        while(rs4.next()){
            usercode1 = rs4.getString("user_code");
            descrip = rs4.getString("descrip");
            ResultSet rs5 = st1.executeQuery("select * from users where code='"+usercode1+"'");
            while(rs5.next()){
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
        <script>
            $(document).ready(function(){
                var email = "<%=email%>";
                var usercode = "<%=usercode%>";
                var channelcode = "<%=usercode1%>";
                var vidcode = "<%=code%>";
                $('.menu-btn').click(function(){
                    $('.mainarea').toggleClass('active');
                    $('.mainarea').toggleClass('opacityfilter');
                });
                if(email!=="null"){
                    $.post("updatehistory.jsp",{usercode:usercode,vidcode:vidcode});
                }
                $.post("updateviews.jsp",{vidcode:vidcode,channelcode:channelcode});
                $(".subsbtn").click(function(){
                    var subs = $(this).text();
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                       if(subs=="Subscribe"){
                            $(this).text("Subscribed");
                            $(this).removeClass("btn-danger");
                            $(this).addClass("btn-light");
                            $.post("subscribe.jsp",{usercode:usercode,code:channelcode});
                        }
                        else{
                            $(this).text("Subscribe");
                            $(this).removeClass("btn-light");
                            $(this).addClass("btn-danger");
                            $.post("subscribe.jsp",{usercode:usercode,code:channelcode});
                        } 
                    }
                })
                $(".likevid").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                        var likes = Number($(".vidlikescount").text());
                        $.post("like.jsp",{usercode:usercode,vidcode:vidcode},function(data){
                            if(data==1){
                                $(".likevid").addClass("liked-button");
                                $(".likevid").removeClass("like-button");
                                $(".dislikevid").addClass("dislike-button");
                                $(".dislikevid").removeClass("disliked-button");
                                $(".vidlikescount").text(likes+1);
                            }
                            else{
                                $(".likevid").addClass("like-button");
                                $(".likevid").removeClass("liked-button");
                                $(".dislikevid").addClass("dislike-button");
                                $(".dislikevid").removeClass("disliked-button");
                                $(".vidlikescount").text(likes-1);
                            }
                        })
                    }
                })
                $(".dislikevid").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                        $.post("dislike.jsp",{usercode:usercode,vidcode:vidcode},function(data){
                            if(data==0){
                                $(".dislikevid").addClass("disliked-button");
                                $(".dislikevid").removeClass("dislike-button");
                                $(".likevid").addClass("like-button");
                                $(".likevid").removeClass("liked-button");
                            }
                            else if(data==1){
                                var likes = Number($(".vidlikescount").text());
                                $(".dislikevid").addClass("disliked-button");
                                $(".dislikevid").removeClass("dislike-button");
                                $(".likevid").addClass("like-button");
                                $(".likevid").removeClass("liked-button");
                                $(".vidlikescount").text(likes-1);
                            }
                            else{
                                $(".dislikevid").addClass("dislike-button");
                                $(".dislikevid").removeClass("disliked-button");
                                $(".likevid").addClass("like-button");
                                $(".likevid").removeClass("liked-button");
                            }
                        })
                    }
                })
                $(".watchlater-button").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                        $.post("addtowatchlater.jsp",{usercode:usercode,vidcode:vidcode},function(data){
                            if(data==1){
                                $(".wlbtn").addClass("fa-clock-o");
                                $(".wlbtn").removeClass("fa-check");
                            }
                            else{
                                $(".wlbtn").addClass("fa-check");
                                $(".wlbtn").removeClass("fa-clock-o");
                            }
                        })
                    }
                })
                $(".playlist-button").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                        var playlistt = null;
                        $("#playlist").modal();
                        $('#playlistSelect').on('change', function(){
                            playlistt = $(this).val();
                            if ($(this).val() === 'other') {
                                $('.newplaylist').removeClass('d-none');
                                $('.addimage').removeClass('d-none');
                                $('.playlisttt').addClass("d-none");
                            } else {
                                $('.newplaylist').addClass('d-none');
                                $('.addimage').addClass('d-none');
                                $('.playlisttt').removeClass("d-none");
                            }
                        });
                        $(".addimage").click(function(){
                            var newpl = $("#newplaylistname").val();
                            var privacy = $('input[name="privacy"]:checked').val();
                            $.post("addplaylist.jsp",{playlist:newpl,privacy:privacy,usercode:usercode}).done(function(){
                                $.post("addtoplaylist.jsp", {playlist: newpl, vidcode: vidcode});
                            });
                            $("#addimage").modal();
                        })
                        $(".playlisttt").click(function(){
                            var newplaylist = $("#playlistSelect").val();
                            $.post("addtoplaylist.jsp",{playlist:newplaylist,vidcode:vidcode});
                        })
                    }
                })
                $(".commentbtn").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                        var comment = $(".comment").val();
                        $.post("addcomment.jsp",{pc:0,id:vidcode,code:usercode,cmnt:comment},function(data){
                            $(".commentss").prepend(data);
                        });
                        $(".comment").val("");
                    }
                })
            })
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container-fluid content">
            <jsp:include page="sidebar.jsp" />
            <div class="mainarea mt-1">
                <div class="row">
                    <div class="col-lg-8 col-xl-8 col-12">
                        <video controls><source src="video/<%=code%>.mp4" type="video/mp4"></video>
                        <h4 class="ml-2" style="font-family: Arial"><%=rs4.getString("title")%></h4>
                        <p class="ml-2" style="font-size:14px"><%=rs4.getString("dt")%></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="text-left">
                                <a href="channel.jsp?id=<%=usercode1%>" style="display: inline;"><img src="userimages/<%=rs5.getString("code")%>.jpg" style="height:50px;width:50px" class="rounded-circle"></a>
                                <p style="font-size:20px; display: inline;" class="ml-2"><%=rs5.getString("name")%></p>
<%
                if(!(usercode1.equals(usercode))){
                    ResultSet rs6 = st2.executeQuery("select * from subs where channel_code='"+usercode1+"' AND user_code='"+usercode+"'");
                    if(rs6.next()){
%>
                                <button class="btn btn-light ml-2 subsbtn" style="height: 40px">Subscribed</button>
<%
                    }
                    else{
%>
                                <button class="btn btn-danger ml-2 subsbtn" style="height: 40px">Subscribe</button>
<%
                    }
                }
%>
                            </div>
                            <div class="row">
<%
                ResultSet rs8 = st2.executeQuery("select * from likes where usercode='"+usercode+"' AND vidcode='"+code+"'");
                if(rs8.next()){
                    likevidstatus = rs8.getInt("status");
                }
                ResultSet rs20 = st3.executeQuery("select count(*) as p from likes where vidcode='"+code+"'");
                if(rs20.next()){
                    videolikes = rs20.getInt("p");
                }
                if (likevidstatus==1){
%>
                                <button class="likevid liked-button row"><div class="vidlikescount"><%=videolikes%></div><i class="fa fa-thumbs-up ml-1 mr-2 mt-1"></i></button>
                                <button class="dislikevid dislike-button"><i class="fa fa-thumbs-down"></i></button>
<%
                }
                else if(likevidstatus==0){
%>
                                <button class="likevid like-button row"><div class="vidlikescount"><%=videolikes%></div><i class="fa fa-thumbs-up ml-1 mr-2 mt-1"></i></button>
                                <button class="dislikevid disliked-button"><i class="fa fa-thumbs-down"></i></button>
<%
                }
                else{
%>
                                <button class="likevid like-button row"><div class="vidlikescount"><%=videolikes%></div><i class="fa fa-thumbs-up ml-1 mr-2 mt-1"></i></button>
                                <button class="dislikevid dislike-button"><i class="fa fa-thumbs-down"></i></button>
<%
                }
                ResultSet rs9 = st2.executeQuery("select * from watchlater where usercode='"+usercode+"' AND vidcode='"+code+"'");
                if(rs9.next()){
%>
                                <button class="watchlater-button ml-2"><i class="fa fa-check wlbtn"></i></button>
<%
                }
                else{
%>
                                <button class="watchlater-button ml-2"><i class="fa fa-clock-o wlbtn"></i></button>
<%
                }
%>
                                <button class="playlist-button ml-2"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
<%
        }
    }
%>
                        <div class="ml-1 mt-3 p-1" style="background-color: silver; border-radius: 5px">
<%
        ResultSet rs10 = st.executeQuery("select * from views where vidcode = '"+code+"'");
        if(rs10.next()){
%>
                            <h5><%=rs10.getInt("views")+1%> views</h5>
<%
        }
        else{
%>
                            <h5>1 view</h5>
<%
        }
%>
                            <p><%=descrip%></p>
                        </div>
                        <h3 class="ml-2 mt-2" style="font-family: Arial"><u>Comments</u></h3>
                        <div class="row mt-2">
<%
        if(email == null){
%>
                            <img src="userimages/unnamed.jpg" style="height:40px;width:40px" class="rounded-circle ml-5">
<%
        }
        else{
%>
                            <img src="userimages/<%=usercode%>.jpg" style="height:40px;width:40px" class="rounded-circle ml-5">
<%
        }
%>
                            <input class="underline-input comment ml-3" style="width: 60%" placeholder="Add comment...">
                            <button class="btn btn-primary commentbtn ml-2">Comment</button>
                        </div>
                        <div class="commentss">
<%
        ResultSet rs11 = st.executeQuery("select * from comment where vidcode='"+code+"' and parent_code='"+0+"'");
        while(rs11.next()){
%>
                            <div class="row mt-4" id="<%=rs11.getString("code")%>" style="justify-content:space-between">
                                <div class="row ml-5">
                                    <img src="userimages/<%=rs11.getString("usercode")%>.jpg" style="height:50px;width:50px" class="rounded-circle">
                                    <div class="mt-1">
<%
            ResultSet rs12 = st1.executeQuery("select * from users where code='"+rs11.getString("usercode")+"'");
            if(rs12.next()){
%>
                                        <h6 class="ml-3" style="line-height: 10px"><u><%=rs12.getString("name")%></u></h6>
<%
            }
%>
                                        <p class="ml-3 fixcomment<%=rs11.getString("code")%>"><%=rs11.getString("comment")%></p>
                                        <input class="underline-input editcomment<%=rs11.getString("code")%> d-none ml-3" value="<%=rs11.getString("comment")%>">
<%
            int commentlikes=0;
            ResultSet rs13 = st1.executeQuery("select count(*) as n from commentlikes where commentcode='"+rs11.getString("code")+"' and status=1");
            if(rs13.next()){
                commentlikes=rs13.getInt("n");
            }
            ResultSet rs14 = st1.executeQuery("select * from commentlikes where commentcode='"+rs11.getString("code")+"' and usercode='"+usercode+"'");
            if(rs14.next()){
                if(rs14.getInt("status")==1){
%>
                    <div class="row ml-3"><div class="likes likes<%=rs11.getString("code")%>"><%=commentlikes%></div><span class="fa fa-thumbs-up likecmnt likecmnt<%=rs11.getString("code")%> text-primary mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span>|<span class="fa fa-thumbs-down dislikecmnt dislikecmnt<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span>|<span class="fa fa-reply replycmnt replycmnt<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span></div>
<%                  
                }
                else if(rs14.getInt("status")==0){
%>
                    <div class="row ml-3"><div class="likes likes<%=rs11.getString("code")%>"><%=commentlikes%></div><span class="fa fa-thumbs-up likecmnt likecmnt<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span>|<span class="fa fa-thumbs-down dislikecmnt dislikecmnt<%=rs11.getString("code")%> text-danger mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span>|<span class="fa fa-reply replycmnt replycmnt<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span></div>
<%
                }
            }
            else{
%>
                    <div class="row ml-3"><div class="likes likes<%=rs11.getString("code")%>"><%=commentlikes%></div><span class="fa fa-thumbs-up likecmnt likecmnt<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span>|<span class="fa fa-thumbs-down dislikecmnt dislikecmnt<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span>|<span class="fa fa-reply replycmnt replycmnt<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span></div>
<%
            }
%>
                                    </div>
                                </div>
<%
            if(rs11.getString("usercode").equals(usercode)){
%>
                                <div class="row">
                                    <span class="fa fa-pencil editcmnt editcmnt<%=rs11.getString("code")%> mr-3" rel="<%=rs11.getString("code")%>"></span><span class="fa fa-check d-none updatecmnt updatecmnt<%=rs11.getString("code")%> mr-3" rel="<%=rs11.getString("code")%>"></span><span class="fa fa-trash deletecmnt deletecmnt<%=rs11.getString("code")%> mx-5" rel="<%=rs11.getString("code")%>"></span>
                                </div>
<%
            }
%>
                            </div>
                            <div class="replydiv replydiv<%=rs11.getString("code")%> d-none ml-5 pl-5 mt-2" id="<%=rs11.getString("code")%>">
                                <img src="userimages/<%=usercode%>.jpg" style="height:40px;width:40px" class="rounded-circle">
                                <input class="underline-input creply creply<%=rs11.getString("code")%> ml-3" id="<%=rs11.getString("code")%>" style="width: 60%" placeholder="Add reply...">
                                <button class="btn btn-secondary ccanbtn ccanbtn<%=rs11.getString("code")%> ml-2" id="<%=rs11.getString("code")%>">Cancel</button>
                                <button class="btn btn-primary creplybtn creplybtn<%=rs11.getString("code")%> ml-2" id="<%=rs11.getString("code")%>">Reply</button>
                            </div>
<%
            ResultSet rs15 = st1.executeQuery("select * from comment where parent_code='"+rs11.getString("code")+"'");
            if(rs15.next()){
%>
                            <div class="repliesbtn repliesbtn<%=rs11.getString("code")%>" id="<%=rs11.getString("code")%>">
                                <span class="fa fa-sort-asc replies repliesasc<%=rs11.getString("code")%> d-none ml-5 pl-5 mt-2" style="cursor:pointer" rel="<%=rs11.getString("code")%>"> Hide Replies</span>
                                <span class="fa fa-sort-desc replies repliesdesc<%=rs11.getString("code")%> ml-5 pl-5 mt-2" style="cursor:pointer" rel="<%=rs11.getString("code")%>"> See Replies</span>
                            </div>
<%
            }
%>
                            <div class="cmntrepliessec cmntrepliessec<%=rs11.getString("code")%> d-none" id="<%=rs11.getString("code")%>">
                                <div class="repliess repliess<%=rs11.getString("code")%>">
<%
            ResultSet rs16 = st1.executeQuery("select * from comment where parent_code='"+rs11.getString("code")+"'");
            while(rs16.next()){
%>
                                    <div class="row mt-4" id="reply<%=rs16.getString("code")%>" style="justify-content:space-between">
                                        <div class="row ml-5 pl-5">
                                            <img src="userimages/<%=rs16.getString("usercode")%>.jpg" style="height:50px;width:50px" class="rounded-circle">
                                            <div class="mt-1">
<%
                ResultSet rs17 = st2.executeQuery("select * from users where code='"+rs16.getString("usercode")+"'");
                if(rs17.next()){                
%>
                                                <h6 class="ml-3" style="line-height: 10px"><u><%=rs17.getString("name")%></u></h6>
<%
                }
%>
                                                <p class="ml-3 fixreply<%=rs16.getString("code")%>"><%=rs16.getString("comment")%></p>
                                                <input class="underline-input editreply<%=rs16.getString("code")%> d-none ml-3" value="<%=rs16.getString("comment")%>">
<%
            int replylikes=0;
            ResultSet rs18 = st2.executeQuery("select count(*) as n from commentlikes where commentcode='"+rs16.getString("code")+"' and status=1");
            if(rs18.next()){
                replylikes=rs18.getInt("n");
            }
            ResultSet rs19 = st2.executeQuery("select * from commentlikes where commentcode='"+rs16.getString("code")+"' and usercode='"+usercode+"'");
            if(rs19.next()){
                if(rs19.getInt("status")==1){
%>
                                                <div class="row ml-3"><div class="likes likes<%=rs16.getString("code")%>"><%=replylikes%></div><span class="fa fa-thumbs-up likecmnt likecmnt<%=rs16.getString("code")%> text-primary mx-1 mt-1" rel="<%=rs16.getString("code")%>"></span>|<span class="fa fa-thumbs-down dislikecmnt dislikecmnt<%=rs16.getString("code")%> mx-1 mt-1" rel="<%=rs16.getString("code")%>"></span>|<span class="fa fa-reply replycmnt2 replycmnt2<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span></div>
<%                  
                }
                else if(rs19.getInt("status")==0){
%>
                                                <div class="row ml-3"><div class="likes likes<%=rs16.getString("code")%>"><%=replylikes%></div><span class="fa fa-thumbs-up likecmnt likecmnt<%=rs16.getString("code")%> mx-1 mt-1" rel="<%=rs16.getString("code")%>"></span>|<span class="fa fa-thumbs-down dislikecmnt dislikecmnt<%=rs16.getString("code")%> text-danger mx-1 mt-1" rel="<%=rs16.getString("code")%>"></span>|<span class="fa fa-reply replycmnt2 replycmnt2<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span></div>
<%
                }
            }
            else{
%>
                                                <div class="row ml-3"><div class="likes likes<%=rs16.getString("code")%>"><%=replylikes%></div><span class="fa fa-thumbs-up likecmnt likecmnt<%=rs16.getString("code")%> mx-1 mt-1" rel="<%=rs16.getString("code")%>"></span>|<span class="fa fa-thumbs-down dislikecmnt dislikecmnt<%=rs16.getString("code")%> mx-1 mt-1" rel="<%=rs16.getString("code")%>"></span>|<span class="fa fa-reply replycmnt2 replycmnt2<%=rs11.getString("code")%> mx-1 mt-1" rel="<%=rs11.getString("code")%>"></span></div>
<%
            }
%>
                                            </div>
                                        </div>
<%
                if(rs16.getString("usercode").equals(usercode)){
%>
                                        <div class="row">
                                            <span class="fa fa-pencil replyeditcmnt replyeditcmnt<%=rs16.getString("code")%> mr-3" rel="<%=rs16.getString("code")%>"></span><span class="fa fa-check d-none replyupdatecmnt replyupdatecmnt<%=rs16.getString("code")%> mr-3" rel="<%=rs16.getString("code")%>"></span><span class="fa fa-trash replydeletecmnt replydeletecmnt<%=rs16.getString("code")%> mx-5" rel="<%=rs16.getString("code")%>"></span>
                                        </div>
<%
                }
%>
                                    </div>
<%
            }
%>
                                </div>
                            </div>
<%
        }
%>
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-4 col-12 mt-2">
<%
        ResultSet rs2 = st.executeQuery("select * from video where code <> '"+code+"' order by RAND()");
        while(rs2.next()){
        String usercode2 = rs2.getString("user_code");
        String title = rs2.getString("title");
        String dt = rs2.getString("dt");
%>
                            <div class="row ml-lg-0 ml-xl-0 ml-4">
                                <a class="text-dark" href="video.jsp?id=<%=rs2.getString("code")%>">
                                    <video style="height:90px;width:160px;border-radius: 4px">
                                            <source src="video/<%=rs2.getString("code")%>.mp4" type="video/mp4" controls muted>
                                    </video>
                                </a>
                                <div class="ml-2">
<%
            ResultSet rs3 = st1.executeQuery("select * from users where code ='"+ usercode2 +"'");
            while(rs3.next()){
%>
                                    <a class="text-dark" href="video.jsp?id=<%=rs2.getString("code")%>"><h6><%=title%></h6></a>
                                    <a href="channel.jsp?id=<%=usercode2%>"><p><%=rs3.getString("name")%></p></a>
                                    <p><%=dt%></p>
<%
            }
%>
                                </div>
                            </div>
<%
    }
%>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="playlist">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add to Playlist</h4>
                        <button type="button" class="close" data-dismiss="modal" style="color:black">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div id="lg_msg"></div>
                        <label>Playlist :</label>
                        <select class="form-control" id="playlistSelect">
                            <option value="select">Select a Playlist</option>
<%
            ResultSet rs12 = st2.executeQuery("select * from playlist where usercode='"+usercode+"'");
            while(rs12.next()){
%>
                            <option value="<%=rs12.getString("playlist")%>"><%=rs12.getString("playlist")%></option>
<%
            }
%>
                            <option value="other">Create New Playlist</option>
                        </select><br>
                        <div class="newplaylist d-none">
                            <label>New Playlist</label>
                            <input type="text" id="newplaylistname" class="form-control"><br>
                            <label class="mr-3">Privacy</label>
                            <label>
                                <input type="radio" name="privacy" value="public" checked>
                                Public
                            </label>
                            <label>
                                <input type="radio" name="privacy" value="private">
                                Private
                            </label>
                        </div>
                        <button class="btn btn-primary addimage d-none" id="submit" data-dismiss="modal">Add Image</button><br>
                        <button class="btn btn-primary playlisttt" id="submit" data-dismiss="modal">Add</button><br>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="addimage">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Playlist Image</h4>
                        <button type="button" class="close" data-dismiss="modal" style="color:black">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div id="lg_msg"></div>
                        <form method="post" ACTION="add_playlist_img.jsp?id=<%=code%>" name="uploadForm" ENCTYPE='multipart/form-data'>
                            <label>Select Image :</label>
                            <input type="file" name="uploadFile" size="40" class="form-control">
                            <input type="submit" name="Submit" class="btn btn-primary" value="Submit">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function(){
                var email = "<%=email%>";
                var usercode = "<%=usercode%>";
                var channelcode = "<%=usercode1%>";
                var vidcode = "<%=code%>";
                $('.deletecmnt').click(function(){
                    var id = $(this).attr("rel");
                    $.post("deletecomment.jsp",{id:id});
                    $("#"+id).fadeOut(1000);
                    $(".repliesbtn"+id).fadeOut(1000);
                    $(".repliess"+id).fadeOut(1000);
                })
                $(".editcmnt").click(function(){
                    var id = $(this).attr("rel");
                    $(this).addClass("d-none");
                    $(".fixcomment"+id).addClass("d-none");
                    $(".editcomment"+id).removeClass("d-none");
                    $(".editcomment"+id).focus();
                    $(".updatecmnt"+id).removeClass("d-none");
                    $('.updatecmnt'+id).click(function(){
                        var comment = $(".editcomment"+id).val();
                        $.post("updatecomment.jsp",{code:id,comment:comment});
                        $(this).addClass("d-none");
                        $(".fixcomment"+id).removeClass("d-none");
                        $(".fixcomment"+id).text(comment);
                        $(".editcomment"+id).addClass("d-none");
                        $(".editcmnt"+id).removeClass("d-none");
                    })
                })
                $(".likecmnt").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                        var id = $(this).attr("rel");
                        $.post("commentlike.jsp",{commentcode:id,usercode:usercode},function(data){
                            if(data==1){
                                var likes = Number($(".likes"+id).text());
                                $(".likes"+id).text(likes+1);
                                $(".likecmnt"+id).addClass("text-primary");
                                $(".dislikecmnt"+id).removeClass("text-danger");
                            }
                            else{
                                var likes = Number($(".likes"+id).text());
                                $(".likes"+id).text(likes-1);
                                $(".likecmnt"+id).removeClass("text-primary");
                                $(".dislikecmnt"+id).removeClass("text-danger");
                            }
                        });
                    }
                })
                $(".dislikecmnt").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                    var id = $(this).attr("rel");
                        $.post("commentdislike.jsp",{commentcode:id,usercode:usercode},function(data){
                            if(data==0){
                                var likes = Number($(".likes"+id).text());
                                $(".likes"+id).text(likes);
                                $(".likecmnt"+id).removeClass("text-primary");
                                $(".dislikecmnt"+id).addClass("text-danger");
                            }
                            else if(data==1){
                                var likes = Number($(".likes"+id).text());
                                $(".likes"+id).text(likes-1);
                                $(".likecmnt"+id).removeClass("text-primary");
                                $(".dislikecmnt"+id).addClass("text-danger");
                            }
                            else{
                                var likes = Number($(".likes"+id).text());
                                $(".likes"+id).text(likes);
                                $(".likecmnt"+id).removeClass("text-primary");
                                $(".dislikecmnt"+id).removeClass("text-danger");
                            }
                        });
                    }
                })
                $(".replycmnt").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                        var id = $(this).attr("rel");
                        $(".replydiv"+id).removeClass("d-none");
                        $(".creply"+id).focus();
                        $(".ccanbtn"+id).click(function(){
                            $(".creply"+id).clear();
                            $(".replydiv"+id).addClass("d-none");
                        })
                        $(".creplybtn"+id).click(function(){
                            var reply = $(".creply"+id).val();
                            $(".replydiv"+id).addClass("d-none");
                            $.post("addcmntreply.jsp",{id:id,vidcode:vidcode,code:usercode,cmntreply:reply},function(data){
                                $(".repliess").prepend(data);
                            });
                        })
                    }
                })
                $(".replies").click(function(){
                    var id = $(this).attr("rel");
                    $(".repliesasc"+id).toggleClass("d-none");
                    $(".repliesdesc"+id).toggleClass("d-none");
                    $(".cmntrepliessec"+id).toggleClass("d-none");
                    $(".replydiv"+id).addClass("d-none");
                });
                $('.replydeletecmnt').click(function(){
                    var id = $(this).attr("rel");
                    $.post("deletecomment.jsp",{id:id});
                    $("#reply"+id).fadeOut(1000);
                })
                $(".replyeditcmnt").click(function(){
                    var id = $(this).attr("rel");
                    $(this).addClass("d-none");
                    $(".fixreply"+id).addClass("d-none");
                    $(".editreply"+id).removeClass("d-none");
                    $(".editreply"+id).focus();
                    $(".replyupdatecmnt"+id).removeClass("d-none");
                    $('.replyupdatecmnt'+id).click(function(){
                        var comment = $(".editreply"+id).val();
                        $.post("updatecomment.jsp",{code:id,comment:comment});
                        $(this).addClass("d-none");
                        $(".fixreply"+id).removeClass("d-none");
                        $(".fixreply"+id).text(comment);
                        $(".editreply"+id).addClass("d-none");
                        $(".replyeditcmnt"+id).removeClass("d-none");
                    })
                })
                $(".replycmnt2").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                        var id = $(this).attr("rel");
                        $(".replydiv"+id).removeClass("d-none");
                        $(".creply"+id).focus();
                        $(".ccanbtn"+id).click(function(){
                            $(".replydiv"+id).addClass("d-none");
                        })
                        $(".creplybtn"+id).click(function(){
                            var reply = $(".creply"+id).val();
                            $(".replydiv"+id).addClass("d-none");
                            $.post("addcmntreply.jsp",{id:id,vidcode:vidcode,code:usercode,cmntreply:reply},function(data){
                                $(".repliess").prepend(data);
                            });
                        })
                    }
                })
            })
        </script>
    </body>
</html>
<%
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
%>
