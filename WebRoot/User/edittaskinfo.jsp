<%@ page language="java" import="com.entity.*" import="java.util.*" import="com.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<tasks> list =(List<tasks>) request.getAttribute("list");
%>
        <%for (tasks task : list){ %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/自定义.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/rap.css">
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
    <script type="text/javascript">
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
	
		
}   
    var image = ''; 
    function selectImage(file) {  
        if (!file.files || !file.files[0]) {  
            return;  
        }  
        var filepath = document.getElementById("file").value;  
        //为了避免转义反斜杠出问题，这里将对其进行转换  
        var re = /(\\+)/g;   
        var filename=filepath.replace(re,"#");  
        //对路径字符串进行剪切截取  
        var one=filename.split("#");  
        //获取数组中最后一个，即文件名  
        var two=one[one.length-1];  
        //再对文件名进行截取，以取得后缀名  
        var three=two.split(".");  
         //获取截取的最后一个字符串，即为后缀名  
        var last=three[three.length-1];  
        if(last!="jpg"){  
            alert("请您上传jpg格式的图片！");  
            return;  
        }  
        var reader = new FileReader();  
        reader.onload = function(evt) {  
            document.getElementById('image').src = evt.target.result;  
            image = evt.target.result;  
        };  
        reader.readAsDataURL(file.files[0]);  
    }  
    function uploadImage() { 
alert("dfa");	
		var id=<%=task.getNo()%>;
    	var taskName=$("input[name='taskName']").val();
        var taskContent=$("input[name='taskContent']").val();
        var address=$("input[name='address']").val();
        var require=$("input[name='require']").val();
        var releaseTime=$("input[name='releaseTime']").val();
        var startTime=$("input[name='startTime']").val();
        var finishTime=$("input[name='finishTime']").val();
        var amount=$("input[name='amount']").val();
        var price=$("input[name='price']").val();
        alert("22222");
    	 if($("input[name='amount']").val() == null || $("input[name='amount']").val()=="")
    	 { alert("人数不能为空！");
           return false;}
    	 else{
    		 alert("4444");
    		 $.ajax({  
    		        type : 'POST',  
    		        url : 'UpdateTask',  //请求路径以及传值  
    		        data : {
    		        	id:id,
    		        	taskName:taskName,
    		        	taskContent:taskContent,
    		        	address:address,
    		        	require:require,
    		        	releaseTime:releaseTime,
    		        	startTime:startTime,
    		        	finishTime : finishTime,  
    		        	amount:amount,
    		        	price:price,
    		        	image:image
    		        	
    		           //这里传递的是base64编码  json格式  
    		        },  
    		        async : false,  
    		        dataType : 'json'
    		    });
    	 }
    		alert("5555");
     }
    </script>

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
                       <ul class="dropdown-menu">
                      <%UserDao ud= new UserDao(); 
                        int idd=ud.findIdByName(session.getAttribute("UserName").toString());%>
                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userinformation.jsp?id=<%=idd%>'">个人资料</a> </li>
                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userAtasklist.jsp?id=<%=idd%>'">查看已发布任务</a> </li>
                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userBtasklist.jsp?id=<%=idd%>'">查看已申请任务</a> </li>
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

            <form class="form-horizontal" ><!--  action="UpdateTask?filepath=" method="post" name="form1" id="form1">-->
                <div class="form-group">
                    <label class="col-md-4 control-label">任务标题:</label>
                    <div class="col-md-6"><input class="form-control" name="taskName" value="<%=task.getName() %>"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">任务内容:</label>
                    <div class="col-md-6"><input class="form-control" name="taskContent" value="<%=task.getDetail() %>"></div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label">地址:</label>
                    <div class="col-md-6"><input class="form-control" name="address" value="<%=task.getAddress() %>"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">要求:</label>
                    <div class="col-md-6"><input class="form-control" name="require" value="<%=task.getRequire()%>"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">发布时间:</label>
                    <div class="col-md-6"><input class="form-control" name="releaseTime"  id="releaseTime" value="<%=task.getFabutime()%>"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">起始时间:</label>
                    <div class="col-md-6"><input class="form-control"  name="startTime" type="datetime-local" value="<%=task.getStart() %>"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">终止时间:</label>
                    <div class="col-md-6"><input class="form-control" name="finishTime" type="datetime-local" value="<%=task.getFinish() %>"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">人数:</label>
                    <div class="col-md-6"><input class="form-control" name="amount" value="<%=task.getPeople() %>"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">价格:</label>
                    <div class="col-md-6"><input class="form-control" name="price" value="<%=task.getPrice() %>"></div>
                </div>


                <div class="form-group">
                    <label class="col-md-4 control-label">照片:</label>
                    <div class="col-md-6">

                          <img id="image"  src="images/05.jpg" height="100"/>
                            <input  type="file"  id="file" class="form-control" onchange="selectImage(this);" />
                        </div>

                <div class="form-group">
                    <div class="col-md-4"></div>
                    <div class="col-md-6"><button class="btn btn-danger" onclick="uploadImage()">点击提交</button></div>
                </div>

            </form>
        </div>
        <div class="col-md-1"></div>
    </div>
</div><%} %>







</body>
</html>