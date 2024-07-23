<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
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
    String code="";
    for (int i=0;i<8;i++){
        code=code+l.get(i);
    }
    try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
          Statement st=cn.createStatement();
          int sn=0;
          ResultSet rs=st.executeQuery("select MAX(sn) from users");
          if(rs.next()){
              sn=rs.getInt(1);
          }
          sn++;
          code=code+"_"+sn;
          String name=request.getParameter("name");
          String des=request.getParameter("des");
          String email=request.getParameter("email");
          String password=request.getParameter("pass");
          int status = 1;
          PreparedStatement ps = cn.prepareStatement("insert into users values (?,?,?,?,?,?,?)");
          ps.setInt(1,sn);
          ps.setString(2,code);
          ps.setString(3,name);
          ps.setString(4,des);
          ps.setString(5,email);
          ps.setString(6,password);
          ps.setInt(7,status);
          if(ps.executeUpdate()>0){
              out.print("Success");
          }
    }
    catch(Exception er){
        out.println(er.getMessage());
    }
         
%>