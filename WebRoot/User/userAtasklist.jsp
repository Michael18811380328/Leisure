<%@ page language="java" import="java.util.*" import="com.entity.*" import="com.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int id = Integer.parseInt(request.getParameter("id"));
taskdao tdao=new taskdao();
List<tasks> list =tdao.findTaskByUser_No(id);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>评价</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cssReset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/自定义.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap.min.js"></script>
    <script src='${pageContext.request.contextPath}/js/自定义.js.设置'></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.8;">
	    <div class="container">
	        <div style="position:fixed;left:53px;">
	            <img src="${pageContext.request.contextPath}/images/logo/方案一 芒果图.png" style="width: 50px;height: 50px;z-index:2000;">
	        </div>
	        <div class="navbar-header">
	            <a href="${pageContext.request.contextPath}/Cover.jsp" class="navbar-brand" style="font-size: 33px;">空闲帮</a>
	        </div>
	        <div class="collapse navbar-collapse">
	            <ul class="nav navbar-nav">
	                <li><a href="${pageContext.request.contextPath}/TaskList.jsp" >主页</a></li>
	                <li><a href="${pageContext.request.contextPath}/User/releasetask.jsp">发布任务</a></li>
	                <li><a href="../Photo.html">test</a></li>
	                <li><a href="#">test</a></li>

	            </ul>
	            <form class="navbar-form navbar-right" role="search">
	                <div class="input-group">
	                    <input class="form-control" type="text" placeholder="Search for...">
	                    <span class="input-group-btn">
	                            <a href="#" type="button" class="btn btn-sm btn-primary">Go</a>
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
                        	int idd=	uds.findIdByName(session.getAttribute("UserName").toString());%>
                        <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/ShowUserInformPerson?id=<%=idd %>">个人资料</a> </li>
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

	<!-- 蜂巢图 -->
    <div style="background-color: #f8f8f8">
        <div class="container">
            <div class="row" >
                <div class="col-md-12" style="height:300px;margin:50px 0 30px">
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
    					<h2 id='beeh2'>快来选择谁来当你的搭档<br>还可以修改任务信息</h2>
    				</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 蜂巢图 -->

<!-- 	<div class="jumbotron">
	    <h1>快来选择谁来当你的搭档</h1>
	    <p>还可以修改任务信息</p>
	</div> -->
<div class="container" style="margin-top: 30px">
    <div class="row">
    
        <div class="col-md-10 col-md-offset-1">
        <%for(tasks task : list){ %>
            <div class="panel panel-default" style="border: 0px">
              
                <div class="panel-heading">任务列表</div>

                    <table class="table">
                        <tr style="background-color: #888;color: snow">
                           <td>任务标题</td>
                            <td>任务内容</td>
                            <td>要求</td>
                            <td>地址</td>
                            <td>价格</td>
                            <td>发布时间</td>
                            <td>开始时间</td>
                            <td>结束时间</td>
                            <td>申请人</td>
                               <%UserDao user = new UserDao();
                         int idd=user.findIdByName(session.getAttribute("UserName").toString());%>
						
                          <td><a href="${pageContext.request.contextPath}/DisplayTaskInfo?id=<%=task.getNo() %>"><button class="btn btn-success">修改</button></a> </td>
                            <td><a href="javascript:if(confirm('确定要删除吗？'))location='${pageContext.request.contextPath}/DeleteTaskServlet?user_id=<%=idd %>&task_id=<%=task.getNo() %>'"><button class="btn btn-danger">删除</button></a> </td>
                            <td><a href="${pageContext.request.contextPath}/servlet/showtaskdetail?id=<%=task.getNo() %>"><button class="btn btn-danger">浏览</button></a> </td>
                            
                        </tr>
                       <tr style=" color: slategrey;">
                            <td><%= task.getName() %></td>
                            <td><%= task.getDetail() %></td>
                            <td><%= task.getRequire() %></td>
                            <td><%= task.getAddress() %></td>
                            <td><%= task.getPrice() %></td>
                            <td><%= task.getFabutime() %></td>
                            <td><%= task.getStart()%></td>
                            <td><%= task.getFinish() %></td>
                            <% 
                            
                            	UserDao udao = new UserDao();
                                List<User> list_u =udao.findUserById(task.getExcuteperson()); 
                                for(User us : list_u){
                            
                            %>
                            <td><%= us.getUsername() %></td>
                        </tr>
                            <% }%>

                    </table>


                <ul class="list-group">
                <li class="list-group-item">申请人列表</li>
                </ul>
                     <% ApplyDao adao1 = new ApplyDao(); 
                List<Apply> list_a1 =adao1.findApplyByTaskId(task.getNo());%>
                     <% for(Apply apply : list_a1){%>
                    <table class="table">
                   
                <tr style="background-color: pink;color: white">
                <% UserDao udao1 = new UserDao();
                   List<User> list_u1 =udao1.findUserById(apply.getUser_no()); 
                   for(User u : list_u1){
                %>
                  
                    <td>姓名</td>
                    <td>性别</td>
                    <td>星级</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>

                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                   <td>  <a  href="${pageContext.request.contextPath}/ShowUserInform?id=<%=u.getUser_no() %>" class="btn btn-success">详情</a> </td>

                    <td>
                        <a href="javascript:if(confirm('已选择<%=u.getUsername() %>执行任务'))location='${pageContext.request.contextPath}/ChooseExucutePerson?user_id=<%=u.getUser_no() %>&task_id=<%=task.getNo() %>'" class="btn btn-danger">选择</a>
                    </td>

                </tr>
               <tr style=" color: slategrey;">
                    <td><%=u.getUsername() %></td>
                    <td><%=u.getSex() %></td>
                    <td>★★★</td>


                </tr>
                
            </table>
                      <% }%>
                  <%} %>
        
                </div>
                <div class="panel-body" style="background-color: #ffc107;"></div>
                <% } %>
                
            </div>
            
                 
        </div>
   
    
</div>
    <audio src="../music/Good Time.mp3" autoplay loop></audio>
</body>
</html>