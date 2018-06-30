<%@ page language="java" import="java.util.*" import="com.dao.*" import="java.sql.*" pageEncoding="utf-8" import="com.entity.tasks"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
taskdao ts = new taskdao();
List<tasks> list= (List<tasks>)ts.findAll();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cover</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <link href="自定义.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <script src='js/animate.js'></script>
    <script src="jquery-2.1.4.min.js"></script>
    <script src="bootstrap.min.js"></script>
        <script src='js/自定义.js'></script>
    <script src="${pageContext.request.contextPath}/js/自定义.js.设置" type="text/javascript" charset="utf-8"></script>
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
        .btn-primary {
            border: 1px solid lightcyan;
            background: hotpink;
            transition: all 0.2s ease-in-out;
            -webkit-transition: all 0.2s ease-in-out;
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
				   hasnotlog.style.opacity="1";
				   haslog.style.opacity="0";
				   hasnotlog.style="z-index:10000;";
				   
				<%   }
			else{
			%>
			
			hasnotlog.style.opacity="0";
			haslog.style.opacity="1";
			haslog.style="z-index:10000;";
			<%}%>
			});
	</script>

    <!-- nav第一个 -->
    <nav id="haslog" class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.8;">
        <div class="container">
        	<!-- 左上角logo图片 -->
    		<div style="position:fixed;left:53px;">
    			<img src="images/logo/方案一 芒果图.png" style="width: 50px;height: 50px;z-index:2000;">
    		</div>
    		<!-- 左上角logo图片结束 -->
            <div class="navbar-header">
                <a href="Cover.jsp" class="navbar-brand" style="font-size: 34px">空闲帮</a>
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
                            UserDao ud = new UserDao();		
                        	int id=	ud.findIdByName(session.getAttribute("UserName").toString());%>
                        <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/ShowUserInformPerson?id=<%=id %>">个人资料</a> </li>
                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userAtasklist.jsp?id=<%=id%>'">查看已发布任务</a> </li>
	                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userBtasklist.jsp?id=<%=id%>'">查看已申请任务</a> </li>
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
    					<h2 id='beeh2'>零碎时间利用网<br>在这里没有浪费时间的概念</h2>
    				</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 蜂巢图 -->



<div>
	<!-- style="background-image: url('images/4501.jpg')" -->
    <div class="container">
        <div class="row" style="padding-top: 20px;padding-bottom: 2px;">
           <div class="col-md-12">
             <%for(int i = 0 ; i < list.size(); i++){ 
                    if(i%2==0){%>
               <div class="media">
                   <div class="media-left">
                       	<a>
                           <img class="media-object" src="<%=list.get(i).getPhoto() %>" width="80"><br>
                           <a href="taskdetail.jsp?id=<%=list.get(i).getNo()%>"><button class="btn btn-primary" >选择</button></a>
                       	</a>
                   </div>
                   <div class="media-body">
                       <h4 class="media-heading" style="color:#222;"><%=list.get(i).getName()%></h4>
                       <a style="color: #222"><%=list.get(i).getDetail()%></a>
                   </div>
               </div>
               <hr>
                <% }else{%>
               <div class="media">

                   <div class="media-body">
                       <h4 class="media-heading" style="color:#222;"><%=list.get(i).getName()%></h4>
                       <a style="color: #222"><%=list.get(i).getDetail()%>

                       </a>
                   </div>
                   <div class="media-right">
                       	<a>
                           <img class="media-object" src="<%=list.get(i).getPhoto() %>" width="80"><br>
                           <a href="taskdetail.jsp?id=<%=list.get(i).getNo()%>"><button class="btn btn-primary" >选择</button></a>
                       	</a>
                   </div>
               </div>
               <hr>    
                 <% }%>
                 
                
               <%}%>
               
               
              
               <hr>
  
           </div>

        </div>
    </div>
</div>

<div style="background-color: #ffc107">
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
