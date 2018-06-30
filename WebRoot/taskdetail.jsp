<%@ page language="java" import="java.util.*" import="com.entity.*" import="com.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

int id=0;
id = Integer.parseInt(request.getParameter("id"));
taskdao ts = new taskdao();
List<tasks> list = (List<tasks>)ts.findTaskById(id);
 for(tasks task1 : list) { %>


<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
    <title>Cover</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <link href="自定义.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <script src="jquery-2.1.4.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src='./js/自定义.js.设置'></script>
    <style>
        a{
            font-family: 宋体;
        }
        label{
            font-family: Menlo, Monaco, Consolas, "Courier New", monospace;
        }
        h2{
            font-family: 宋体;
        }

    </style>
</head>
  <body>
  <script type="text/javascript">
		$(document).ready(function(){ 
		var haslog = document.getElementById("haslog");
		var hasnotlog = document.getElementById("hasnotlog");
		<%HttpSession usersession = request.getSession();
		if (usersession.getAttribute("UserName")==null)
			   {%>
			   hasnotlog.style.opacity="0.9";
			   haslog.style.opacity="0";
			   
			<%   }
		else{
		   %>
				
				hasnotlog.style.opacity="0";
				haslog.style.opacity="0.9";
				haslog.style="z-index:10000;";
		<%}%>
		  });
		function yanzheng(){
			<%HttpSession usersession2 = request.getSession();
			  UserDao ud = new UserDao();
			if (usersession2.getAttribute("UserName")==null)
				   {%>alert("请先登录！");
				      window.location.href="Cover.jsp";
				   <%}
			else{
				int iid=ud.findIdByName(usersession2.getAttribute("UserName").toString());
				if(task1.getUser_no()==iid){%>
		           alert("不能申请自己的任务！");
			<%  }else{
					UserDao uddd = new UserDao();		
                int idd=uddd.findIdByName(session.getAttribute("UserName").toString());%>
                        
				window.location.href="AddApply?user_id=<%=idd%>&task_id=<%=id %>";
			<%      }
				
			}%>	  
			
		 }
</script>
		 <!-- nav第一个-->
    <nav id="haslog" class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.95;">
	    <div class="container">
	        <div style="position:fixed;left:53px;">
	            <img src="images/logo/方案一 芒果图.png" style="width: 50px;height: 50px;z-index:2000;">
	        </div>
	        <div class="navbar-header">
	            <a href="Cover.jsp" class="navbar-brand" style="font-size: 33px">空闲帮</a>
	        </div>
	        <div class="collapse navbar-collapse">
	            <ul class="nav navbar-nav">
	            <li class="active"><a href="TaskList.jsp" >主页</a></li>
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
                            UserDao udd = new UserDao();		
                        	int idd=	udd.findIdByName(session.getAttribute("UserName").toString());%>
                        <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/ShowUserInformPerson?id=<%=idd %>">个人资料</a> </li>
                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userAtasklist.jsp?id=<%=idd%>'">查看已发布任务</a> </li>
	                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userBtasklist.jsp?id=<%=idd%>'">查看已申请任务</a> </li>
                            <li><a href="#">test</a> </li>
                            <li class="divider"></li><%} %>
	                        <li><a href="LogoutServlet">退出账号</a> </li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>
		 <!-- nav第一个结束 -->
