<%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/3/19
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../css/logins.css">
    <title>登陆界面</title>
</head>
<body>
    <div id="login">
        <h1 style="color:blue;">登陆界面</h1>
        <hr/>
        ${message}
        <form action="login" method="post">

            <table cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td>账号:</td>
                    <td><input type="text" name="u_name"/></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="password" name="u_password"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="登陆"/></td>
                </tr>
            </table>
        </form>
        <a href="./register">没有账号？请点击这里进行注册</a>
    </div>
</body>
</html>
