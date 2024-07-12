<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
<%
    String email=null;
    String code=null;
    String vidcode=null;
    String usercode=null;
    String usercode1=null;
    Cookie c[]=request.getCookies();
    for(int i=0; i<c.length; i++){
        if(c[i].getName().equals("login")){
            email = c[i].getValue();
            break;
        }
    }
    String plcode=request.getParameter("id");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        Statement st1=cn.createStatement();
        Statement st2=cn.createStatement();
        ResultSet rs3=st.executeQuery("select * from users where email='"+email+"'");
        if(rs3.next()){
            code=rs3.getString("code");
        }
        ResultSet rs = st.executeQuery("select * from playlist where code='"+plcode+"'");
        while(rs.next()){
            usercode=rs.getString("usercode");
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
                <div class="row mx-1 d-flex" style="justify-centent:space-between">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 col-xl-4 text-center" style="border-radius: 5px;">
                        <div class="bg-secondary p-3">
                            <img src="playlist/<%=plcode%>.jpg" style="width:100%;height:auto;border-radius:5px;" class="mt-2">
                            <div class="row ml-4 d-flex" style="justify-content:space-between">
                                <h4 class="mt-2 text-light" id="plname"><i><%=rs.getString("playlist")%></i></h4>
                                <span class="ml-auto mr-5 fa fa-trash-o ml-4 text-light mt-3" style=""></span>
                            </div>
<%
            ResultSet rs1 = st1.executeQuery("select * from users where code='"+usercode+"'");
            while (rs1.next()){
%>
                            <h5 class="text-light text-left ml-4"><b><u><%=rs1.getString("name")%></u></b></h5>
<%
            }
        }
%>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-7 col-xl-7 ml-1 text-center mt-1" style="border-radius: 5px">
<%
        ResultSet rs1 = st.executeQuery("select * from playlistvideos where playlistcode='"+plcode+"'");
        while(rs1.next()){
            vidcode = rs1.getString("vidcode");
%>
<div class="bg-secondary p-3">
<div class="row mt-2 <%=vidcode%>">
    <div class="col-4">
        <a href="video.jsp?id=<%=vidcode%>">
            <video style="border-radius: 5px;">
                <source src="video/<%=vidcode%>.mp4" type="video/mp4">
            </video>
        </a>
    </div>
    <div class="col d-flex" style="justify-content:space-between">
<%
            ResultSet rs2 = st1.executeQuery("select * from video where code='"+vidcode+"'");
            while (rs2.next()){
                usercode1 = rs2.getString("user_code");
%>
    <div class="col">
        <a href="video.jsp?id=<%=rs2.getString("code")%>"><h5 class="text-light text-center"><%=rs2.getString("title")%></h5></a>
<%
            ResultSet rs4 = st2.executeQuery("select * from users where code='"+usercode1+"'");
            while(rs4.next()){
%>
            <p class="text-light"><%=rs4.getString("name")%></p>
    </div>
<%
            }
        }
        if(code.equals(usercode)){
%>
        <span class="fa fa-trash text-light ml-auto" style=""></span><hr>
<%
            }
%>
    </div>
</div>
</div>
<%
    }
%>
                    </div>
                </div>
            </div>
        </div>  
        <script>
            $(document).ready(function(){   
                var plcode = "<%=plcode%>";
                $(".fa-trash").click(function(){
                    var vidcode = "<%=vidcode%>";
                    $.post("deletefrompl.jsp",{vidcode:vidcode,plcode:plcode});
                    $(".<%=vidcode%>").fadeOut(1000);
                })
                $(".fa-trash-o").click(function(){
                    var plcode = "<%=plcode%>";
                    $.post("deleteplaylist.jsp",{plcode:plcode});
                    window.location.href = 'library.jsp';
                })
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