<%@ page language="java" import="java.util.*" import="com.dao.*" import="com.entity.*" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int id = Integer.parseInt(request.getParameter("id"));
ApplyDao tdao=new ApplyDao();
List<Apply> list =tdao.findApplyByUserId(id);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <meta charset="UTF-8">
    <title>评价</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/自定义.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap.min.js"></script>
    <script src='${pageContext.request.contextPath}/User/自定义.js.设置'></script>

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
                        <h2 id='beeh2'>你的任务列表<br>查看你申请的任务状态</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 蜂巢图 -->

 <!--    <div class="jumbotron">
        <h1></h1>
        <p></p>
    </div> -->
<div class="container" style="margin-top: 30px;">

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
        <%for(Apply apply : list){ %>
            <div class="panel panel-default">
                <div class="panel-heading">任务列表</div>

                <table class="table">
                 
                <%taskdao ts = new taskdao();
                List<tasks> listt = ts.findTaskById(apply.getTask_no());
                for(tasks task :listt){%>
                    <tr style="background-color: #ccc;color: slategrey">
                        <td>任务标题</td>
                        <td>任务内容</td>
                        <td>申请状态<%=session.getAttribute("UserName").toString() %></td>
                         <%UserDao user = new UserDao();
                         int idd=user.findIdByName(session.getAttribute("UserName").toString());%>
						<td><a href="javascript:if(confirm('确定要删除吗？'))location='/Leisure/DeleteApplyServlet?task_id=<%=task.getNo()%>&user_id=<%=idd%>'"><button class="btn btn-danger">删除</button></a><td>
                        <td><a href="${pageContext.request.contextPath}/servlet/showtaskdetail_j?id=<%=task.getNo() %>"><button class="btn btn-danger">浏览</button></a> </td>
                    
                    </tr>
          		
                    <tr style=" color: slategrey;">
                   
                        <td><%= task.getName() %></td>
                        <td><%= task.getDetail() %></td>
                 		<%} %>
                 	
                   
                        <td><%= apply.getApply_state()%></td>
    
           
    				
                    </tr>
                              
                    
                </table>
           

                
 				  <ul class="list-group">
                    <li class="list-group-item"></li>
                </ul>

            </div>
            <% 
           }%>
            <div class="panel-body">


            </div>
        </div>
   </div>
   
   </div>



<audio src="../music/Good Time.mp3" autoplay loop></audio>
  </body>
</html>
