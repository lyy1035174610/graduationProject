<%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/4/24
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<frameset rows="59,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="<%=request.getContextPath()%>/top" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
    <frameset cols="213,*" frameborder="no" border="0" framespacing="0">
        <frame src="<%=request.getContextPath()%>/adminLeft" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
        <frame src="<%=request.getContextPath()%>/adminCenter" name="mainFrame" id="mainFrame" title="mainFrame" />
    </frameset>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>