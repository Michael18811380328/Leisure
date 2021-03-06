<%@ page language="java" import="java.util.*" import="com.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>评价</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../bootstrap.min.css">
    <link href="../自定义.css" rel="stylesheet">
    <script src="../jquery-2.1.4.min.js"></script>
    <script src="../bootstrap.min.js"></script>
    <style>
        
    </style>
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


<div class="jumbotron">
    <h1>请为你的搭档打个分</h1>
    <p>快来评价一下吧~</p>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">评价系统</div>
                <form action="../AddJudgeServlet?user_no=<%=request.getParameter("user_no") %>&judge_no=<%=request.getParameter("judge_no") %>" method="post">
                <div class="panel-body">

                        <label class="radio-inline"><input type="radio" name="start" id=boy" value="★★★★★">5星</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="radio-inline"><input type="radio" name="start" id=boy" value="★★★★">4星</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="radio-inline"><input type="radio" name="start" id=boy" value="★★★">3星</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="radio-inline"><input type="radio" name="start" id=boy" value="★★">2星</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="radio-inline"><input type="radio" name="start" id=boy" value="★">1星</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br><br>
                        <button class="btn btn-warning">提交</button>

                </div>

                <ul class="list-group">
                    <li class="list-group-item"> 请写评语</li>
                    <li class="list-group-item"><textarea name="neirong" class="form-control" id="message-text" style="resize:none;height:150px;"></textarea></li>
                    <li class="list-group-item"><button class="btn btn-success">点击提交评价</button></li>
                </ul>
                </form>
            </div>
        </div>
    </div>
</div>
<audio src="../music/Good Time.mp3" autoplay loop></audio>
</body>
</html>