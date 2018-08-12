<%@ page language="java" import="java.util.*" import="com.entity.*" import="com.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<User> list1 =(List<User>) request.getAttribute("list");
int id = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cssReset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/自定义.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/rap.css">
    <script src="${pageContext.request.contextPath}/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap.min.js"></script>
    <style>
        a{
            font-family: 宋体,"Microsoft Yahei";
        }
        label{
            font-family: Menlo, Monaco, Consolas, "Courier New", monospace;
        }
        .btn-danger{
            border:1px solid #ddd;
            background: #fff;
            transition: all 0.2s ease-in-out;
            -webkit-transition: all 0.2s ease-in-out;
            color:#222;
        }
        h1,label{
            color: #111;
        }
        .btn-primary {
            border: 1px solid lightcyan;
            background: #fff;
            transition: all 0.2s ease-in-out;
            -webkit-transition: all 0.2s ease-in-out;
            color:#222;
        }
		.form-horizontal .control-label {
			text-align: center;
			padding-left: 180px;
		}
		body {
			background-color:#ffc107;
		}
    </style>
    <script src="jquery-2.1.4.min.js"></script>
     <script type="text/javascript">
     
     var image = ''; 
     var image2='';
     var id=<%=id%>
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
     function selectImage2(file) {  
         if (!file.files || !file.files[0]) {  
             return;  
         }  
         var filepath = document.getElementById("file2").value;  
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
             document.getElementById('image2').src = evt.target.result;  
             image2 = evt.target.result;  
         };  
         reader.readAsDataURL(file.files[0]);  
     }  
     function uploadImage() { 

     	var username=$("input[name='username']").val();
         var password=$("input[name='password']").val();
         var telephone=$("input[name='telephone']").val();
         var emergency_call=$("input[name='emergency_call']").val();
         var emergency_call2=$("input[name='emergency_call2']").val();
         var id_no=$("input[name='id_no']").val();
         var height=$("input[name='height']").val();
         var age=$("input[name='age']").val();
         var state=$("input[name='state']:checked").val();
         var sex=$("input[name='sex']:checked").val();
         var area=$("select").val();
         var hobby=$("input[name='hobby']").val();
         var minzu=$("input[name='minzu']:checked").val();
         var information=$("#information").val();
     	if ($("input[name='username']").val() == null || $("input[name='username']").val()==""){
     		alert("请输入用户名");
     		return false;
     		}
     	else if ($("input[name='password']").val() == null || $("input[name='password']").val()==""){
     		alert("请输入密码");
     		return false;
     		}
     	else if ($("input[name='password2']").val() == null || $("input[name='password2']").val()==""){
     		alert("请再次输入密码");
     		return false;
     		}
     	else if ($("input[name='password']").val()!= $("input[name='password2']").val()){
     		alert("请输入相同密码");
     		return false;
     		}
     	else if ($("input[name='age']").val() == null || $("input[name='age']").val()==""){
         		alert("请输入年龄");
         		return false;
         	}
     	//console.log(json_data);
     	else{
     	$.ajax({  
             type : 'POST',  
             url : 'UpdateUser',  //请求路径以及传值  
             data : {
            	 id:id,
             	username:username,
             	password:password,
             	telephone:telephone,
             	emergency_call:emergency_call,
             	emergency_call2:emergency_call2,
             	id_no:id_no,
             	image : image,  
             	height:height,
             	age:age,
             	state:state,
             	image2 : image2,  
             	sex:sex,
             	area:area,
             	hobby:hobby,
             	minzu:minzu,
             	information:information
             	
                //这里传递的是base64编码  json格式  
             },  
             async : false,  
             dataType : 'json'
         });
     	}
     }  
    </script>
