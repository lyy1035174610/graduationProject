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
  </script>
</head>
<body>
<center>
  <h1 style="color:blue;">注册表单</h1>
  <hr/>
  <form name="register" action="save_register" method="post">

    <table cellspacing="0" cellpadding="0" border="0">
      <tr>
        <td>用户名:</td>
        <td><input type="text" name="u_name"/></td>
      </tr>
      <tr>
        <td>密码：</td>
        <td><input type="password" name="u_password1"/></td>
      </tr>
      <tr>
        <td>确认密码：</td>
        <td><input type="password" name="u_password2"/></td>
      </tr>
      <tr>
        <td>性别：</td>
        <td><input type="radio" name="u_sex" value='男' checked/>男<input type="radio" name="gender" value='女'/>女</td>
      </tr>
      <tr>
        <td>年龄：</td>
        <td><input type="text" name="u_age"/></td>
      </tr>
      <tr>
        <td>电话：</td>
        <td><input type="text" name="u_phone"/></td>
      </tr>
      <tr>
        <td>电子邮箱：</td>
        <td><input type="text" name="u_email"/></td>
      </tr>
      <tr>
        <td>上传头像：</td>
        <td><input type="file" name="head_picture"/></td>
      </tr>
      <tr>
        <td>服务协议：</td>
        <td><textarea rows="10" cols="40">你是白痴！</textarea></td>
      </tr>
      <tr>
        <td>是否接受协议：</td>
        <td><input type="checkbox"name='rule'value='accept'/>接受</td>
      </tr>
      <tr>
        <td>验证码：</td>
        <td><input type="text" name="checkcode"/></td>
        <td> <img src= "/graduationProject/DrawPicture" onclick= "changeImage(this)" ></td>
      </tr>
      <tr>
        <td colspan="2" align="center"><input type="submit" value="注册">
          <input type="reset" value="重置"/></td>
      </tr>
    </table>
  </form>

</center>
</body>
</html>
