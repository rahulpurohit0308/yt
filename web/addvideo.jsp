<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
        Statement st=cn.createStatement();
        String category = request.getParameter("category");
        String title=request.getParameter("title");
        String descrip=request.getParameter("descrip");
        String categori=request.getParameter("categori");
        String dt = new java.util.Date() + "";
        String cat_code="";
        String user_code=request.getParameter("id");
        if(category.equals("other") ){
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
                int sn=0;
                ResultSet rs=st.executeQuery("select MAX(sn) from category");
                if(rs.next()){
                    sn=rs.getInt(1);
                }
                sn++;
                code=code+"_"+sn;
                PreparedStatement ps = cn.prepareStatement("insert into category values (?,?,?)");
                ps.setInt(1,sn);
                ps.setString(2,code);
                ps.setString(3,categori);
                ps.executeUpdate();
                cat_code = code;
            } catch(Exception er){
                out.println(er.getMessage());
            }
        }
        else{
            ResultSet rs2=st.executeQuery("select * from category where category='"+category+"'");
            while(rs2.next()){
                cat_code = rs2.getString("code");
            }
        }
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
                int sn=0;
                ResultSet rs=st.executeQuery("select MAX(sn) from video");
                if(rs.next()){
                    sn=rs.getInt(1);
                }
                sn++;
                code=code+"_"+sn;
                PreparedStatement ps1 = cn.prepareStatement("insert into video values (?,?,?,?,?,?,?)");
                ps1.setInt(1,sn);
                ps1.setString(2,code);
                ps1.setString(3,title);
                ps1.setString(4,descrip);
                ps1.setString(5,dt);
                ps1.setString(6,cat_code);
                ps1.setString(7,user_code);
                if(ps1.executeUpdate()>0){
                    out.print("Success");
                }
            } catch (Exception er) {
                out.println(er.getMessage());
            }
        } catch (Exception er) {
            out.println(er.getMessage());
        }
%>