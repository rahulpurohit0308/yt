<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                <link rel="stylesheet" href="style.css">
                <link rel="stylesheet" href="video_style.css">
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                <script src="jquery-3.6.4.min.js"></script>
                <script>
                    $(document).ready(function(){
                        $('.delcmntreply').click(function(){
                            var id = $(this).attr("rel");
                            $.post("deletecommentreply.jsp",{id:id});
                            $("#"+id).fadeOut(1000);                          
                        })
                    })
                </script>
            </head>
            <body>
<%
    String code="";
    String dt = new java.util.Date() + "";
    String commentcode=request.getParameter("id");
    String user_code=request.getParameter("code");
    String commentreply=request.getParameter("cmntreply");
    String replyusername="";
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
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/yt","root","");
            Statement st=cn.createStatement();
            int sn=0;
            ResultSet rs1=st.executeQuery("select * from users where code='"+user_code+"'");
            while(rs1.next()){
                replyusername=rs1.getString("name");
            }
            ResultSet rs=st.executeQuery("select MAX(sn) from commentreply");
            if(rs.next()){
                sn=rs.getInt(1);
            }
            sn++;
            code=code+"_"+sn;
            PreparedStatement ps = cn.prepareStatement("insert into commentreply values (?,?,?,?,?,?)");
            ps.setInt(1,sn);
            ps.setString(2,code);
            ps.setString(3,commentcode);
            ps.setString(4,user_code);
            ps.setString(5,commentreply);
            ps.setString(6,dt);
            if(ps.executeUpdate()>0){
%>
            <div class="row mt-3 comments" id="<%=code%>">
                    <a href="channel.jsp?id=<%=user_code%>"><img src="userimages/<%=user_code%>.jpg" class="rounded-circle userimg ml-3"></a>
                    <div class="col">
                        <h6><%=replyusername%></h6>
                        <p><%=commentreply%></p>
                        <div class="row"><div class="cmntlikes mx-1">0 <i class="fa fa-thumbs-up likecmnt" data-commentcode="<%=code%>"></i></div>|<i class="fa fa-thumbs-down dislikecmnt mx-1"></i> | <label class="reply mx-1">Reply</label></div>
                    </div>
                </div>
<%
            }
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
%>
            </body>
        </html>
