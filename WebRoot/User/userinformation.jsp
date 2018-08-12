<%@ page language="java" import="java.util.*" import="com.dao.*" import="com.entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//List<User> list //= (List<User>)request.getAttribute("list");
int ID = Integer.parseInt(request.getParameter("id"));
UserDao ud = new UserDao();
List<User> list = ud.findUserById(ID);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cover</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cssReset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/自定义.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/自定义.js.设置"></script>
    <style>
        label{
            font-family: Menlo, Monaco, Consolas, "Courier New", monospace;
        }
        .btn-primary {
            border: 1px solid lightcyan;
            transition: all 0.2s ease-in-out;
            -webkit-transition: all 0.2s ease-in-out;
        }
        body {
        	background-color: #f8f8f8;
        }
    </style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.8;">
	    <div class="container">
	        <div style="position:fixed;left:53px;">
	            <img src="${pageContext.request.contextPath}/images/logo/方案一 芒果图.png" style="width: 50px;height: 50px;z-index:2000;">
	        </div>
	        <div class="navbar-header">
	            <a href="${pageContext.request.contextPath}/Cover.jsp" class="navbar-brand" style="font-size: 33px">空闲帮</a>
	        </div>
	        <div class="collapse navbar-collapse">
	            <ul class="nav navbar-nav">
	                <li class="active"><a href="${pageContext.request.contextPath}/TaskList.jsp">主页</a></li>
	                <li><a href="${pageContext.request.contextPath}/User/releasetask.jsp">发布任务</a></li>
	                <li><a href="Photo.html">test</a></li>
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
	                          <li><a href="#">test</a> </li>
	                        <li class="divider"></li><%}%>
	                        <li><a href="${pageContext.request.contextPath}/LogoutServlet">退出账号</a> </li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>
	
	<!-- 蜂巢图 -->
    <div style="background-color: #f8f8f8">
        <div class="container">
            <div class="row" >
                <div class="col-md-12" style="height:300px;margin-top:50px;">
    				<div style="position:relative">
    					<img src="${pageContext.request.contextPath}/images/logo/square_large.png" id='beeimg1' class='beeimg'>
    					<img src="${pageContext.request.contextPath}/images/logo/square_small.png" id='beeimg2' class='beeimg'>
    					<img src="${pageContext.request.contextPath}/images/logo/square_small.png" id='beeimg3' class='beeimg'>
    					<img src="${pageContext.request.contextPath}/images/logo/square_small.png" id='beeimg4' class='beeimg'>
    					<!-- <img src="images/logo/man.png" id='beeimg5' class='beeimg'>
    					<img src="images/logo/plane.png" id='beeimg6' class='beeimg'> -->
    					<div>
    						<span id="beeword1" class='beeimg'>私人顾问<br>private</span>
    						<span id="beeword2" class='beeimg'>私人顾问<br>private</span>
    						<span id="beeword3" class='beeimg'>私人顾问<br>private</span>
    						<span id="beeword4" class='beeimg'>私人顾问<br>private</span>
    					</div>
    					<h2 id='beeh2' style="margin-right: 60px;">个人信息详情<br>这是你的个人空间</h2>
    				</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 蜂巢图 -->

	<!-- <div>
	    <div class="container">
	        <div class="row" >
	            <div class="col-md-12">
	                <h2 style="text-align: center; padding-top: 80px;color: #333">
	                    
	                </h2>
	            </div>
	        </div>
	    </div>
	</div> -->

<div style="background-image: url('${pageContext.request.contextPath}/images/4501.jpg');background-size: cover;margin-top: 30px;">
    <div class="container"><% for(User user : list) {%> 
        <div class="row" style="padding-top: 20px;padding-bottom: 2px;">
            <div class="col-md-12">
                <div class="media">
                    <div class="media-left">
                        <a href="DisplayUserInfo?id=<%=ID %>">
                            <img class="media-object" src="${pageContext.request.contextPath}/upload/<%= user.getSelf_photo()%>" width="150" height="150"><br>
                            <button class="btn btn-primary" >修改个人信息</button>
                        </a>
                    </div>
                    
                    <div class="media-body">
                    
 						
                        <div class="col-md-2 col-md-offset-1">
                        <h4 class="media-heading" style="color:#333;">用户名 </h4>
                        <a style="color: #333"><%= user.getUsername() %></a>
                        <h4 class="media-heading" style="color:#333;">性别</h4>
                        <a style="color: #333"><%=user.getSex()%></a>
                        <h4 class="media-heading" style="color:#333;">身高</h4>
                        <a style="color: #333"><%=user.getHeight() %></a>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                            <h4 class="media-heading" style="color:yellow ;">星级</h4>
                            <a style="color: yellow"><%=user.getXinyu() %></a>
                            <h4 class="media-heading" style="color:#333;">爱好</h4>
                            <a style="color: #333"><%= user.getHobby() %></a>
                            <h4 class="media-heading" style="color:#333;">年龄</h4>
                            <a style="color: #333"><%= user.getAge() %></a>
                            <h4 class="media-heading" style="color:#333;">情感状态</h4>
                            <a style="color: #333"><%= user.getState() %></a>
                        </div>
                    </div>
                </div>

                <hr>
                <div class="media">

                    <div class="media-body" style=" padding-bottom: 60px">
                        <h4 class="media-heading" style="color:#333;">个人简介</h4>
                        <a style="color: #333">
                            <%=user.getInformation() %>
                        </a>
                    </div>
							 
                </div>
                <hr>
                <%CommentDao cd = new CommentDao();
                  List<Comment> listc = cd.findCommentById(user.getUser_no());
                  for(int i = 0 ; i < listc.size(); i++){ 
                      if(i%2==0){%>
                <div class="media">
                
                    <div class="media-left">

                          <h2 class="media-heading" style="color: #333">评论</h2><br>


                    </div>
                    <%UserDao ud2= new UserDao();
                        List<User> listu = ud2.findUserById(listc.get(i).getJudge_no());
                    for (User u :listu){%>
                    <div class="media-body">
                        <h4 class="media-heading" style="color:#333;">
                        <%=u.getUsername() %><%} %>
                        </h4>
                        <a style="color: #333">
							<%=listc.get(i).getNeirong() %>
                        </a>
                    </div>
                </div>
                <hr>
                <% }else{%>
                	<%UserDao ud2= new UserDao();
                        List<User> listu = ud2.findUserById(listc.get(i).getJudge_no());
                    for (User u :listu){%>
                <div class="media" >
 				
                    <div class="media-body">

                        <h4 class="media-heading" style="color:#333;">    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <%=u.getUsername() %><%} %></h4>
                        <a style="color: #333">

                            <%=listc.get(i).getNeirong() %>

                        </a>
                    </div>
                    <div class="media-right">
                        <a href="#">

                            <h2 class="media-heading" style="color: #333">评论</h2><br>
                        </a>
                    </div>
                    <hr>
                </div>
				<%			}
               			   } %>

            </div>  
            <% } %>

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