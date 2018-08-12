<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>选择事情</title>
    <link rel="stylesheet" href="../css/cssReset.css">
    <link rel="stylesheet" href="../bootstrap.min.css">
    <link href="../自定义.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <script src="../jquery-2.1.4.min.js"></script>
    <script src="../bootstrap.min.js"></script>
    <style>
        body{
            padding-top: 100px;
            background-color: #ffc107;
        }
        h2 {
            text-align: center;
            line-height: 100px;
            padding-right: 17px;
            letter-spacing: 2px;
        }
    </style>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){ 
$("#xuanze").click(function(){
	location.href="../Cover.html";
	});
}); 
</script>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.8;">
    <div class="container">
        <div style="position:fixed;left:45px;">
            <img src="../images/logo/方案一 芒果图.png" style="width: 50px;height: 50px;z-index:2000;">
        </div>
        <div class="navbar-header">
            <a href="../Cover.jsp" class="navbar-brand" style="font-size: 33px">空闲帮</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="../ShowTask">主页</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li> <a href="adminlogin.html"><%= request.getSession().getAttribute("username")%></a></li>
                <li> <a href="adminregister.jsp">注册</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <h2>空闲帮后台管理系统</h2>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-2">
        <button class="btn btn-primary btn-lg">审核任务信息</button>
    </div>
    <div class="col-md-2">
        <button class="btn btn-primary btn-lg">审核用户信息</button>
    </div>
</div>
    <div class="row" style="padding-top: 30px">
        <div class="col-md-4"></div>
        <div class="col-md-2">
            <button class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;管理任务&nbsp;&nbsp;&nbsp;&nbsp;  </button>
        </div>
        <div class="col-md-2">
            <button class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;管理用户&nbsp;&nbsp;&nbsp;&nbsp;  </button>
        </div>
    </div>
    <div class="row" style="padding-top: 30px">
        <div class="col-md-4"></div>
        <div class="col-md-2">
        
            <button class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:white;" href="../Cover.jsp">浏览主站</a>&nbsp;&nbsp;&nbsp;&nbsp;</button>
            
        
        </div>
        <div class="col-md-2">
        
            <button class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:white;" href="${pageContext.request.contextPath}/servlet/AdminServlet?name=logout">退出系统 </a>&nbsp;&nbsp;&nbsp;&nbsp;</button>
       
        </div>
    </div>
</div>
</body>
</html>