<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    String commentcode = request.getParameter("commentcode");
    String usercode = request.getParameter("usercode");
    try{
        int status=2;
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        ResultSet rs1=st.executeQuery("select * from commentlikes where usercode='"+usercode+"' and commentcode='"+commentcode+"'");
        if(rs1.next()){
            status = rs1.getInt("status");
        }
        if(status==2){
            PreparedStatement ps = cn.prepareStatement("insert into commentlikes values (?,?,?)");
            ps.setString(1, commentcode);
            ps.setString(2, usercode);
            ps.setInt(3, 1);
            if(ps.executeUpdate()>0){
                out.print(1);
            }
        }
        else if(status==0){
            PreparedStatement ps1 = cn.prepareStatement("update commentlikes set status=? where usercode=? and commentcode=?");
            ps1.setInt(1, 1);
            ps1.setString(2, usercode);
            ps1.setString(3, commentcode);
            if(ps1.executeUpdate()>0){
                out.print(1);
            }
        }
        else{
            PreparedStatement ps2 = cn.prepareStatement("delete from commentlikes where usercode='"+usercode+"' and commentcode='"+commentcode+"'");
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