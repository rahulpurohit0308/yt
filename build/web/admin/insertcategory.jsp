<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    String category = request.getParameter("cat");
    LinkedList l = new LinkedList();
    for (int i = 0; i <= 9; i++) {
        l.add(i + "");
    }
    for (char c = 'A'; c <= 'Z'; c++) {
        l.add(c + "");
    }
    for (char c = 'a'; c <= 'z'; c++) {
        l.add(c + "");
    }
    Collections.shuffle(l);
    String code = "";
    for (int i = 0; i < 8; i++) {
        code = code + l.get(i);
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt", "root", "");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select MAX(sn) from category");
        int sn = 0;
        if (rs.next()) {
            sn = rs.getInt(1);
        }
        sn++;
        code=code+"_"+sn;
        PreparedStatement ps = cn.prepareStatement("insert into category values (?,?,?)");
        ps.setInt(1, sn);
        ps.setString(2, code);
        ps.setString(3, category);
        if (ps.executeUpdate() > 0){
            out.print("Success");
        }
    } catch (Exception er) {
        out.print(er.getMessage());
    }
%>