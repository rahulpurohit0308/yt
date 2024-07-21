<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    try{
        String playlist = request.getParameter("playlist");
        String privacy = request.getParameter("privacy");
        String usercode = request.getParameter("usercode");
        String dt = new java.util.Date() + "";        
        int sn=0;
        String code="";
        LinkedList l = new LinkedList();
        for(int i=0;i<=9;i++){
            l.add(i+"");
        }
        for(char c='A';c<='Z';c++){
            l.add(c+"");
        }
        for(char c='a';c<='z';c++){
            l.add(c+"");
        }
        Collections.shuffle(l);
        for (int i=0;i<8;i++){
            code=code+l.get(i);
        }
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        ResultSet rs=st.executeQuery("select MAX(sn) from playlist");
        if(rs.next()){
            sn=rs.getInt(1);
        }
        sn++;
        code=code+"_"+sn;
        PreparedStatement ps1=cn.prepareStatement("insert into playlist values (?,?,?,?,?,?)");
        ps1.setInt(1,sn);
        ps1.setString(2,code);
        ps1.setString(3,dt);
        ps1.setString(4,usercode);
        ps1.setString(5,playlist);
        ps1.setString(6,privacy);
        ps1.executeUpdate();
        out.print(playlist);
    } catch (Exception er) {
        out.println(er.getMessage());
    }

%>