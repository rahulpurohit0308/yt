<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    String usercode = request.getParameter("code");
    String code = request.getParameter("usercode");
    try{
        int res=0;
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        ResultSet rs=st.executeQuery("select count(*) as p from subs where user_code='"+usercode+"' and channel_code='"+code+"'");
        if(rs.next()){
            res = rs.getInt("p");
        }
        if(res==0){
            PreparedStatement ps = cn.prepareStatement("insert into subs values (?,?)");
            ps.setString(1, code);
            ps.setString(2, usercode);
            ps.executeUpdate();
            out.print("Subscribed");
        }
        else{
            PreparedStatement ps1 = cn.prepareStatement("delete from subs where channel_code='"+code+"' and user_code='"+usercode+"'");
            ps1.executeUpdate();
            out.print("Unsubscribed");
        }
        cn.close();
    }
    catch(Exception er){
        out.println(er.getMessage());
    }
%>