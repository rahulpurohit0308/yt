<%-- 
    Document   : add_video_file
    Created on : 17 Apr, 2023, 3:06:31 PM
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           String code = request.getParameter("id");
           int sn=Integer.parseInt(request.getParameter("sn"));
        %>
        <form method="post" ACTION="add_video.jsp?id=<%=code%>&sn=<%=sn%>" name="uploadForm" ENCTYPE='multipart/form-data'>
            Add Video <input type="file" name="uploadFile" size="40" style="border:1px solid black;">
            <input type="submit" name="Submit" style="border:1px solid black;" value="Submit">
        </form>
    </body>
</html>