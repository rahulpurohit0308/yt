<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        String code="";
        String parentcode=request.getParameter("id");
        String vidcode=request.getParameter("vidcode");
        String user_code=request.getParameter("code");
        String commentreply=request.getParameter("cmntreply");
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
        int sn=0;
        ResultSet rs=st.executeQuery("select MAX(sn) from comment");
        if(rs.next()){
            sn=rs.getInt(1);
        }
        sn++;
        code=code+"_"+sn;
        PreparedStatement ps = cn.prepareStatement("insert into comment values (?,?,?,?,?,?)");
        ps.setInt(1,sn);
        ps.setString(2,code);
        ps.setString(3,parentcode);
        ps.setString(4,vidcode);
        ps.setString(5,user_code);
        ps.setString(6,commentreply);
        out.print(sn+" "+code+" "+parentcode+" "+vidcode+" "+user_code+" "+commentreply);
        ps.executeUpdate();
    }
    catch(Exception er){
        out.println(er.getMessage());
    }
%>