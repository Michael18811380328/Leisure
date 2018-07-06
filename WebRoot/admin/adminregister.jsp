<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message =(String)request.getAttribute("message");
if (message!=null){
%>
<script type="text/javascript">
     alert("<%=message %>");
</script>
<%} %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../css/cssReset.css">
    <link rel="stylesheet" href="../bootstrap.min.css">
    <link href="../自定义.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <script src="../jquery-2.1.4.min.js"></script>
    <script src="../bootstrap.min.js"></script>
    <style>
        body{
            padding-top: 250px;
            background-color: #ffc107;
        }
    </style>

</head>
<body onload="checkForm()">
<input type="hidden" name="message" value="<%=request.getAttribute("message") %>">
<script type="text/javascript">
function sub(){ 
	if (form1.username.value == null || form1.username.value==""){
	alert("请输入用户名");
	return false;
	}
	if (form1.password.value == null || form1.password.value==""){
	alert("请输入密码");
	return false;
	}
	if (form1.password2.value == null || form1.password2.value==""){
	alert("请再次输入密码");
	return false;
	}
	if (form1.password.value!= form1.password2.value){
	alert("请输入相同密码");
	return false;
	}
   	return true;
}
function sys()
{
	 var a='<%=session.getAttribute("username")%>'; 
	  if(a=="null"||a=="")
	  {
	  alert("您还未登陆，请先登录！");
	  window.location.href="adminlogin.html";
	  return false;
	  }
}
</script> 
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.8;">
    <div class="container">
        <div style="position:fixed;left:53px;">
            <img src="images/logo/方案一 芒果图.png" style="width: 50px;height: 50px;z-index:2000;">
        </div>
        <div class="navbar-header">
            <a href="../Cover.jsp" class="navbar-brand" style="font-size: 33px">空闲帮</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="adminmain.jsp" onclick="return sys();">管理员主页</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form class="form-horizontal"  name="form1" action="../servlet/AdminServlet?name=register" method="post" onsubmit="return sub();">
                <div class="form-group">
                    <label class="col-md-2 control-label" style="color: black;font-size:16px">用户名</label>
                    <div class="col-md-7">
                        <input  id="username1"  type="text" name="username" class="form-control" placeholder="UserName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" style="color: black;font-size:16px">密码</label>
                    <div class="col-md-7">
                        <input type="password" class="form-control"  name="password" placeholder="Password">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" style="color: black;font-size:16px">确认密码</label>
                    <div class="col-md-7">
                        <input type="password" class="form-control"  name="password2"  placeholder="Confirm Password">
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <button type="submit" class="btn btn-default" onclick="sub();">注册</button>
                         <a href="adminlogin.html">
                        <button type="button" class="btn btn-default">登录</button>
                         </a>
                    </div>
                    
                    <div class="col-md-offset-2 col-md-10">
                        <p style="margin:10px 0;">点击注册&nbsp;表示同意<a href="#" style="font-weight: 700;">条款</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
