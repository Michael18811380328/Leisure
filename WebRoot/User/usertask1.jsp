<%@ page import="com.dao.*" %>
<%@ page language="java" import="java.util.*" import="com.entity.*" import="com.dao.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String color="";
String front="";
String hanshu="";
String changdu="";
String wenzi="";

List<tasks> list = (List<tasks>)request.getAttribute("list");
for(tasks task : list){
	String daoda_f =task.getDaoda_f();
	String daoda_j=task.getDaoda_j();
	String wancheng_f=task.getWancheng_f();
	String wancheng_j=task.getWancheng_j();
	String photo_f=task.getCheckphoto_f();
if (photo_f==null)
	{photo_f="";
	 color="lavender";
		 front="#adadad";
		 hanshu="alertt();";
	  }
	 else
		 { color="#ffc107";
	     front="#8b8b7a";}
    if(daoda_f==null)
    {daoda_f="";}
    if(daoda_j==null)
    {daoda_j="";}
    if(wancheng_f==null)
    {wancheng_f="";}
    if(wancheng_j==null)
    {wancheng_j="";}
    if(daoda_f.equals("")||daoda_j.equals(""))
    {
    	changdu="5%";
    	wenzi="均未确认到达";
    }
    if(daoda_f.equals("已到达")&&daoda_j.equals(""))
	{   changdu="20%";
		wenzi="已到达,等待对方确认到达";
	}
    if(daoda_f.equals("")&&daoda_j.equals("已到达"))
	{   changdu="20%";
		wenzi="已到达,等待对方确认到达";
	}
    if(daoda_f.equals("已到达")&&daoda_j.equals("已到达"))
	{   changdu="40%";
		wenzi="已到达,等待确认完成";
	}
    if(wancheng_f.equals("已完成")&&wancheng_j.equals(""))
   	{   changdu="60%";
   		wenzi="已完成,等待对方确认完成";
   	}
       if(wancheng_f.equals("")&&wancheng_j.equals("已完成"))
   	{   changdu="60%";
   		wenzi="已完成,等待对方确认完成";
   	}
       if(wancheng_f.equals("已完成")&&wancheng_j.equals("已完成"))
   	{   changdu="80%";
   		wenzi="已完成,等待确认完成";
   	}
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cover</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../bootstrap.min.css">
    <link href="../自定义.css" rel="stylesheet">
    <script src="../jquery-2.1.4.min.js"></script>
    <script src="../bootstrap.min.js"></script>

    <style>
        label{
            font-family: Menlo, Monaco, Consolas, "Courier New", monospace;
        }
		body {
			background-color: #ddd;
		}
		.progress-bar-danger {
			border-radius: 0 15px 15px 0;
			background-color: #ffc107;
		}
    </style>
</head>
<body>
<script type="text/javascript">
function alertt(){ 
    alert("未上传任务照片"); 
    event.preventDefault();
  }
function yanzheng(){ 
    var file = document.getElementById('file'); 
    if (file.value=="") { 
   alert("请选择您需要上传的文件！"); 
     return false;
    }
} 
 
</script>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.8;">
    <div class="container">
        <div style="position:fixed;left:53px;">
            <img src="${pageContext.request.contextPath}/images/logo/方案一 芒果图.png" style="width: 50px;height: 50px;z-index:2000;">
        </div>
        <div class="navbar-header">
            <a href="${pageContext.request.contextPath}/Cover.jsp" class="navbar-brand" style="font-size: 34px">空闲帮</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                    <li class="active"><a href="${pageContext.request.contextPath}/TaskList.jsp">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/User/releasetask.jsp">发布任务</a></li>
                <li><a href="../Photo.html">test</a></li>
                <li><a href="#">test</a></li>

            </ul>
            <form class="navbar-form navbar-right" role="search">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for...">
                    <span class="input-group-btn">
                            <a href="#" type="button" class="btn btn-primary">Go</a>
                        </span>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false">
                        账号<span class="caret"></span>
                    </a>
                      <%if (session.getAttribute("UserName")==null){}
                        else{
                            UserDao uds = new UserDao();		
                        	int id=	uds.findIdByName(session.getAttribute("UserName").toString());%>
                        <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/ShowUserInformPerson?id=<%=id %>">个人资料</a> </li>
                            <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userAtasklist.jsp?id=<%=id%>'">查看已发布任务</a> </li>
	                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userBtasklist.jsp?id=<%=id%>'">查看已申请任务</a> </li>
	                         <li class="divider"></li><%}%>
                        <li><a href="${pageContext.request.contextPath}/LogoutServlet">退出账号</a> </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div style="background-color: #ffc107;">
    <div class="container">
        <div class="row" >
            <div class="col-md-12">
                <h2 style="text-align: center; padding-top: 90px;color: #333">
                    零碎时间利用网<br>
                    在这里没有浪费时间的概念
                </h2>
            </div>
        </div>
    </div>
</div>



        <div class="row" style="background-color:#ffc107">
        	<!-- style="padding-bottom: 150px;padding-top:150px;" -->
        	<div class="col-md-1"></div>
            <div class="col-md-10 table-responsive" style="border:2px solid #666; background-color: #f7f7f7 ;padding:0 0 10px 0;">
                <table class="table">
                    <tr style="background-color: #bbb;color: #333;box-shadow: 1px 1px 5px 2px;">
                        <td>任务标题</td>
                        <td>任务细节</td>
                        <td>要求</td>
                        <td>地址</td>
                        <td>添加时间</td>
                        <td>开始时间</td>
                        <td>结束时间</td>
                        <td>人数</td>
                        <td>价格</td>
                        <td>执行人</td>
                    </tr>
                    <% for(tasks task1 : list) { %>
                    <tr style=" color: #333;">
                         <td><%= task1.getName() %></td>
                        <td><%= task1.getDetail()%></td>
                        <td><%= task1.getRequire() %></td>
                        <td><%= task1.getAddress() %></td>
                        <td><%= task1.getFabutime() %></td>
                        <td><%= task1.getStart() %></td>
                        <td><%= task1.getFinish() %></td>
                        <td><%= task1.getPeople() %></td>
                        <td><%= task1.getPrice() %></td>
                        <% UserDao ud= new UserDao();
                        List<User> list1 =ud.findUserById(task1.getExcuteperson());
                        for (User u :list1){%>
                        <td><%=u.getUsername()  %></td>
                        <%} %>
                    </tr>

                </table>

                <div class="col-md-12"> <h4 style="text-align: center; font-family: 微软雅黑;color: #f7e1b5">上传任务详情</h4></div><br>
                <div class="col-md-10 col-md-offset-1">
                	<div style="margin:0 auto;">
                		<img style="margin:0 auto;display:block;" src="../<%= task1.getCheckphoto_f() %>" height="100"/> 
                		<form style="margin:0 auto;display:block;text-align:center;" action="../servlet/UploadHandleServlet?id=<%=task1.getNo()%>" method="post" onSubmit="return yanzheng();" enctype="multipart/form-data">
                 			<input  style="display:block; margin:0 auto; padding:30px; border:1px solid #ccc;";color: white; text-align: center;" id="file" name="1" type="file">
                 			<button class="btn btn-default"  style="background-color: lavender;color: black;" >上传</button>
                 		</form>
                 	</div>
                <br><br><br>

                <div class="col-md-12" style="padding-bottom: 20px; position:relative;">
                	<a href="${pageContext.request.contextPath}/User/userjudge.jsp?user_no=<%=task1.getUser_no()%>&judge_no=<%=task1.getExcuteperson()%>"><img src="../images/comment橘色.png" style="position:absolute;right:150px; top:-80px;width:80px;height:80px;" alt=""/></a>
                    <div class="progress">
                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"  style="width:<%=changdu %>; ">
                        <span style="color:black;"> <%=wenzi %></span>
                    </div>
                </div>
                </div>
                <form action="Confirm?id=<%= task1.getNo() %>&status=daoda" method="post">
                <div class="col-md-3 col-md-offset-4">
                    <button  id="shezhi"  onclick="<%= hanshu %>;" class="btn btn-primary" id="querendaoda" style="background-color: <%= color %>;border-color:<%= color %>;color: <%= front %>">确认对方已到达</button></div>
               </form>
               <form action="Confirm?id=<%= task1.getNo() %>&status=wancheng" method="post">
                <div class="col-md-3">
                    <button  class="btn btn-default" id="querenwancheng" style="background-color: lavender;color: black;" >确认完成任务</button>
                </div>
                </form>
                 <%}
                %>
            </div>
            <div class="col-md-1"></div>
        </div>


<div style="background-color: #ffc107;">
    <div class="container">
        <div class="row">
        <!--
            <HR width="100%" color=#987cb9 >
            <div class="col-md-4" style="text-align: center" >
                <a href="#" style="color: #333;" >测试</a><br>
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a>
            </div>
            <div class="col-md-4" style="text-align: center;">
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a><br>
                <a href="#" style="color: #333">测试</a>
            </div>
            <div class="col-md-4" style="text-align: center">
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a>
                <br>
                <a href="#" style="color: #333">测试</a><br>
                <a href="#" style="color: #333">测试</a><br>
                <a href="#" style="color: #333">测试</a><br>
                <a href="#" style="color: #333">测试</a>
            </div>
            -->
            <div class="col-md-12">   
            	<HR width="100%" color=#987cb9 >
            </div>
            <h6>coypright 2017-2018</h6>
        </div>
    </div>
</div>

</body>
</html>