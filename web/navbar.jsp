<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    String email=null;
    String code=null;
    int flag=0;
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
        ResultSet rs5 = st1.executeQuery("select * from users where code='"+code+"'");
        if(rs5.next()){
            flag = 1;
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function(){
               var email = "<%=email%>";
                var flag = "<%=flag%>" ;
                var code = "<%=code%>";
                if(email=="null"){
                    $(".navbar").css("padding","10px");
                }
                $("#sg").click(function(){
                    $("#signup").modal();
                });
                $("#si").click(function(){
                    $("#login").modal();
                })
                $('.menu-btn').click(function() {
                  $('.sidebar').toggleClass('active');
                  $('.mainarea').toggleClass('active');
                  $('#sbarmenu2').toggleClass('d-none');
                  $('#sbarmenu3').toggleClass('d-none');
                });
                $(".signin").click(function(){
                    $("#login").modal();
                });
                $("#submit").click(function(){
                    var email = $("#email").val();
                    var pass = $("#pass").val();
                    $.post("check.jsp",{email:email,pass:pass},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            location.reload();
                        }
                    });
                });
                $("#submitt").click(function(){
                    var name = $("#name").val();
                    var email = $("#email2").val();
                    var pass = $("#pass2").val();
                    var des =$("#des").val();
                    $.post("signup.jsp",{email:email,des:des,name:name,pass:pass},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            $("#addimage2").modal();
                        }
                    });
                });
                $(".signout").click(function(){
                    $.post("signout.jsp",{id:email},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            location.reload();
                        }
                    })
                })
                $(".upload").click(function(){
                    if(email=="null"){
                        $("#login").modal();
                    }
                    else{
                        if(flag=="0"){
                            $("#makechannel").modal();
                        }
                        else{
                            $("#uploadvideo").modal();
                        }
                    }
                });
                $('#selectcat').change(function(){
                  if($('#selectcat option:selected').val() === 'other') {
                    $('#other-textfield').show();
                  } else {
                    $('#other-textfield').hide();
                  }
                });
                $(".selvideo").click(function(){
                    var title = $("#vidtitle").val();
                    var descrip = $("#viddescrip").val();
                    var category = $("#selectcat").val();
                    var categori = $("#other").val();
                    $.post("addvideo.jsp",{id:code,title:title,descrip:descrip,category:category,categori:categori});
                    $("#selectvideo").modal();
                })
            });
        </script>
        <style>
            @media only screen and (max-width:1200px){
                .sboption{
                    display: none;
                }
                .menu-btn{
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark fixed-top">
            <i class="fa fa-navicon text-light menu-btn"></i>
            <a class="navbar-brand" href="index.jsp"><i class="fa fa-youtube-play text-danger mx-2"></i>YT</a>
            <form class="form-inline mx-auto" action="search.jsp">
                <input class="form-control bg-dark text-light" id="searchbox" name="search" type="search" placeholder="Search" aria-label="search">
                <button class="btn bg-light text-dark" id="searchbutton" type="submit"><i class="fa fa-search"></i></button>
            </form>
            <i class="fa fa-upload text-light mx-2 upload"></i>
<%
            if(email!=null){
%>
            <a href="#" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="userimages/<%=rs.getString("code")%>.jpg" style="height:30px;width:30px" class="rounded-circle"></a>
            <div class="dropdown-menu" id="dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="channel.jsp?id=<%=code%>"> Your Channel</a>
                <div class="dropdown-divider"></div>
                <div class="dropdown-item signout" style="cursor: pointer">Sign Out</div>
            </div>
<%
            } else{
%>
            <button class="btn btn-primary ml-2 signin">Sign In</button>
<%
            }
%>
        </nav>
        <div class="modal" id="login">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Login</h4>
                        <button type="button" class="close" data-dismiss="modal" style="color:black">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div id="lg_msg"></div>
                        <label>Email</label>
                        <input type="text" id="email" class="form-control"><br>
                        <label>Password</label>
                        <input type="password" id="pass" class="form-control"><br>
                        <button class="btn btn-danger" id="submit" data-dismiss="modal">Login</button><br>
                    </div>
                    <div class="modal-footer">
                        <span>Don't have an account <i style="color:red;cursor:pointer" id="sg" data-dismiss="modal">Sign Up</i></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="signup">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Sign Up</h4>
                        <button type="button" class="close" data-dismiss="modal" style="color:black">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div id="lg_msg"></div>
                        <label>Name</label>
                        <input type="text" id="name" class="form-control"><br>
                        <label>Describe Yourself</label>
                        <input type="text" id="des" class="form-control"><br>
                        <label>Email</label>
                        <input type="email" id="email2" class="form-control"><br>
                        <label>Password</label>
                        <input type="password" id="pass2" class="form-control"><br>
                        <button class="btn btn-danger signup" id="submitt" data-dismiss="modal">Sign Up</button><br>
                    </div>
                    <div class="modal-footer">
                        <span>Already have an account <i style="color:red;cursor:pointer" id="si" data-dismiss="modal">Sign In</i></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="addimage2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Profile Image</h4>
                        <button type="button" class="close" data-dismiss="modal" style="color:black">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div id="lg_msg"></div>
                        <form method="post" ACTION="add_profile_img.jsp" name="uploadForm" ENCTYPE='multipart/form-data'>
                            <label>Select Image :</label>
                            <input type="file" name="uploadFile" size="40" class="form-control"><br>
                            <input type="submit" name="Submit" class="btn btn-primary" value="Submit">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="uploadvideo">
            <div class="modal-dialog">
                <div class="modal-content" style="width:80%;">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Details</h4>
                        <button type="button" class="close" data-dismiss="modal" style="color:black">&times;</button>
                    </div>
                    <div class="modal-body">
                        <label for="example-datetime-local-input" class="col-form-label">Video Name : </label>
                        <input class="form-control" type="Text" name="title" id="vidtitle">
                        <label for="example-datetime-local-input" class="col-form-label">Video Description : </label>
                        <textarea class="form-control" type="Text" name="descrip" id="viddescrip"></textarea>
                        <label for="example-datetime-local-input select" class="col-form-label">Video Category : </label><br>
                        <select class="form-control" name="category" id="selectcat">
<%
    ResultSet rs1=st.executeQuery("select * from category");
    while(rs1.next()){
%>
                            <option  value ="<%=rs1.getString("category")%>"><%=rs1.getString("category")%></option>
<%
    }
%>
                            <option  value="other">Other</option>
                        </select><br>
                        <div class="mb-3" id="other-textfield" style="display:none">
                            <label>Please Specify Category :</label>
                            <input type="text" class="form-control" id="other" name="other">
                        </div>
                        <input type="submit" class="btn btn-primary selvideo mb-5" data-dismiss="modal" value="Upload Details">
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="selectvideo">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Select Video</h4>
                        <button type="button" class="close" data-dismiss="modal" style="color:black">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form method="post" ACTION="add_video.jsp?id=<%=code%>" name="uploadForm" ENCTYPE='multipart/form-data'>
                            <label>Add Video</label>
                            <input type="file" name="uploadFile" size="40">
                            <input type="submit" class="btn btn-primary mt-3" name="Submit" value="Submit">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
    }
    catch(Exception e){
        out.print(e.getMessage());
    }
%>