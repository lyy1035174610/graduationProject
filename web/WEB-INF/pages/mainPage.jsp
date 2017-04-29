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
    <title>主页</title>
</head>
<body>
欢迎 <a href="./userInformation?u_name=${u_name}">${u_name}</a> 登陆系统！ <a href="./quit">退出</a>
<center>
    <h1>系统主页</h1>
    <h2>论坛：</h2><h3><a href="./BBSPage?u_name=${u_name}">这是个链接，跳转到论坛页面</a></h3><!-- hn标签无法在一行中使用多钟字体大小，因为它会帮你加入换行符-->
    <h2>钓场推荐：</h2><h3><a href="./testMapAPI?u_name=${u_name}">这是个链接，跳转到钓场主页面</a></h3>
    <h2>钓鱼百科：</h2><h3><a href="./fishingKnowlege?u_name=${u_name}">这是个链接，跳转到钓鱼百科页面</a></h3>
</center>
</body>
</html>
