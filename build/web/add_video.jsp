<%@ page import="java.io.*,java.sql.*" %>
<%
String contentType = request.getContentType();

String code=null;
String user_code=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
Statement st=cn.createStatement();
ResultSet rs1 = st.executeQuery("select * from video where user_code='"+user_code+"' order by dt desc");
if(rs1.next()){
    code=rs1.getString("code");
}
String imageSave=null;
byte dataBytes[]=null;
String saveFile=null;
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
{
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
dataBytes = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength)
{
byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
totalBytesRead += byteRead;
}
/*String code="";
try{
    ....
    ...
    ....
ResultSet rs=st.executeQuery("select code from table_name where email='"+email+"'");
if(rs.next()){
    code=rs.getString(1);
}

} 
catch(Exception er){
    
}*/
String file = new String(dataBytes);
/*saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));*/
 saveFile = code+".mp4";
// out.print(dataBytes);
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1, contentType.length());
// out.println(boundary);
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
    try{
        FileOutputStream fileOut = new FileOutputStream(request.getRealPath("/")+"/video/"+saveFile);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
        fileOut.close();
        response.sendRedirect("index.jsp?id="+code+"&success=1");
    }catch (Exception e){
        imageSave="Failure";
    }
}
out.println(imageSave);
%>