</head>
<body >

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
<div class="container" style="padding-top: 70px;padding-bottom: 60px">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" style="padding:20px 0px 50px 100px;"><h1>个人信息修改</h1></div>
    </div>      
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <% for(User user : list1){ %>
            <form class="form-horizontal" ><!--  name="form1" method="post" onsubmit="return sub();">-->
                <div class="form-group">
                    <label class="col-md-4 control-label">用户名:</label>
                    <div class="col-md-6"><input class="form-control" name="username" value="<%=user.getUsername() %>" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">个人简介:</label>
                    <div class="col-md-6"><textarea id="information" class="form-control" style="resize:none;height:50px" id="message-text" name="information" ><%=user.getInformation() %></textarea></div>
                </div>
                
                <div class="form-group">
                    <label class="col-md-4 control-label">密码:</label>
                    <div class="col-md-6"><input class="form-control" name="password" value="<%=user.getPassword() %>" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">确认密码:</label>
                    <div class="col-md-6"><input class="form-control" name="password2" value="<%=user.getPassword()%>" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">电话:</label>
                    <div class="col-md-6"><input class="form-control" name="telephone" value="<%=user.getTelephone() %>" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">紧急联系人电话:</label>
                    <div class="col-md-6"><input class="form-control" name="emergency_call" value="<%=user.getEmergency_call() %>" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">紧急联系人电话2:</label>
                    <div class="col-md-6"><input class="form-control" name="emergency_call2" value="<%=user.getEmergency_call2() %>"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">身份证号码:</label>
                    <div class="col-md-6"><input class="form-control" name="id_no"  value="<%=user.getId_no() %>" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">身份证照片正反面:</label>

                    <div class="col-md-6">
                            <img id="image"  src="images/05.jpg" height="100"/>
                            <input  type="file"  id="file" class="form-control" onchange="selectImage(this);" />
                            </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">爱好:</label>
                    <div class="col-md-6">
                    <input class="form-control" name="hobby" value="<%=user.getHobby() %>"  ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">性别:</label>
                    <div class="col-md-6">
                         <% if(user.getSex()==null){%>
                         <label class="radio-inline"><input type="radio" name="sex" id="by" value="男">男</label>
                         <label class="radio-inline"><input type="radio" name="sex" id="grl" value="女" >女</label>
                         <label class="radio-inline"><input type="radio" name="sex" id="oy" value="保密">保密</label>
                         <% }else if (user.getSex().equals("男")){ %>
                        <label class="radio-inline"><input type="radio" name="sex" id="boy" value="男" checked="checked">男</label>
                        <label class="radio-inline"><input type="radio" name="sex" id="girl" value="女">女</label>
                        <label class="radio-inline"><input type="radio" name="sex" id="boy" value="保密">保密</label>                         
                          <% }else if (user.getSex().equals("女")){%>
                        <label class="radio-inline"><input type="radio" name="sex" id="boy" value="男">男</label>
                        <label class="radio-inline"><input type="radio" name="sex" id="girl" value="女" checked="checked">女</label>
                        <label class="radio-inline"><input type="radio" name="sex" id="boy" value="保密">保密</label>
                         <% }else if (user.getSex().equals("保密")){%>
                        <label class="radio-inline"><input type="radio" name="sex" id="boy" value="男">男</label>
                        <label class="radio-inline"><input type="radio" name="sex" id="girl" value="女" >女</label>
                        <label class="radio-inline"><input type="radio" name="sex" id="boy" value="保密" checked="checked">保密</label>
                         <%  } %>
                         
                     </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">身高:</label>
                    <div class="col-md-6"><input class="form-control" name="height" value="<%=user.getHeight() %>" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">年龄:</label>
                    <div class="col-md-6"><input class="form-control" name="age" value="<%=user.getAge() %>" ></div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">地区:</label>
                    <div class="col-md-6">
                    <select id="area" class="btn btn-default" style="margin-left:0px;">
  							 <option  value ="朝阳">朝阳</option>
  							 <option value ="丰台">丰台</option>
  							 <option value="东城区">东城区</option>
  							 <option value="西城区">西城区</option>
  							 <option value ="通州区">通州区</option>
  							 <option value="昌平区">昌平区</option>
  							 <option value="石景山">石景山</option>
  							 <option value="其他">其他</option>
						   </select> <%=user.getArea() %>
                    
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">情感状态:</label>
                   <div class="col-md-6">
                   			<%if (user.getState()==null){ %>
                   			<label class="radio-inline"><input type="radio" name="state" id="boy" value="单身">单身</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="恋爱">恋爱</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="已婚" >已婚</label>
                            <% }else if (user.getState().equals("单身")){ %>
                            <label class="radio-inline"><input type="radio" name="state" id="boy" value="单身" checked="checked">单身</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="恋爱">恋爱</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="已婚">已婚</label>
                           <% }else if (user.getState().equals("恋爱")){ %>
                            <label class="radio-inline"><input type="radio" name="state" id="boy" value="单身">单身</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="恋爱" checked="checked">恋爱</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="已婚">已婚</label>
                           <% }else if (user.getState().equals("已婚")){ %>
                            <label class="radio-inline"><input type="radio" name="state" id="boy" value="单身">单身</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="恋爱">恋爱</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="已婚" checked="checked">已婚</label>
                            <%}%>
                            
                        </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">个人照片:</label>
                    <div class="col-md-6">

                        <img  id="image2" height="100"/>
                        <input  type="file" id="file2" class="form-control" onchange="selectImage2(this);">
                             </div>
                </div>
					<div class="form-group">
                        <label class="col-md-4 control-label">民族:</label>
                        <div class="col-md-6">
                        <%if (user.getMinzu()==null) {%>
                         <label class="radio-inline"><input type="radio" name="minzu" id="boy" value="汉族">汉族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="藏族">藏族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="维吾尔族">维吾尔族</label>
                        
                         <% }if (user.getMinzu().equals("汉族")){ %>
                            <label class="radio-inline"><input type="radio" name="minzu" id="boy" value="汉族" checked="checked">汉族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="藏族">藏族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="维吾尔族">维吾尔族</label>
                         <%}else if (user.getMinzu().equals("藏族")){ %>
                            <label class="radio-inline"><input type="radio" name="minzu" id="boy" value="汉族">汉族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="藏族" checked="checked">藏族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="维吾尔族">维吾尔族</label>
                         <% } else if (user.getMinzu().equals("维吾尔族")){ %>
                            <label class="radio-inline"><input type="radio" name="minzu" id="boy" value="汉族">汉族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="藏族">藏族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="维吾尔族" checked="checked">维吾尔族</label>
                         <% }%>
                            
                        </div>
                    </div>
                <div class="form-group">
                    <div class="col-md-4"></div>
                    <div class="col-md-6"><button id="xiugai" class="btn btn-danger" onclick="uploadImage();">点击修改</button></div>
                </div>
                        <% }%>
            </form>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>







</body>
</html>