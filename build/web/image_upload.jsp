<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>  
        <%
           String code = request.getParameter("id");
        %>
            <form method="post" ACTION="upload_image.jsp?id=<%=code%>" name="uploadForm" ENCTYPE='multipart/form-data'>
                Image <input type="file" name="uploadFile" size="40" style="border:1px solid black;">
                <input type="submit" value="Submit">
            </form>
    </body>
</html>