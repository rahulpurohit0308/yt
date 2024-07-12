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
                    String code = request.getParameter("id");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
                    Statement st=cn.createStatement();
                    Statement st1=cn.createStatement();
                    Statement st2=cn.createStatement();
                    ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
                    if(rs.next()){
    
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="video_style.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function() {
                $('.menu-btn').click(function() {
                  $('.sidebar').toggleClass('active');
                });
              });
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content">
                  <div class="row mt-5 pt-3 ml-3">
                        <div class="video-container col-8">
                              <div class="video-item">
                                  <video id="myVideo" controls>
                                      <source src="video/<%=code%>.mp4" type="video/mp4">
                                  </video>
                              </div>
                                  <div class="title">
                        <%
                                ResultSet rs4 = st.executeQuery("select * from video where code='"+code+"'");
                                while(rs4.next()){
                                    String usercode1 = rs4.getString("user_code");
                                    ResultSet rs5 = st1.executeQuery("select * from users where code='"+usercode1+"'");
                                    while(rs5.next()){
                        %>
                            <h5><%=rs4.getString("title")%></h5>
                            <p style="font-size:14px"><%=rs4.getString("dt")%></p>
                            <div class="row ml-1">
                                <a href="channel.jsp?id=<%=usercode1%>"><img src="userimages/<%=rs5.getString("code")%>.jpg" style="height:50px;width:50px" class="rounded-circle"></a>
                                <p style="font-size:20px; margin-left: 15px;margin-top:8px"><%=rs5.getString("name")%></p>
                                <button class="subscribe-button ml-2 bg-danger">Subscribe</button>
                                <button class="like-button"><i class="fa fa-thumbs-up"></i></button>
                                <button class="dislike-button"><i class="fa fa-thumbs-down"></i></button>
                                <button class="share-button"><i class="fa fa-clock"></i></button>                                
                                <a href="playlist.jsp?id=<%=code%>" class="text-dark"><button class="playlist-button"><i class="fa fa-plus"></i></button></a>
                            </div>
                        <%
                                }
                            }
                        %>
                        </div>
                    </div>
                        <div col-1></div>
                        <div class="mt-2 col-4 ml-4">
                        <%
                                ResultSet rs2 = st.executeQuery("select * from video where code <> '"+code+"' order by RAND()");
                                while(rs2.next()){
                                String usercode2 = rs2.getString("user_code");
                                String title = rs2.getString("title");
                                String dt = rs2.getString("dt");
                        %>
                            <div class="row">
                                <div class="video-item">
                                    <a class="text-dark" href="video.jsp?id=<%=rs2.getString("code")%>">
                                        <video class="vid" style=" border-radius: 7px;">
                                                <source src="video/<%=rs2.getString("code")%>.mp4" type="video/mp4" controls muted>
                                        </video>
                                    </a>
                                </div>
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
                response.sendRedirect("index.jsp");
            }
%>