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
                        $('.deletecmnt1').click(function(){
                            var id = $(this).attr("rel");
                            $.post("deletecomment.jsp",{id:id});
                            $("#"+id).fadeOut(1000);                          
                        })
                        $('.editcmnt1').click(function(){
                            var id = $(this).attr("rel");
                            $(this).addClass("d-none");
                            $(".fixcomment1").addClass("d-none");
                            $(".editcomment1").removeClass("d-none");
                            $(".editcomment1").focus();
                            $(".updatecmnt1").removeClass("d-none");
                            $('.updatecmnt1').click(function(){
                                var comment = $(".editcomment1").val();
                                $.post("updatecomment.jsp",{code:id,comment:comment});
                                $(this).addClass("d-none");
                                $(".fixcomment1").removeClass("d-none");
                                $(".fixcomment1").text(comment);
                                $(".editcomment1").addClass("d-none");
                                $(".editcmnt1").removeClass("d-none");
                            })
                        })
                    })
                </script>
            </head>
            <body>
<%
    String code="";
    String dt = new java.util.Date() + "";
    String video_code=request.getParameter("id");
    String user_code=request.getParameter("code");
    String comment=request.getParameter("cmnt");
    String pc = request.getParameter("pc");
    String commentusername="";
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
                commentusername=rs1.getString("name");
            }
            ResultSet rs=st.executeQuery("select MAX(sn) from comment");
            if(rs.next()){
                sn=rs.getInt(1);
            }
            sn++;
            code=code+"_"+sn;
            PreparedStatement ps = cn.prepareStatement("insert into comment values (?,?,?,?,?,?)");
            ps.setInt(1,sn);
            ps.setString(2,code);
            ps.setString(3,pc);
            ps.setString(4,video_code);
            ps.setString(5,user_code);
            ps.setString(6,comment);
            if(ps.executeUpdate()>0){
%>
                <div class="row mt-4" id="<%=code%>" style="justify-content:space-between">
                    <div class="row ml-5">
                        <a href="channel.jsp?id=<%=user_code%>"><img src="userimages/<%=user_code%>.jpg" style="height:50px;width:50px" class="rounded-circle"></a>
                        <div class="mt-1">
                            <h6 class="ml-3" style="line-height: 10px"><u><%=commentusername%></u></h6>
                            <p class="ml-3 fixcomment1"><%=comment%></p>
                            <input class="underline-input editcomment1 d-none ml-3" value="<%=comment%>">
                            <div class="row ml-3"><div class="likes1">0</div><span class="fa fa-thumbs-up likecmnt1 mx-1 mt-1" rel="<%=code%>"></span>|<span class="fa fa-thumbs-down dislikecmnt1 mx-1 mt-1" rel="<%=code%>"></span>|<span class="fa fa-reply mx-1 mt-1"></span></div>
                        </div>
                    </div>
                    <div class="row">
                        <span class="fa fa-pencil editcmnt1 mr-3" rel="<%=code%>"></span><span class="fa fa-check updatecmnt1 d-none mr-3" rel="<%=code%>"></span><span class="fa fa-trash deletecmnt1 mx-5" rel="<%=code%>"></span>
                    </div>
                </div>
            <script>
                $(document).ready(function(){
                    var usercode = "<%=user_code%>";
                    $(".likecmnt1").click(function(){
                        var id = $(this).attr("rel");
                        $.post("commentlike.jsp",{commentcode:id,usercode:usercode},function(data){
                            if(data==1){
                                var likes = Number($(".likes1").text());
                                $(".likes1").text(likes+1);
                                $(".likecmnt1").addClass("text-primary");
                                $(".dislikecmnt1").removeClass("text-danger");
                            }
                            else{
                                var likes = Number($(".likes1").text());
                                $(".likes1").text(likes-1);
                                $(".likecmnt1").removeClass("text-primary");
                                $(".dislikecmnt1").removeClass("text-danger");
                            }
                        });
                    })
                    $(".dislikecmnt1").click(function(){
                        var id = $(this).attr("rel");
                        $.post("commentdislike.jsp",{commentcode:id,usercode:usercode},function(data){
                            if(data==0){
                                var likes = Number($(".likes1").text());
                                $(".likes1").text(likes);
                                $(".likecmnt1").removeClass("text-primary");
                                $(".dislikecmnt1").addClass("text-danger");
                            }
                            else if(data==1){
                                var likes = Number($(".likes1").text());
                                $(".likes1").text(likes-1);
                                $(".likecmnt1").removeClass("text-primary");
                                $(".dislikecmnt1").addClass("text-danger");
                            }
                            else{
                                var likes = Number($("likes1"+id).text());
                                $(".likes1").text(likes);
                                $(".likecmnt1").removeClass("text-primary");
                                $(".dislikecmnt1").removeClass("text-danger");
                            }
                        });
                    })
                })
                
            </script>
            </body>
        </html>
<%
            };
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
%>