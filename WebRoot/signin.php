<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>sign</title>
    <link rel="stylesheet" href="css/cssReset.css">
    <link rel="stylesheet" href="bootstrap.min.css" >
    <link rel="stylesheet" href="自定义.css">
    <script src="jquery-2.1.4.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <style>
        body{
            padding-top: 200px;
        }
        nav {
            opacity: 0.9;
        }
        nav div span a {
            font-size:30px;
        }
    </style>
    <!-- php这段代码看不懂，也存在问题 -->
    <?php
        session_start();
        if (isset($_POST['user'])) {
            $user = $_POST['user'];
            $password = $_POST['password'];
            if ($user == 'admin' && $password == 'password') {//验证正确
                $_SESSION['user'] = $user;
                //跳转到首页
                header('http://localhost:63342/瀑布流/home.htm');
            }else{
                // echo "<script>alert('登录失败，用户名或密码不正确');</script>";
                exit();
            }
        }
        ?>
</head>
<body>

    <nav class="navbar navbar-nav navbar-fixed-top navbar-inverse" role="navigation">
        <div class="container">
            <span class="navbar-header">
                <a href="Cover.html" class="navbar-brand">说唱</a>
            </span>
            <ul class="nav navbar-nav">
                <li><a href="Cover.html">Home</a></li>
                <li><a href="Cover.html">Music</a></li>
                <li><a href="Photo.html">Photo</a></li>
                <li><a href="Photo.html">Note</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form class="form-horizontal">

                    <div class="form-group">
                        <label class="col-md-2 control-label" name="user" style="color: #eee">用户名</label>
                        <div class="col-md-7">
                            <input type="text" class="form-control" placeholder="Email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-2 control-label" type="password" name="password" style="color: #eee">密码</label>
                        <div class="col-md-7">
                            <input type="password" class="form-control" placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <button type="submit" class="btn btn-default">登陆</button>
                            <br><br><br>
                            <div class="col-md-offset-1 col-md-10">还没有账号?&nbsp;
                                <button class="btn btn-success">
                                    <a href="注册表单.html" style="color: #eee">注册</a>
                                </button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <footer class="main-footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4">                   
                    <h4>新闻</h4>
                    <div class="content recent-post">
                        <div class="recent-single-post">
                            <a href="#" class="post-title">测试内容</a>
                            <div class="date">2018.06.14</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <h4 class="title">热点</h4>
                    <div class="content tag-cloud">
                        <a href="#">Eminem</a>
                        <a href="#">Yelawolf</a>
                        <a href="#">Sluaterhouse</a>
                    </div>
                </div>

                <div class="col-md-4">
                    <h4 class="title">合作伙伴</h4>
                    <div class="content tag-cloud frend-links">
                        <a href="#">新浪微博</a>
                        <a href="#">腾讯微博</a>
                        <a href="#">搜狐视频</a>
                        <a href="#">百度百科</a>
                        <a href="#">华为荣耀</a>
                        <a href="#">世界之窗</a>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>