<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    String video_code=request.getParameter("vidcode");
    String user_code=request.getParameter("usercode");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("select * from watchlater where vidcode='"+video_code+"' and usercode='"+user_code+"'");
            if(rs.next()){
                PreparedStatement ps=cn.prepareStatement("delete from watchlater where vidcode='"+video_code+"' and usercode='"+user_code+"'");
                ps.executeUpdate();
                out.print(1);
            }
            else{
                PreparedStatement ps = cn.prepareStatement("insert into watchlater values (?,?)");
                ps.setString(1,video_code);
                ps.setString(2,user_code);
                ps.executeUpdate();
                out.print(2);
            }
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
%>