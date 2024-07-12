<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
            Cookie c[]=request.getCookies();
            String code=request.getParameter("id");
            String email=null;
            for(int i=0;i<c.length;i++){
                if(c[i].getName().equals("login")){
                    email=c[i].getValue();
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
                    ResultSet rs=st.executeQuery("select * from category where code='"+code+"'");
                    if(rs.next()){
%>
            <div class="col-8 col-md-5 col-lg-5 col-xl-8 mx-auto card">
                <label for="example-datetime-local-input" class="col-form-label">Update Category : </label>
                <input class="form-control" type="Text" name="category" value="<%=rs.getString("category")%>" id="catt">
                <input type="submit" class="btn btn-success m-2 updatecat" value="Update">
            </div> 
<%
                    }
                    else{
                        response.sendRedirect("dashboard.jsp?invalid=1");
                    }
                    cn.close();
                }
                catch(Exception er){
                    response.sendRedirect(er.getMessage());
                }
            }
        }
        catch(Exception e){
            out.println("index.jsp");
        }
        %>
    </body>
</html>