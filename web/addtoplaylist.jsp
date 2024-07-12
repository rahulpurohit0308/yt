<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    try{
        int count=0;
        String code="";
        String playlist = request.getParameter("playlist");
        String video_code=request.getParameter("vidcode");
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        ResultSet rs2=st.executeQuery("select * from playlist where playlist='"+playlist+"'");
        while(rs2.next()){
            code = rs2.getString("code");
        }
        ResultSet rs3=st.executeQuery("select count(*) as p from playlistvideos where playlistcode='"+code+"' and vidcode='"+video_code+"'");
        if (rs3.next()){
            count=rs3.getInt("p");
        }
        if(count==0){
            PreparedStatement ps1=cn.prepareStatement("insert into playlistvideos values (?,?)");
            ps1.setString(1,code);
            ps1.setString(2,video_code);
            ps1.executeUpdate();
        }
    } catch (Exception er) {
        out.println(er.getMessage());
    }

%>