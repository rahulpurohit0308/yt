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
                        $('.deletereply1').click(function(){
                            var id = $(this).attr("rel");
                            $.post("deletecomment.jsp",{id:id});
                            $("#"+id).fadeOut(1000);                          
                        })
                        $('.editreply1').click(function(){
                            var id = $(this).attr("rel");
                            $(this).addClass("d-none");
                            $(".fixreply1").addClass("d-none");
                            $(".editreplyy1").removeClass("d-none");
                            $(".editreplyy1").focus();
                            $(".updatereply1").removeClass("d-none");
                            $('.updatereply1').click(function(){
                                var comment = $(".editreplyy1").val();
                                $.post("updatecomment.jsp",{code:id,comment:comment});
                                $(this).addClass("d-none");
                                $(".fixreply1").removeClass("d-none");
                                $(".fixreply1").text(comment);
                                $(".editreplyy1").addClass("d-none");
                                $(".editreply1").removeClass("d-none");
                            })
                        })
                    })
                </script>
            </head>
            <body>
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
        int sn=0;
        ResultSet rs=st.executeQuery("select MAX(sn) from comment");
        if(rs.next()){
            sn=rs.getInt(1);
        }
        ResultSet rs1=st.executeQuery("select * from users where code='"+user_code+"'");
            while(rs1.next()){
                replyusername=rs1.getString("name");
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
        if(ps.executeUpdate()>0){
%>
                <div class="row pl-5 mt-4" id="<%=code%>" style="justify-content:space-between">
                    <div class="row ml-5">
                        <a href="channel.jsp?id=<%=user_code%>"><img src="userimages/<%=user_code%>.jpg" style="height:50px;width:50px" class="rounded-circle"></a>
                        <div class="mt-1">
                            <h6 class="ml-3" style="line-height: 10px"><u><%=replyusername%></u></h6>
                            <p class="ml-3 fixreply1"><%=commentreply%></p>
                            <input class="underline-input editreplyy1 d-none ml-3" value="<%=commentreply%>">
                            <div class="row ml-3"><div class="likes2 likes2<%=code%>">0</div><span class="fa fa-thumbs-up likecmnt2 likecmnt2<%=code%> mx-1 mt-1" rel="<%=code%>"></span>|<span class="fa fa-thumbs-down dislikecmnt2 dislikecmnt2<%=code%> mx-1 mt-1" rel="<%=code%>"></span>|<span class="fa fa-reply replycmnt2 mx-1 mt-1" rel="<%=code%>"></span></div>
                        </div>
                    </div>
                    <div class="row">
                        <span class="fa fa-pencil editreply1 mr-3" rel="<%=code%>"></span><span class="fa fa-check updatereply1 d-none mr-3" rel="<%=code%>"></span><span class="fa fa-trash deletereply1 mx-5" rel="<%=code%>"></span>
                    </div>
                </div>
                <div class="replydiv3 replydiv3<%=code%> d-none ml-5 pl-5 mt-2" id="<%=code%>">
                    <img src="userimages/<%=user_code%>.jpg" style="height:40px;width:40px" class="rounded-circle">
                    <input class="underline-input creply3 creply3<%=parentcode%> ml-3" id="<%=parentcode%>" style="width: 60%" placeholder="Add reply...">
                    <button class="btn btn-secondary ccanbtn3 ccanbtn3<%=parentcode%> ml-2" id="<%=parentcode%>">Cancel</button>
                    <button class="btn btn-primary creplybtn3 creplybtn3<%=parentcode%> ml-2" id="<%=parentcode%>">Reply</button>
                </div>
                <div class="repliess3 repliess3<%=code%> d-none"></div>
            <script>
                $(document).ready(function(){
                    var usercode = "<%=user_code%>";
                    var vidcode = "<%=vidcode%>";
                    $(".likecmnt2").click(function(){
                        var id = $(this).attr("rel");
                        $.post("commentlike.jsp",{commentcode:id,usercode:usercode},function(data){
                            if(data==1){
                                $(".likes2"+id).text(1);
                                $(".likecmnt2"+id).addClass("text-primary");
                                $(".dislikecmnt2"+id).removeClass("text-danger");
                            }
                            else{
                                $(".likes2"+id).text(0);
                                $(".likecmnt2"+id).removeClass("text-primary");
                                $(".dislikecmnt2"+id).removeClass("text-danger");
                            }
                        });
                    })
                    $(".dislikecmnt2").click(function(){
                        var id = $(this).attr("rel");
                        $.post("commentdislike.jsp",{commentcode:id,usercode:usercode},function(data){
                            if(data==0){
                                $(".likes2"+id).text(0);
                                $(".likecmnt2"+id).removeClass("text-primary");
                                $(".dislikecmnt2"+id).addClass("text-danger");
                            }
                            else if(data==1){
                                $(".likes2"+id).text(0);
                                $(".likecmnt2"+id).removeClass("text-primary");
                                $(".dislikecmnt2"+id).addClass("text-danger");
                            }
                            else{
                                $(".likes2"+id).text(0);
                                $(".likecmnt2"+id).removeClass("text-primary");
                                $(".dislikecmnt2"+id).removeClass("text-danger");
                            }
                        });
                    })
                    var id ="";
                    $(".replycmnt2").click(function(){
                        id = $(this).attr("rel");
                        $(".replydiv3"+id).removeClass("d-none");
                        $(".creply3"+id).focus();
                        $(".ccanbtn3"+id).click(function(){
                            $(".creply3"+id).clear();
                            $(".replydiv3"+id).addClass("d-none");
                        })
                    })
                    $(".creplybtn3"+id).click(function(){
                        var reply = $(".creply3"+id).val();
                        $(".replydiv3"+id).addClass("d-none");
                        $.post("addcmntreply.jsp",{id:id,vidcode:vidcode,code:usercode,cmntreply:reply},function(data){
                            $(".repliess3"+id).prepend(data);
                        });
                    })
                })
                
            </script>
            </body>
        </html>
<%
        }
    }
    catch(Exception er){
        out.println(er.getMessage());
    }
%>