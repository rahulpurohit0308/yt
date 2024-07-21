<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    String vidcode=request.getParameter("vidcode");
    String channelcode=request.getParameter("channelcode");
    int views = 0;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from views where vidcode='"+vidcode+"' and channelcode='"+channelcode+"'");
        if(rs.next()){
            views = rs.getInt("views");
        }
        if(views==0){
            PreparedStatement ps=cn.prepareStatement("insert into views values(?,?,?)");
            ps.setString(1,vidcode);
            ps.setString(2,channelcode);
            ps.setInt(3,1);
            ps.executeUpdate();
        }
        else{
            PreparedStatement ps1=cn.prepareStatement("update views set views=? where vidcode=? and channelcode=?");
            ps1.setInt(1,views+1);
            ps1.setString(2,vidcode);
            ps1.setString(3,channelcode);
            ps1.executeUpdate();
        }
        cn.close();
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
%>