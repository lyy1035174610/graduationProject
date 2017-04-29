<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/3/28
  Time: 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户个人信息页面</title>
    <script>
        function button_onclick(){
            //在当前也面进行跳转
            window.location.href="./alterUserInformation?u_name=${u_name}";
            alert("将要进入个人信息修改页面");
        }
    </script>
</head>
<body>
欢迎 <a href="./userInformation?u_name=${u_name}">${u_name}</a> 登陆系统！ <a href="./quit">退出</a>
<center>
    <h1 style="color:blue;">用户个人信息界面</h1>
    <h2>姓名：${u_name}</h2>
    <h2>性别： ${u_sex}</h2>
    <h2>年龄：${u_age}</h2>
    <h2>电话： ${u_phone}</h2>
    <h2>邮箱：${u_email}</h2>
    <h2>简介：${u_description}</h2>
    <input type="button" value="修改个人资料" onclick="javascript:button_onclick();"/>
</center>
<%
    LinkedList<String> list = (LinkedList<String>) request.getAttribute("list");
    Iterator<String> iterator = list.iterator();
    while(iterator.hasNext()){
        out.println(iterator.next());
        out.println("<br/>");
    }
%>
<a href="./mainPage?u_name=${u_name}">返回</a>
</body>
</html>