<!--nav第一个  -->
<nav id="hasnotlog" class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.9;">
    <div class="container">
        <div style="position:fixed;left:53px;">
            <img src="images/logo/方案一 芒果图.png" style="width: 50px;height: 50px;z-index:2000;">
        </div>
        <div class="navbar-header">
            <a href="Cover.jsp" class="navbar-brand" style="font-size: 33px">空闲帮</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="navLi"><a href="TaskList.jsp">主页</a></li>
                <li class="navLi"><a href="User/releasetask.jsp">发布任务</a></li>
                <li class="navLi"><a href="Photo.html">test</a></li>
                <li class="navLi"><a href="#">test</a></li>
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
                <li> <a id="log" href="#" data-toggle="modal" data-target="#login">登录</a></li>
                <li> <a id="reg" href="#" data-toggle="modal" data-target="#register">注册</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--nav第一个结束  -->

	<!-- 蜂巢图 -->
    <div style="background-color: #f8f8f8">
        <div class="container">
            <div class="row" >
                <div class="col-md-12" style="height:300px;margin:50px 0 30px">
    				<div style="position:relative">
    					<img src="images/logo/square_large.png" id='beeimg1' class='beeimg'>
    					<img src="images/logo/square_small.png" id='beeimg2' class='beeimg'>
    					<img src="images/logo/square_small.png" id='beeimg3' class='beeimg'>
    					<img src="images/logo/square_small.png" id='beeimg4' class='beeimg'>
    					<!-- <img src="images/logo/man.png" id='beeimg5' class='beeimg'>
    					<img src="images/logo/plane.png" id='beeimg6' class='beeimg'> -->
    					<div>
    						<span id="beeword1" class='beeimg'>私人顾问<br>private</span>
    						<span id="beeword2" class='beeimg'>私人顾问<br>private</span>
    						<span id="beeword3" class='beeimg'>私人顾问<br>private</span>
    						<span id="beeword4" class='beeimg'>私人顾问<br>private</span>
    					</div>
    					<h2 id='beeh2'style="margin-right:70px;letter-spacing:2px;">任务详情<br>请查看并申请任务</h2>
    				</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 蜂巢图 -->

	

<div style="background-image: url('images/4501.jpg');background-size: cover;margin-top: 30px;">
    <div class="container">
        <div class="row" style="padding-top: 20px;padding-bottom: 2px;">
            <div class="col-md-12">
                <div class="media">
                    
                        
                         
                           <div class="media-left">
                            <a href="#">
                            <img class="media-object" src="images/cd/02.jpg" width="110px"><br>
                            <a href="javascript:yanzheng();"><button class="btn btn-primary" >申请</button></a>
                           </div>

                    <div class="media-body">
                        <div class="col-md-2 col-md-offset-1">
                            <h4 class="media-heading" style="color:#222;">任务标题</h4>
                            <a style="color: #222"><%= task1.getName() %></a>
                            <h4 class="media-heading" style="color:#222;">任务内容</h4>
                            <a style="color: #222"><%= task1.getDetail() %></a>
                            <h4 class="media-heading" style="color:#222;">地址</h4>
                            <a style="color: #222"><%= task1.getAddress()%></a>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                            <h4 class="media-heading" style="color:#222;">要求</h4>
                            <a style="color: #222"><%= task1.getRequire()%></a>
                            <h4 class="media-heading" style="color:#222;">持续时间</h4>
                            <a style="color: #222"><%= task1.getStart()%>-<%= task1.getFinish()%></a>
                            <h4 class="media-heading" style="color:#222;">价格</h4>
                            <a style="color: #222"><%= task1.getPrice()%></a>

                        </div>
                    </div>
                </div>

                <hr>
                <div class="media">

                    <div class="media-body" style=" padding-bottom: 10px">
                        <h4 class="media-heading" style="color:#222;">任务介绍</h4>
                        <a style="color: #222"><%= task1.getDetail()%>
                        </a>
                    </div>

                </div>
                <%}%>
                <hr>
   
                <% 
               
                ApplyDao adao=new ApplyDao();
                int task_id=Integer.parseInt(request.getParameter("id"));
                List<Apply> applyer=adao.findApplyByTaskId(task_id);
                for(Apply a : applyer) {
					UserDao udao=new UserDao();
					List<User> apply=udao.findUserById(a.getUser_no());
					 for(User u : apply) {
					%>
                
                    <div class="col-md-2">
                        <h4 class="media-heading" style="color:yellow;">申请人</h4>
                        <a style="color: #222"><%=u.getUsername()%></a>
                    </div>
                    <div class="col-md-2">
                        <h4 class="media-heading" style="color:yellow;">性别</h4>
                        <a style="color: #222"><%=u.getSex()%></a>
                    </div>
                    <div class="col-md-2">
                        <h4 class="media-heading" style="color:yellow;">星级</h4>
                        <a style="color: #222"><%=u.getXinyu()%></a>
                    </div>
                    <%}%>
			<%}%>
				</div>
            </div>
        </div>
    </div>
</div>
<div style="background-color: #f8f8f8">
    <div class="container">
        <div class="row">
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
            <div class="col-md-12">   <HR width="100%" color=#987cb9 ></div>
            <h6>coypright 2017-2018</h6>
        </div>
    </div>
</div>
  </body>
</html>
