<%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/3/19
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>注册界面</title>
  <script type= "text/javascript" >
      function changeImage(img){
//alert("relax gay");//弹窗口方法
//img.src = img.src;//通过添加一个时间值实现获取新的图片而不是从缓存里拿旧的图片
          img.src = img.src+ "?"+ new Date().getTime();
      }
      function save() {
          var u_password1 = document.getElementById("u_password1").value.trim();
          var u_password2 = document.getElementById("u_password2").value.trim();
          var u_name = document.getElementById("u_name").value.trim();
          var u_age = document.getElementById("u_age").value.trim();
          var u_phone = document.getElementById("u_phone").value.trim();
          var u_email = document.getElementById("u_email").value.trim();
          var nameRegex=/^[^@#]{3,16}$/;
          var passwordRegex=/^[0-9A-Za-z_]\w{7,15}$/;
          var emailRegex = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
          var phoneRegex = /^((\(\d{3}\))|(\d{3}\-))?13\d{9}$/;
          var ageRegex = /^(?:[1-9]?\d|100)$/;

          //验证用户名（为3~16个字符，且不能包含”@”和”#”字符）
          if(u_name==null||(!nameRegex.test(u_name))){
              alert("用户名为3~16个字符，且不能包含”@”和”#”字符");
              return false;
          }
          if((u_password1!=u_password2)||u_password1==null){
              alert("密码和确认密码必须相同且不能为空！密码长度在8个字符到16个字符，由字母、数字和\"_\"组成.");
              return false;
          }
          if(!passwordRegex.test(u_password1)){
              //密码长度在8个字符到16个字符，由字母、数字和".""-""_""@""#""$"组成
              //var passwordRegex=/^[0-9A-Za-z.\-\_\@\#\$]{8,16}$/;
              //密码长度在8个字符到16个字符，由字母、数字和"_"组成
              alert("密码长度必须在8个字符到16个字符之间");
              return false;
          }

          if(!ageRegex.test(u_age)){
              alert("年龄必须为0~99之间的整数且不能为空！")
              return false;
          }
          if(!phoneRegex.test(u_phone)){
              alert("手机号码输入有误！")
              return false;
          }
          if(!emailRegex.test(u_email)){
              alert("邮箱输入有误！")
              return false;
          }
          document.getElementById("registerForm").submit();
      }
  </script>
</head>
<body>
<center>
  <h3>${err}</h3>
  <h1 style="color:blue;">注册表单</h1>
  <hr/>
  <form id="registerForm" name="register" action="save_register" method="post">

    <table cellspacing="0" cellpadding="0" border="0">
      <tr>
        <td>用户名:</td>
        <td><input type="text" id="u_name" name="u_name" dataType="Limit" require="true" msg="用户名不能为空"/></td>
      </tr>
      <tr>
        <td>密码：</td>
        <td><input type="password" id="u_password1" name="u_password1"/></td>
      </tr>
      <tr>
        <td>确认密码：</td>
        <td><input type="password" id="u_password2" name="u_password2"/></td>
      </tr>
      <tr>
        <td>性别：</td>
        <td><input type="radio" name="u_sex" value='男' checked/>男<input type="radio" name="gender" value='女'/>女</td>
      </tr>
      <tr>
        <td>年龄：</td>
        <td><input type="text" id="u_age" name="u_age"/></td>
      </tr>
      <tr>
        <td>电话：</td>
        <td><input type="text" id="u_phone" name="u_phone"/></td>
      </tr>
      <tr>
        <td>电子邮箱：</td>
        <td><input type="text" id="u_email" name="u_email"/></td>
      </tr>
      <tr>
        <td>服务协议：</td>
        <td><textarea rows="10" cols="40">你是白痴！</textarea></td>
      </tr>
      <tr>
        <td>是否接受协议：</td>
        <td><input type="checkbox"name='rule'value='accept' checked/>接受</td>
      </tr>
      <tr>
        <td>验证码：</td>
        <td><input type="text" name="checkcode"/></td>
        <td> <img src= "/graduationProject/DrawPicture" onclick= "changeImage(this)" ></td>
      </tr>
      <tr>
        <td colspan="2" align="center"><input onclick="save();" type="button" value="注册">
          <input type="reset" value="重置"/></td>
      </tr>
    </table>
  </form>

</center>
</body>
</html>
