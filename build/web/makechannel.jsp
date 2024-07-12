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
                String code=request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
                if(rs.next()){
%>
            <!DOCTYPE html>
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                    <link rel="stylesheet" href="style.css">
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                    <title>JSP Page</title>
                </head>
                <body class="bg-dark">
                    <div class="container bg-light rounded mt-5">
                        <div class="row col-sm-11 mx-auto">
                            <h4 class="mr-auto mt-4">First Make your Channel</h4>
                            <a href="home.jsp"><i class="fa fa-times text-dark mt-4"></i></a>
                        </div><hr><br><br>
                        <div class="row col-sm-9 mx-auto">
                            <div class="card-body">
                                <form method="post" action="publishchannel.jsp?id=<%=rs.getString("code")%>">
                                    <div class="form-group">
                                        <label for="example-datetime-local-input" class="col-form-label">Channel Name : </label>
                                        <input class="form-control" type="Text" name="name" id="example-datetime-local-input">
                                        <label for="example-datetime-local-input" class="col-form-label">Channel Description : </label>
                                        <input class="form-control" type="Text" name="descrip" id="example-datetime-local-input">
                                    </div>
                                        <input type="submit" class="btn btn-primary mb-5" style="margin-left: 330px; margin-top: 35px" value="Publish Channel">
                                </form>
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
