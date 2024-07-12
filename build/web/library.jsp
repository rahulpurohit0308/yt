<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.io.*" pageEncoding="UTF-8"%>
<%
    String email=null;
    String code=null;
    int n=0;
    int p=0;
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
            <div class="mainarea ml-2 mt-2">
<%
    ResultSet rs4 = st.executeQuery("select count(*) as p from playlist where usercode='"+code+"' and privacy='public'");   
    if(rs4.next()){
        n=rs4.getInt("p");
    }
    if(n!=0){
%>
                <h3 class="text-center"><i><u>Public Playlists</u></i></h3>
                <div class="row">
<%
        ResultSet rs2 = st1.executeQuery("select * from playlist where usercode='"+code+"' and privacy='public'");
        while(rs2.next()){
%>
                    <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                        <a href="playlist.jsp?id=<%=rs2.getString("code")%>">
                            <img src="playlist/<%=rs2.getString("code")%>.jpg" style="height:auto;width: 100%;border-radius: 5px">
                        </a>
                        <div class="text-center mt-1">
                            <a class="text-dark" href="playlist.jsp?id=<%=rs2.getString("code")%>"><h6><%=rs2.getString("playlist")%></h6></a>
                        </div>
                    </div>
<%
        }
%>
                </div><br>
<%
    }
    ResultSet rs5 = st.executeQuery("select count(*) as p from playlist where usercode='"+code+"' and privacy='private'");   
    if(rs5.next()){
        p=rs5.getInt("p");
    }
    if(p!=0){
%>
                <h3 class="text-center"><i><u>Private Playlists</u></i></h3><br>
                <div class="row">
<%
        ResultSet rs3 = st1.executeQuery("select * from playlist where usercode='"+code+"' and privacy='private'");
        while(rs3.next()){
%>
                    <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                        <a href="playlist.jsp?id=<%=rs3.getString("code")%>">
                            <img src="playlist/<%=rs3.getString("code")%>.jpg" style="height:auto;width: 100%;border-radius: 5px">
                        </a>
                        <div class="text-center mt-1">
                            <a class="text-dark" href="playlist.jsp?id=<%=rs3.getString("code")%>"><h6><%=rs3.getString("playlist")%></h6></a>
                        </div>
                    </div>
<%
        }
%>
                </div>
<%
        }
        if((n+p)==0){
%>
            <div class="row" style="height:80vh">
                <div class='mx-auto my-auto'>
                    <div class='row'><span class="fa fa-exclamation-circle mx-auto" style='font-size:100px'></span></div>
                    <div class='row'><h6 class='mx-auto'>There aren't any playlists</h6></div>
                    <div class='row'><p class='mx-auto'>You can separate Private & Public Playlists.</p></div>
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
            out.println(e.getMessage());
        }
%>