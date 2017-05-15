<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导航栏</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(<%=request.getContextPath()%>/images/1.jpg);
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="<%=request.getContextPath()%>/images/1.jpg";//
	
	for(var i=1;i<30;i++)
	{
	  
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="<%=request.getContextPath()%>/images/1.jpg";}//
	  }
	}
}

function list(idstr){
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);

}

</SCRIPT>

<body>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <TD>
		<%--顶部用户信息部分开始--%>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="207" height="55" background="<%=request.getContextPath()%>/images/1.jpg">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="<%=request.getContextPath()%>/images/1.jpg" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01">您好，<span class="left-font02">${user.u_name}</span></td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="<%=request.getContextPath()%>/quit" target="_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
			<%--顶部用户信息部分结束--%>

		<!-- 钓场模块开始    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img2" id="img2" src="<%=request.getContextPath()%>/images/1.jpg" width="8" height="11" /></td>
						<td width="92%">
							<a href="<%=request.getContextPath() %>/testMapAPI?u_name=${user.u_name}" target="mainFrame" class="left-font03" onClick="list('7');" >钓场模块</a></td>
					</tr>
				</table>
			</td>
          </tr>
		</TABLE>
		<!--  钓场模块结束    -->

		<!-- 钓鱼百科开始    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img3" id="img3" src="<%=request.getContextPath()%>/images/1.jpg" width="8" height="11" /></td>
						<td width="92%">
							<a href="<%=request.getContextPath() %>/fishingKnowlege" target="mainFrame" class="left-font03" onClick="list('7');" >钓鱼百科</a></td>
					</tr>
				</table>
			</td>
          </tr>
		</TABLE>
		<!--  钓鱼百科结束    -->
		
		<!-- 个人主页开始    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img4" id="img4" src="<%=request.getContextPath()%>/images/1.jpg" width="8" height="11" /></td>
						<td width="92%">
							<a href="<%=request.getContextPath() %>/userInformation?u_name=${user.u_name}" target="mainFrame" class="left-font03" onClick="list('7');" >个人主页</a></td>
					</tr>
				</table>
			</td>
          </tr>
		</TABLE>
		<!--  个人主页结束    -->

			<!--  留言模块开始    -->
			<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
				<tr>
					<td height="29">
						<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="8%"><img name="img1" id="img1" src="<%=request.getContextPath()%>/images/1.jpg" width="8" height="11" /></td>
								<td width="92%">
									<a href="<%=request.getContextPath() %>/BBSPage?u_name=${user.u_name}" target="mainFrame" class="left-font03" onClick="list('8');" >留言模块</a></td>
							</tr>
						</table>
					</td>
				</tr>
			</TABLE>
			<!--  留言模块结束    -->

		</TD>
	</tr>
</table>
</body>
</html>
