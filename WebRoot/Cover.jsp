<%@ page language="java"  import="com.dao.UserDao" import="com.entity.User" import="java.util.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
UserDao udao=new UserDao();
List<User> list = udao.findUserById(1);
User user = (User)list.get(0);
List<User> list2 = udao.findUserById(2);
User user2 = (User)list2.get(0);
List<User> list3 = udao.findUserById(3);
User user3 = (User)list3.get(0);
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Cover</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <link href="自定义wfc.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <script src='js/animate.js'></script>
    <script src="jquery-2.1.4.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src='js/自定义.js'></script>
</head>
<body >
<script type="text/javascript" src="jquery-2.1.4.min.js"></script>
<script type="text/javascript">
var image = ''; 
var image2='';
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

	var username=$("input[name='username_r']").val();
    var password=$("input[name='password_r']").val();
    var telephone=$("input[name='telephone']").val();
    var emergency_call=$("input[name='emergency_call']").val();
    var emergency_call2=$("input[name='emergency_call2']").val();
    var id_no=$("input[name='id_no']").val();
    var height=$("input[name='height']").val();
    var age=$("input[name='age']").val();
    var state=$("input[name='state']:checked").val();
    var sex=$("input[name='sex']:checked").val();
    var area=$("#area").val();
    var hobby=$("input[name='hobby']").val();
    var minzu=$("input[name='minzu']:checked").val();
    var information=$("#information").val();
    var t_number=929144493;
	var json_data = {
    	"username":username,
    	"password":password,
    	"telephone":telephone,
    	"emergency_call":emergency_call,
    	"emergency_call2":emergency_call2,
    	"id_no":id_no,
    	"image" : image,  
    	"height":height,
    	"age":age,
    	"state":state,
    	"image2" : image2,  
    	"sex":sex,
    	"area":area,
    	"hobby":hobby,
    	"minzu":minzu,
    	"information":information
    }

	if ($("input[name='username_r']").val() == null || $("input[name='username_r']").val()==""){
		alert("请输入用户名");
		return false;
		}
	else if ($("input[name='password_r']").val() == null || $("input[name='password_r']").val()==""){
		alert("请输入密码");
		return false;
		}
	else if ($("input[name='password2']").val() == null || $("input[name='password2']").val()==""){
		alert("请再次输入密码");
		return false;
		}
	else if ($("input[name='password_r']").val()!= $("input[name='password2']").val()){
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
        url : 'uploadImageAjax',  //请求路径以及传值  
        data : {
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
	alert("注册成功！请登录！");
}  
</script>
<script type="text/javascript">
        function logsub()
        {
        	if (form2.username.value == null || form2.username.value==""){
        		alert("请输入用户名");
        		return false;
        		}
        }
        $(document).ready(function(){ 
	   var haslog = document.getElementById("haslog");
	   var hasnotlog = document.getElementById("hasnotlog");
	   <%HttpSession usersession = request.getSession();
	   if (usersession.getAttribute("UserName")==null)
			   {%>
			   hasnotlog.style.opacity="0.9";
			   haslog.style.opacity="0";
			   
			<%   }
	   else{
		   String name=usersession.getAttribute("UserName").toString();
	   %>
	   
	   hasnotlog.style.opacity="0";
	   haslog.style.opacity="0.9";
	   haslog.style="z-index:10000;";
		<%}%>
        });
    </script>
    <!-- 右侧二维码 
    -->
    <div class='twocodediv'>
        <img src="images/twocodes.jpg" id='twocodes'>
        <div class='wechat'>扫描上方二维码</div>
        <div class='wechat'>关注微信公众号</div>
    </div>
    <!-- 右侧二维码结束 -->
    <!-- 中部广告 -->
   <div id="addiv">
        <h2 id="adh2">空闲帮欢迎你</h2>
        <p>空闲帮是一个销售类型的综合门户网站。在这里你可以获得最新的咨询。</p>
        <p>空闲帮是一个销售类型的综合门户网站。在这里你可以获得最新的咨询。</p>
        <p>空闲帮是一个销售类型的综合门户网站。在这里你可以获得最新的咨询。</p>
        <p>空闲帮是一个销售类型的综合门户网站。在这里你可以获得最新的咨询。</p>
        <p>空闲帮是一个销售类型的综合门户网站。在这里你可以获得最新的咨询。</p>
        <p>空闲帮是一个销售类型的综合门户网站。在这里你可以获得最新的咨询。</p>
        <img src="./images/logo/close.png" alt="关闭" id='close'>
    </div>

    <!-- 中部广告结束 -->
    <!-- 右下角返回主页 -->
	<span id="returnTop">返回<br>顶部</span>
    <!-- 右下角返回主页 -->
    <!-- nav第二个 -->
    <nav  id="haslog" class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.8;">
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
                    <li class="active"><a href="TaskList.jsp">主页</a></li>
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
                            UserDao ud = new UserDao();		
                        	int id=	ud.findIdByName(session.getAttribute("UserName").toString());%>
                        <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/ShowUserInformPerson?id=<%=id %>">个人资料</a></li>
                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userAtasklist.jsp?id=<%=id%>'">查看已发布任务</a> </li>
	                        <li><a href="javascript:window.location.href='${pageContext.request.contextPath}/User/userBtasklist.jsp?id=<%=id%>'">查看已申请任务</a> </li>
                        <li><a href="#">test</a> </li><%} %>
                            <li class="divider"></li>
                            <li><a href="LogoutServlet">退出账号</a> </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- nav第二个结束 -->
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
   
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    用户登录
                </h4>
            </div>
              <form class="form-horizontal"  name="form2" action="LoginUser" method="post" onsubmit="return logsub();">
            <div class="modal-body">
                    <div class="form-group">
                        <label class="col-md-2 control-label">用户名:</label>
                        <div class="col-md-10"><input class="form-control" id="Username" name="username" placeholder="username"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">密码:</label>
                        <div class="col-md-10"><input class="form-control" id="Password" name="password" placeholder="password"></div>
                    </div>
               
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="submit" class="btn btn-primary">
                    点击登录
                </button>
            </div>
             </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    欢迎注册
                </h4>
            </div>
          <form class="form-horizontal" name="form1" enctype="multipart/form-data" >      
            <div class="modal-body">
                    <div class="form-group">
                        <label class="col-md-4 control-label red">用户名:</label>
                        <div class="col-md-6"><input class="form-control" name="username_r" value="${user.username}" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label red">密码:</label>
                        <div class="col-md-6"><input class="form-control" name="password_r" value="${user.password}" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label red">确认密码:</label>
                        <div class="col-md-6"><input class="form-control" name="password2" value="${user.password}" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label red">电话:</label>
                        <div class="col-md-6"><input class="form-control" name="telephone" value="${user.telephone}" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label red">紧急联系人电话:</label>
                        <div class="col-md-6"><input class="form-control" name="emergency_call" value="${user.emergency_call}" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">紧急联系人电话2:</label>
                        <div class="col-md-6"><input class="form-control" name="emergency_call2" value="${user.emergency_call2}"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label red">身份证号码:</label>
                        <div class="col-md-6"><input class="form-control" name="id_no" value="${user.id_no}" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label red">身份证照片正反面:</label>

                        <div class="col-md-6">  
                        
                            <img id="image"  src="images/05.jpg" height="100"/>
                            <input  type="file"  id="file" class="form-control" onchange="selectImage(this);" />
                      
                            
                            </div>
                  </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">身高:</label>
                        <div class="col-md-6"><input class="form-control" name="height" value="${user.height}"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label red">年龄:</label>
                        <div class="col-md-6"><input class="form-control" name="age" value="${user.age}" ></div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">情感状态:</label>
                        <div class="col-md-6">
                            <label class="radio-inline"><input type="radio" name="state" id=boy" value="单身">单身</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="恋爱">恋爱</label>
                            <label class="radio-inline"><input type="radio" name="state" id="girl" value="已婚">已婚</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">个人照片:</label>
                        <div class="col-md-6">

							<!--  <form name="infoLogoForm" method="post" enctype="multipart/form-data" id="ss">-->
                            <img  id="image2" height="100"/>
                            <input  type="file" id="file2" class="form-control" onchange="selectImage2(this);">
                           <!-- <button class="btn btn-primary" type="submit" onclick="uploadImage();">上传</button>
                              </form>-->
                            </div>
                 </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">性别:</label>
                        <div class="col-md-6">
                            <label class="radio-inline"><input type="radio" name="sex" id=boy" value="男">男</label>
                            <label class="radio-inline"><input type="radio" name="sex" id="girl" value="女">女</label>
                            <label class="radio-inline"><input type="radio" name="sex" id="girl" value="保密">保密</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">地区:</label>
                       <!--   <div class="col-md-6">
							 <div class="dropdown" style="position: realtive;">
                                <button   class="btn btn-default dropdown-toggle" id="dropdown1" type="button" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="true">
                                请选择    <input type="text" class="caret" id="datebox"  name="area" value="ddd"></input>
                                </button>
                                <ul class="dropdown-menu" id="demolist" aria-labelledby="dropdown1" style="position:absolute;top:34px;">
                                    <li id="demolist"><a href="#">海淀</a> </li>
                                    <li><a href="#">朝阳</a> </li>
                                    <li><a href="#">丰台</a> </li>
                                    <li><a href="#">东城区</a> </li>
                                    <li><a href="#">西城区</a> </li>
                                    <li><a href="#">通州区</a> </li>
                                    <li><a href="#">昌平区</a> </li>
                                    <li><a href="#">石景山</a> </li>
                                    <li class="divider"></li>
                                    <li><a href="../home2.html">其他</a> </li>

                                </ul>
                            </div>
                            -->
                           <select id="area" class="btn btn-default" style="margin-left:14px;">
  							 <option  value ="朝阳">朝阳</option>
  							 <option value ="丰台">丰台</option>
  							 <option value="东城区">东城区</option>
  							 <option value="西城区">西城区</option>
  							 <option value ="通州区">通州区</option>
  							 <option value="昌平区">昌平区</option>
  							 <option value="石景山">石景山</option>
  							 <option value="其他">其他</option>
						   </select>  
                        </div>
                    </div>
                    <!-- 兴趣爱好文本框 -->
                    <div class="form-group">
                        <!-- <label class="col-md-4 control-label">个人爱好:</label>
                        <label class="checkbox-inline"><input type="checkbox" name="sex" id=boy" value="option1">游泳</label>
                        <label class="checkbox-inline"><input type="checkbox" name="sex" id=boy" value="option1">阅读</label>
                        <label class="checkbox-inline"><input type="checkbox" name="sex" id=boy" value="option1">电影</label>
                        <label class="checkbox-inline"><input type="checkbox" name="sex" id=boy" value="option1">游戏</label>
                        <label class="checkbox-inline"><input type="checkbox" name="sex" id=boy" value="option1">音乐</label><br>
                        <label class="checkbox-inline"><input type="checkbox" name="sex" id=boy" value="option1">其他</label> -->
                        <label class="col-md-4 control-label red">爱好:</label>
                        <div class="col-md-6"><input class="form-control" name="hobby" value="${user.hobby}"></div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">民族:</label>
                        <div class="col-md-6">
                            <label class="radio-inline"><input type="radio" name="minzu" id="boy" value="汉族">汉族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="藏族">藏族</label>
                            <label class="radio-inline"><input type="radio" name="minzu" id="girl" value="维吾尔族">维吾尔族</label>
                        </div>
                    </div>
                      <div class="form-group">
                    <label class="col-md-4 control-label">个人简介:</label>
                    <div class="col-md-6"><textarea class="form-control" id="information" name="information"></textarea></div>
                </div>
                    <div class="form-group">
                        <div class="col-md-4"></div>

                    </div>

              
           
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="submit" class="btn btn-primary" onclick="uploadImage();">
                    点击注册
                </button>
            </div>
             </div>
             <!-- </form> -->
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div style="background-color: #ffc107">
        <div class="container">
            <div class="row" >
                <div class="col-md-12">
                    <h2 style="text-align: center; padding-top: 300px;color: white">
                        零碎时间利用网<br>
                    在这里没有浪费时间的概念
                    </h2>
                </div>
            </div>
        </div>
