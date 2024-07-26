<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    String video_code=request.getParameter("vidcode");
    String user_code=request.getParameter("usercode");
    int sn =0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("select MAX(sn) from history");
            if(rs.next()){
                sn=rs.getInt(1);
            }
            sn++;
            ResultSet rs1=st.executeQuery("select * from watchlater where vidcode='"+video_code+"' and usercode='"+user_code+"'");
            if(rs1.next()){
                PreparedStatement ps=cn.prepareStatement("delete from watchlater where vidcode='"+video_code+"' and usercode='"+user_code+"'");
                ps.executeUpdate();
                out.print(1);
            }
            else{
                PreparedStatement ps = cn.prepareStatement("insert into watchlater values (?,?,?)");
                ps.setInt(1,sn);
                ps.setString(2,video_code);
                ps.setString(3,user_code);
                ps.executeUpdate();
                out.print(2);
            }
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
%>