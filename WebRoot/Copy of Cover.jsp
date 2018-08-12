<%@ page language="java"  import="com.dao.UserDao" import="com.entity.User" import="java.util.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
UserDao udao=new UserDao();
List<User> list = udao.findUserById(1);
User user = (User)list.get(0);
List<User> list2 = udao.findUserById(1012);
User user2 = (User)list2.get(0);
List<User> list3 = udao.findUserById(1013);
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
<body>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
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
    }  
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
    }  
    reader.readAsDataURL(file.files[0]);  
}  
function uploadImage() {  
      
    $.ajax({  
        type : 'POST',  
        url : 'uploadImageAjax?t_number=929144493',  //请求路径以及传值  
        data : {  
            image : image    //这里传递的是base64编码  json格式  
        },  
        async : false,  
        dataType : 'json'  
    });  
}  
</script>
<script>

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
        		if (form1.age.value == null || form1.age.value==""){
            		alert("请输入年龄");
            		return false;
            	}
        		return true;
        		}
        function logsub()
        {
        	if (form2.username.value == null || form2.username.value==""){
        		alert("请输入用户名");
        		return false;
        		}
        }
        function tiaozhuan()
        {
          document.form1.setAttribute("enctype","multipart/form-data");
      	  document.form1.setAttribute("action","RegisterUploadFile");
          document.form1.submit();
      	  return false;
        }
        
        function tiaozhuan2()
        {
      	  document.form1.setAttribute("enctype","multipart/form-data");
      	  document.form1.setAttribute("action","SelfphotoUploadFile");

          document.form1.submit();
      	  return false;
        }
        $('#demolist li').on('click', function(){
        	$getElementId('datebox').setAttribute('value',$('#demolist li').text());
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

<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="opacity: 0.9;">
    <div class="container">
        <div style="position:fixed;left:53px;">
            <img src="images/logo/方案一 芒果图.png" style="width: 50px;height: 50px;z-index:2000;">
        </div>
        <div class="navbar-header">
            <a href="Cover.jsp" class="navbar-brand" style="font-size: 33px">空闲帮</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="navLi"><a href="ShowTask">主页</a></li>
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
                <li> <a href="#" data-toggle="modal" data-target="#login">登录</a></li>
                <li> <a href="#" data-toggle="modal" data-target="#register">注册</a></li>
            </ul>
        </div>
    </div>
</nav>
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
          <form class="form-horizontal" name="form1" method="post" action="RegisterUploadFile" onsubmit="return sub();" enctype="multipart/form-data" >      
            <div class="modal-body">
                    <div class="form-group">
                        <label class="col-md-4 control-label red">用户名:</label>
                        <div class="col-md-6"><input class="form-control" name="username" value="${user.username}" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label red">密码:</label>
                        <div class="col-md-6"><input class="form-control" name="password" value="${user.password}" ></div>
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
                        
                            <img id="image" src="<%=request.getParameter("path") %>" height="100"/>
                            <input  type="file"  id="file" class="form-control" onchange="selectImage(this);" />
                            <button class="btn btn-primary" type="submit" onclick="uploadImage();">上传</button>
                            
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
                            <button class="btn btn-primary" type="submit" onclick="uploadImage();">上传</button>
                            <!--  </form>-->
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
                        <div class="col-md-6">
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
                    <div class="col-md-6"><textarea class="form-control" id="message-text" name="information"></textarea></div>
                </div>
                    <div class="form-group">
                        <div class="col-md-4"></div>

                    </div>

              
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="submit" class="btn btn-primary">
                    点击注册
                </button>
            </div>
             </form>
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
                            <img src="images/cd/02.jpg" class="img-circle" id="Largeimg" >
                            <div class="caption">
                                <h3><%= user.getUsername()%></h3>
                                <p><%= user.getInformation()%></p>
                                <p>
                                <a href="ShowUserInform?id=1" class="btn btn-danger" role="button">Button</a>
                                 <a href="#" class="btn btn-default" role="button">Button</a>
                                 </p>
                            </div>
                        </div>
            </div>
            <div class="col-md-4" style="padding-top: 20px">
                <div class="thumbnail" id="Largeimgdiv">
                    <img src="images/cd/41.jpg" class="img-circle" id="Largeimg" >
                    <div class="caption">
                        <h3><%= user2.getUsername()%></h3>
                        <p id="rwer"><%= user2.getInformation()%></p>
                        <p><a href="#" class="btn btn-danger" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="padding-top: 20px">
                <div class="thumbnail" id="Largeimgdiv">
                    <img src="images/cd/17.jpg" class="img-circle" id="Largeimg" >
                    <div class="caption">
                        <h3><%= user3.getUsername()%></h3>
                        <p><%= user3.getInformation()%></p>
                        <p><a href="#" class="btn btn-danger" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
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
            </div>
         <div class="col-md-12">   <HR width="100%" color=#987cb9 ></div>
            <h6 id="copyright" >Copyright © 2017 - 2018 空闲帮 版权所有</h6>
        </div>
    </div>
</div>
<audio src="music/Good Time.mp3" loop autoplay></audio>
</body>
</html>