</div>
<div style="background-color: white">
                <div class="container">
                    <div class="row" >
                        <div class="col-md-4" style="padding-top: 20px">
                            <div class="thumbnail" id="Largeimgdiv">
                            <a href="ShowUserInform?id=1">
                            <img src="${pageContext.request.contextPath}/upload/<%= user.getSelf_photo()%>" class="img-circle" id="Largeimg" style="width:300px;height:300px;"></a>
                            <div class="caption">
                                <h3><%= user.getUsername()%></h3>
                                <p><%= user.getInformation()%></p>
                                <p>
                                <a href="ShowUserInform?id=1" class="btn btn-danger" role="button">详情</a>
                                 <a href="#" class="btn btn-default" role="button">加好友</a>
                                 </p>
                            </div>
                        </div>
            </div>
            <div class="col-md-4" style="padding-top: 20px">
                <div class="thumbnail" id="Largeimgdiv">
                    <img src="${pageContext.request.contextPath}/upload/<%= user2.getSelf_photo()%>" class="img-circle" id="Largeimg" style="width:300px;height:300px;">
                    <div class="caption">
                        <h3><%= user2.getUsername()%></h3>
                        <p id="rwer"><%= user2.getInformation()%></p>
                        <p><a href="ShowUserInform?id=2" class="btn btn-danger" role="button">详情</a> 
                        <a href="#" class="btn btn-default" role="button">加好友</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="padding-top: 20px">
                <div class="thumbnail" id="Largeimgdiv">
                    <img src="${pageContext.request.contextPath}/upload/<%= user3.getSelf_photo()%>" class="img-circle" id="Largeimg" style="width:300px;height:300px;">
                    <div class="caption">
                        <h3><%= user3.getUsername()%></h3>
                        <p><%= user3.getInformation()%></p>
                        <p><a href="ShowUserInform?id=3" class="btn btn-danger" role="button">详情</a>
                         <a href="#" class="btn btn-default" role="button">加好友</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="background-image: url('images/4501.jpg')" id="container">
    <div class="container" >
        <div class="row">
            <div class="col-md-12"><h1 style="padding-top: 200px">123</h1></div>
        </div>
    </div>
</div>

<div style="background-color: #ffc107">
    <div class="container">
        <div class="row">
        	<!--
            <HR width="100%" color=#987cb9 >
            <div class="col-md-4" style="text-align: center" >
                <a href="#" style="color: #014d67;" >测试</a><br>
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a>
            </div>
            <div class="col-md-4" style="text-align: center;">
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a><br>
                <a href="#" style="color: #014d67">测试</a>
            </div>
            <div class="col-md-4" style="text-align: center">
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a>
                <br>
                <a href="#" style="color: #014d67">测试</a><br>
                <a href="#" style="color: #014d67">测试</a><br>
                <a href="#" style="color: #014d67">测试</a><br>
                <a href="#" style="color: #014d67">测试</a>
            </div> -->
         <div class="col-md-12">   <HR width="100%" color=#987cb9 ></div>
            <h6 id="copyright" >Copyright © 2017 - 2018 空闲帮 版权所有</h6>
        </div>
    </div>
</div>
<audio src="music/Good Time.mp3" loop autoplay></audio>
<script src="js/advertisem.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>