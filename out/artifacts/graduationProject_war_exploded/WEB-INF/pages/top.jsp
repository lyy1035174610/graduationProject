<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
.logo{
  display: block;
  width: 557px;
  height: 59px;
  text-decoration: none;
  margin-left: 30px;
  line-height: 59px;
  font-size: 30px;
  color: #8FB0E1;
  font-weight: bold;
  font-family:方正舒体;
}

</style>
<%--<link href="../css/css.css" rel="stylesheet" type="text/css" />--%>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="59" background="<%=request.getContextPath()%>/images/1.jpg"><table width="99%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="1%"><a href="<%=request.getContextPath()%>/login" target="_blank" class="logo">智能钓场推荐系统</a></td>
        <td width="64%" align="right" style="font-size:12px;vertical-align:bottom;color:blue;">您好！欢迎使用智能钓场推荐系统！！！</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
