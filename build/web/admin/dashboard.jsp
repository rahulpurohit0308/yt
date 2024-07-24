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
                if(email==null){
                    response.sendRedirect("index.jsp");
                }
                else{
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
                    Statement st=cn.createStatement();
                    ResultSet rs=st.executeQuery("select * from admin where email='"+email+"'");
                    if(rs.next()){
    
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width; initial-scale=1.0">
        <link rel="stylesheet" href="adminstyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function() {
                $('.menu-btn').click(function() {
                  $('.sidebar').toggleClass('active');
                  $('.content').toggleClass('active');
                });
                $('#cat').click(function(){
                    showSection('cat');
                });
                $('#user').click(function(){
                    showSection('user');
                });
                $('#vid').click(function(){
                    showSection('vid');
                });
                $('#cmnt').click(function(){
                    showSection('cmnt');
                });
                showSection('cat');
                function showSection(section){
                    $('#catsection, #usersection, #vidsection, #cmntsection').hide();
                    $('#'+section+'section').show();
                    $('.sbopt').removeClass('bg-white text-dark');
                    $('#'+section).addClass('bg-white text-dark');
                } 
              });
              $(document).on("click",".btn-primary",function(){
                var cat = $("#catt").val();
                $.post(
                    "insertcategory.jsp",{cat:cat},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            $(".catform").load("catform.jsp");
                            $(".cattable").load("cattable.jsp");
                            $("#msg").attr("class","alert alert-success");
                            $("#msg").html("Record Inserted");
                        }
                    });
            });
            $(document).on("click",".delcat",function(){
                var id = $(this).attr("rel");
                $("#"+id).fadeOut(1000);
                $.post(
                    "deletecategory.jsp",{id:id},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            $("#msg").attr("class","alert alert-warning");
                            $("#msg").html("Record Deleted");
                        }
                    });
            });
            var id=0;
            $(document).on("click",".editcat",function(){
                id=$(this).attr("rel");
                $("#msg").attr("class","");
                $("#msg").text("");
                $.post(
                    "editcategory.jsp",{id:id},function(data){
                        $(".catform").html(data);
                        $("#catt").focus();
                    });
            });
            $(document).on("click",".updatecat",function(){
                var cat=$("#catt").val();
                $.post(
                    "updatecategory.jsp",{id:id,cat:cat},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            $("#msg").attr("class","alert alert-primary");
                            $("#msg").text("Record Updated");
                            $(".catform").load("catform.jsp");
                            $(".cattable").load("cattable.jsp");
                        }
                    });
            });
            $(document).on("click",".blkuser",function(){
                var id = $(this).attr("rel");
                $.post(
                    "blockuser.jsp",{id:id},function(data){
                        data=data.trim();
                        if(data==0){
                            $("#msg").attr("class","alert alert-danger");
                            $("#msg").text("User Blocked");
                        }
                        else if(data==1){
                            $("#msg").attr("class","alert alert-success");
                            $("#msg").text("User Unblocked");
                        }
                        $("#usersection").load("blocklist.jsp");
                    }
                )
            })
            $(document).on("click",".deletevid",function(){
                var id = $(this).attr("rel");
                $("#"+id).fadeOut(1000);
                $.post(
                    "deletevideo.jsp",{id:id},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            $("#msg").attr("class","alert alert-warning");
                            $("#msg").html("Video Deleted");
                        }
                    });
            });
            $(document).on("click",".deletecmnt",function(){
                var id = $(this).attr("rel");
                $("#"+id).fadeOut(1000);
                $.post(
                    "deletecomment.jsp",{id:id},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            $("#msg").attr("class","alert alert-warning");
                            $("#msg").html("Comment Deleted");
                        }
                    });
            });
        </script>
        <style>
            @media only screen and (max-width:1000px){
                .sboption{
                    display: none;
                }
                .menu-btn{
                    display: none;
                }
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark fixed-top">
            <div class="d-flex justify-content-start">
                <i class="fa fa-navicon text-light mr-3 menu-btn"></i>
                <a class="navbar-brand" href="dashboard.jsp"><i class="fa fa-youtube-play text-danger mx-3"></i>YT Administration</a>
            </div>
            <div class="d-flex justify-content-end">
                <a class="navbar-brand" href="logout.jsp?id=<%=email%>">Logout</a>
            </div>
        </nav>
        <div class="container-fluid content">
            <div class="sidebar bg-dark border-right">
                <div class="sbarmenu">
                    <div class="sbopt d-flex" id="cat"><div class="my-auto"><i class="fa fa-th-list mx-4"></i><div class="sboption">Categories</div></div></div>  
                    <div class="sbopt d-flex" id="user"><div class="my-auto"><i class="fa fa-users mx-4"></i><div class="sboption">Users</div></div></div>
                    <div class="sbopt d-flex" id="vid"><div class="my-auto"><i class="fa fa-youtube-play mx-4"></i><div class="sboption">Videos</div></div></div>
                    <div class="sbopt d-flex" id="cmnt"><div class="my-auto"><i class="fa fa-comments mx-4"></i><div class="sboption">Comments</div></div></div><hr>
                </div>
            </div>
            <div class="mainarea">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div id="msg"></div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <div id="catsection">
                    <div class="catform">
                        <jsp:include page="catform.jsp" /> 
                    </div>
                    <div class="cattable">
                        <jsp:include page="cattable.jsp" /> 
                    </div>
                </div>
                <div id="usersection">
                    <jsp:include page="blocklist.jsp" />
                </div>
                <div id="vidsection">
                    <jsp:include page="videos.jsp" /> 
                </div>
                <div id="cmntsection">
                    <jsp:include page="comments.jsp" /> 
                </div>
            </div>
        </div>
    </body>
</html>
<%
                    }
                    else{
                        response.sendRedirect("index.jsp?invalid=1");
                    }
                    cn.close();
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
                }
            }
            catch(Exception er){
                out.println(er.getMessage());
            }
%>