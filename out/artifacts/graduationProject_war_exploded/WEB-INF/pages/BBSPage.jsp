<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/3/28
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>论坛界面</title>
</head>
<body>
<%--欢迎 <a href="./userInformation?u_name=${u_name}">${u_name}</a> 登陆系统！ <a href="./quit">退出</a>--%>
<center>
<form action="printRecord?u_name=${u_name}" method="post">

    <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td><input type="text" name="record_comment"/></td>
            <td><input type="submit" value="留言"/></td>
        </tr>
    </table>
</form>
</center>
<center>
    <%
        LinkedList<String> list = (LinkedList<String>) request.getAttribute("list");
        Iterator<String> iterator = list.iterator();
        while(iterator.hasNext()){
            out.println(iterator.next());
            out.println("<br/>");
        }
    %>
</center>
</body>
</html>
