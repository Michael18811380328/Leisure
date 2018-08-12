<%@ page language="java" import="java.util.*" import="com.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/rap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/自定义.css">
    <script src="${pageContext.request.contextPath}/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap.min.js"></script>
    <style>
        a{
            font-family: 宋体;
        }
        label{
            font-family: Menlo, Monaco, Consolas, "Courier New", monospace;
        }
        .btn-danger{
            border:1px solid #eee;
            /*background: #fff;*/
            transition: all 0.2s ease-in-out;
            -webkit-transition: all 0.2s ease-in-out;
        }
        label{
            color:#444;
        }

        .btn-primary {
            border: 1px solid #eee;
           /* background: #fff;*/
            transition: all 0.2s ease-in-out;
            -webkit-transition: all 0.2s ease-in-out;
        }

    </style>
    <script>
    function load()
    {
    	ReleaseTime();
    	StartTime();
    }
    function ReleaseTime()  
    {   
        var now = new Date();  
          
        var year = now.getFullYear();       //年  
        var month = now.getMonth() + 1;     //月  
        var day = now.getDate();            //日  
          
  /*      var hh = now.getHours();            //时  
        var mm = now.getMinutes();          //分  
        var ss = now.getSeconds();           //秒  
   */       
        var clock = year + "-";  
          
        if(month < 10)  
            clock += "0";  
          
        clock += month + "-";  
          
        if(day < 10)  
            clock += "0";  
              
        clock += day + " ";  
        /*      
        if(hh < 10)  
            clock += "0";  
              
        clock += hh + ":";  
        if (mm < 10) clock += '0';   
        clock += mm + ":";   
           
        if (ss < 10) clock += '0';   
        clock += ss;   
        */
		document.getElementById("releaseTime").value=clock;
        return(clock);  
	
		
}   
        
    function StartTime()  
    {   
        var now = document.getElementById("startTime").value;
          
        var year = now.getFullYear();       //年  
        var month = now.getMonth() + 1;     //月  
        var day = now.getDate();            //日  
          
       var hh = now.getHours();            //时  
        var mm = now.getMinutes();          //分  
        var ss = now.getSeconds();           //秒  
          
        var clock = year + "-";  
          
        if(month < 10)  
            clock += "0";  
          
        clock += month + "-";  
          
        if(day < 10)  
            clock += "0";  
              
        clock += day + " ";  
              
        if(hh < 10)  
            clock += "0";  
              
        clock += hh + ":";  
        if (mm < 10) clock += '0';   
        clock += mm + ":";   
           
        if (ss < 10) clock += '0';   
        clock += ss;   
       
		document.getElementById("startTime").value=clock;
        return(clock);  
	
		
}   window.onload=function(){
	<% HttpSession usersession = request.getSession();
	   if (usersession.getAttribute("UserName")==null)
			   {%>alert("请先登录！");
			   window.location.href="../Cover.jsp";
			   <%}%>
}
   
    function tiaozhuan()
    {
  	  document.form1.setAttribute("action","../UploadFile");
  	  document.form1.setAttribute("enctype","multipart/form-data");
        document.form1.submit();
  	  return false;
    }
   function yanzheng()
   {
  	 if(form1.amount.value == null || form1.amount.value=="")
  	 { alert("人数不能为空！");
         return false;}
  	 else
  		 return true;
   }
    
    </script>

</head>
<body onload="load()">
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
                <li class="active"><a href="${pageContext.request.contextPath}/TaskList.jsp" >主页</a></li>
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
                        	int id=	udd.findIdByName(session.getAttribute("UserName").toString());%>
                        <ul class="dropdown-menu">
	                     <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userinformation.jsp?id=<%=id%>'">个人资料</a> </li>
                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userAtasklist.jsp?id=<%=id%>'">查看已发布任务</a> </li>
                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userBtasklist.jsp?id=<%=id%>'">查看已申请任务</a> </li>
                           <li><a href="#">test</a> </li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/LogoutServlet">退出账号</a> </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container" style="padding-top: 80px">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4"><h1>请填写你的任务详情</h1></div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form class="form-horizontal" action="ReleaseTask?filepath=<%=request.getParameter("path")%>&user_no=<%=id %>" method="post" name="form1" id="form1">
                <div class="form-group"><%} %>
                    <label class="col-md-4 control-label">任务标题:</label>
                    <div class="col-md-6"><input class="form-control" name="taskName" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">任务内容:</label>
                    <div class="col-md-6"><input class="form-control" name="taskContent" ></div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label">地址:</label>
                    <div class="col-md-6"><input class="form-control" name="address" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">要求:</label>
                    <div class="col-md-6"><input class="form-control" name="require" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">发布时间:</label>
                    <div class="col-md-6"><input class="form-control" name="releaseTime"  id="releaseTime"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">起始时间:</label>
                    <div class="col-md-6"><input class="form-control"  name="startTime" type="datetime-local"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">终止时间:</label>
                    <div class="col-md-6"><input class="form-control" name="finishTime" type="datetime-local"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">人数:</label>
                    <div class="col-md-6"><input class="form-control" name="amount"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">价格:</label>
                    <div class="col-md-6"><input class="form-control" name="price"></div>
                </div>


                <div class="form-group">
                    <label class="col-md-4 control-label">照片:</label>
                    <div class="col-md-6">

                         <img src="<%=request.getParameter("path") %>" height="100"/>
                       
                        <input  type="file"  class="form-control"  name="1"  >
                        <Button class="btn btn-primary" type="submit" onclick="tiaozhuan();">上传</Button>
                          </div>

                <div class="form-group">
                    <div class="col-md-4"></div>
                    <div class="col-md-6"><button class="btn btn-danger">点击提交</button></div>
                </div>

            </form>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>







</body>
</html>