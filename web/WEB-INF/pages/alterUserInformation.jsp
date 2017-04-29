<%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/4/5
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1 style="color:blue;">注册表单</h1>
    <hr/>
    <form name="alterUserInformation" action="saveChange" method="post">

        <table cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>用户名:</td>
                <td><input type="text" name="u_name" readonly="true" placeholder="${u_name} value="${u_name}"/></td>
            </tr>
            <tr>
                <td>旧密码：</td>
                <td><input type="password" name="oldPassword"/></td>
            </tr>
            <tr>
                <td>新密码：</td>
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
                <td colspan="2" align="center"><input type="submit" value="确定修改">
                    <input type="reset" value="重置"/></td>
            </tr>
        </table>
    </form>

</center>
</body>
</html>
