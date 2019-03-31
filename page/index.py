#coding:utf-8
import webbrowser

GEN_HTML = 'index-py.html'
f = open(GEN_HTML, 'w')

str1 = "Reset"
str2 = "Submit"
str3 = "English"

message = """
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Mr. or Mrs. | AMiner</title>
    <meta name="description" content="BITI">
    <meta name="author" content="Michael An">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/app.min.css">
    <link rel="stylesheet" href="css/vendor.min.css">
    <link rel="stylesheet" href="css/cssReset.css">
  </head>
  <body class="aminer-style-2 desktop-detected">
    <div id="main" style="margin:0;">
      <!-- 导航 -->
      <div class="container ">
        <div class="row">
          <div class="col-xs-12 col-md-12">
            <ul style="border-bottom:1px solid lightgrey" class="nav nav-tabs">
              <li class="active" id="searchTab"><a href="#" class="">Home</a></li>
              <li id="searchTab"><a href="#" class="">API Docs</a></li>
              <li id="searchTab"><a href="#" class="">Methods</a></li>
              <li id="searchTab"><a href="#" class="">Contact</a></li>
              <li id="searchTab"><a href="./index-en.html" class="">language</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!-- 标题 -->
      <div class="container">
        <div class="row">
          <div style="margin-top:20px" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div style="margin-top:10px; margin-bottom:40px; font-size:30px; font-weight:600;" class="text-center ">
              Welcome Mr./Mrs.?<br>Scholar Gender Prediction
            </div>
            <!-- 表单 -->
            <form name="form" class="form-horizontal">
              <fieldset>
                <div class="row">
                  <!-- 左侧输入款 -->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label style="font-size:15px" class="col-sm-2 control-label text-right ">Name</label>
                      <div class="col-sm-8">
                        <input id="name_input" type="text" name="name" style="padding-left: 12px; border-radius:4px!important" placeholder="Enter a name here" class="form-control">
                      </div>
                    </div>
                  </div>
                  <!-- 右侧输入框 -->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label style="font-size:15px" class="col-sm-2 control-label text-right ">Affiliation</label>
                      <div class="col-sm-8">
                        <input id="aff_input" type="text" name="affiliation" style="padding-left: 12px; border-radius:4px!important" placeholder="Enter an affiliation here" class="form-control">
                      </div>
                    </div>
                  </div>
                </div>
              </fieldset>
            </form>
          </div>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div style="margin-top:18px;" class="text-center">
              <button style="margin-right:10px;padding-left:40px;padding-right:40px;border-radius:4px;" id="resetBtn" class="btn btn-default ">button1</button>
              <button style="margin-left:10px;padding-left:40px;padding-right:40px;border-radius:4px;" id="submitBtn" class="btn btn-primary ">button2</button>
            </div>
            <div style="margin-top:10px; font-size:14px;" class="text-center ">
              P.S. English supported only
            </div>
          </div>
        </div>
        <hr>
      </div>

      <!-- 页脚 -->
      <div style="margin-top:20px;" class="container">
        <div style="margin-bottom:30px;" class="row">
          <div class="col-xs-12 col-md-12">
            <h4 class="">Related Publications</h4>
            <table style="margin-top: 5px;">
              <tbody>
                <tr>
                  <td width="10%" valign="top">[Gu,&nbsp;&nbsp;&nbsp; 2016]</td>
                  <td style="text-align:left;" width="90%">
                    <span>Xiaotao Gu, Hong Yang, Jie Tang, and Jing Zhang. "Web user profiling using data redundancy." In Advances in Social Networks Analysis and Mining (ASONAM), 2016 IEEE/ACM International Conference on, pp. 358-365. IEEE, 2016.</span>
                  </td>
                </tr>
                <tr>
                  <td width="10%" valign="top">[Tang, 2008]</td>
                  <td style="text-align:left;" width="90%">
                    Jie Tang, Jing Zhang, Limin Yao, Juanzi Li, Li Zhang, and Zhong Su. "ArnetMiner: Extraction and Mining of Academic Social Networks." In Proceedings of the 14th ACM SIGKDD international conference on Knowledge discovery and data mining, pp. 990-998. ACM, 2008.
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="container"  style="height:56px;">
          <div style="border-top:1px solid whitesmoke; margin-bottom:10px" class="row">
            <div style="padding-top: 5px; padding-left: 0;" class="col-xs-8">
              <ul class="footer-socials list-inline">
                <li class="">2005 - 2018 © AMiner. All Rights Reserved. 京ICP备17059297号-2</li>
                <li><a href="#" style="color:#428bca" class="tooltips ">Contact</a></li>
                <li><a href="#" style="color:#428bca" class="tooltips ">Introduction</a></li>
                <li><a href="#" style="color:#428bca" class="tooltips ">Partners</a></li>
                <li><a href="#" style="color:#428bca" class="tooltips ">Reader-recommendation</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>

    </div>

  <script src="components/jquery-1.11.0.min.js"></script>
  <script src="components/bootstrap.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){

      $("#resetBtn").click(function(){
        $('#name_input').val('');
        $('#aff_input').val('');
      });

      $("#submitBtn").click(function(){

        var name = $('#name_input').val();
        var aff = $('#aff_input').val();
        console.log(name, aff);

        // send data via ajax
        var form = new FormData();
        form.append("username", name);
        form.append("affiliation", aff);
        var url = "./test/public/testupload";
      　$.ajax({
          url: url,
          type: "post",
          data: form,
          processData: false,
          contentType: false,
          success:function(data){
            console.log(data);
            // document.getElementById("#result") = data;
            $('#name_input').val('');
            $('#aff_input').val('');
          }
        });

        // send data via php
        var xhr = new XMLHttpRequest();
        xhr.open("post", "1.php");
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoeded");
        var info = "name=" + name + "affilication" + aff;
        xhr.send(info);
        xhr.onreadystatechange = function(){
          if(xhr.readyState == 4){
            var result =xhr.responseText;
            console.log(result);
            // document.getElementById("#result") = result;
          }
        }

      });
    });
  </script>
  </body>
</html>
"""
new_message = message.replace('language', str3).replace('button1', str1).replace('button2', str2);

f.write(new_message)
f.close()