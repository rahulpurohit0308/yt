<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    String usercode = request.getParameter("usercode");
    String vidcode = request.getParameter("vidcode");
    try{
        int status=2;
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        ResultSet rs1=st.executeQuery("select * from likes where usercode='"+usercode+"' and vidcode='"+vidcode+"'");
        if(rs1.next()){
            status = rs1.getInt("status");
        }
        if(status==2){
            PreparedStatement ps = cn.prepareStatement("insert into likes values (?,?,?)");
            ps.setString(1, usercode);
            ps.setString(2, vidcode);
            ps.setInt(3, 1);
            if(ps.executeUpdate()>0){
                out.print(1);
            }
        }
        else if(status==0){
            PreparedStatement ps1 = cn.prepareStatement("update likes set status=? where usercode=? and vidcode=?");
            ps1.setInt(1, 1);
            ps1.setString(2, usercode);
            ps1.setString(3, vidcode);
            if(ps1.executeUpdate()>0){
                out.print(1);
            }
        }
        else{
            PreparedStatement ps2 = cn.prepareStatement("delete from likes where usercode='"+usercode+"' and vidcode='"+vidcode+"'");
            if(ps2.executeUpdate()>0){
                out.print(2);
            }
        }
        cn.close();
    }
    catch(Exception er){
        out.println(er.getMessage());
    }
%>