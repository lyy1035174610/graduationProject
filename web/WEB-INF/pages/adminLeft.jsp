<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 12px;
	color: #033d61;
}
-->
</style>
<style type="text/css">
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #ffffff; POSITION: relative; TOP: 2px 
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #FFCC00; POSITION: relative; TOP: 2px
}

</style>
<script>
var he=document.body.clientHeight-105
document.write("<div id=tt style=height:"+he+";overflow:hidden>")
</script>

</head><body><table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tbody><tr>
    <td height="28" background="images/main_40.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr>
        <td width="19%">&nbsp;</td>
        <td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
      <tbody>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tbody>
          <tr>
            <td height="23" background="images/main_47.gif" id="imgmenu2" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(2)" onmouseout="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                  <td width="18%">&nbsp;</td>
                  <td width="82%" class="STYLE1">系统管理</td>
                </tr>
            </tbody></table></td>
          </tr>
          <tr>
            <td background="images/main_51.gif" id="submenu2"><div class="sec_menu">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody><tr>
                    <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tbody><tr>
                          <td width="16%" height="25"><div align="center"><img src="images/left.gif" width="10" height="10"></div></td>
                          <td width="84%" height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                              <tbody><tr>
                                <td height="20" style="cursor: pointer; border-style: none; border-width: 1px;" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; " onmouseout="this.style.borderStyle='none'"><a href="#" target="#"><span class="STYLE3">会员管理</span></a></td>
                              </tr>
                          </tbody></table></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10"></div></td>
                          <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                              <tbody><tr>
                                <td height="20" style="cursor: pointer; border-style: none; border-width: 1px;" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; " onmouseout="this.style.borderStyle='none'"><a href="#" target="#"><span class="STYLE3">钓点管理</span></a></td>
                              </tr>
                          </tbody></table></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10"></div></td>
                          <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                              <tbody><tr>
                                <td height="20" style="cursor: pointer; border-style: none; border-width: 1px;" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; " onmouseout="this.style.borderStyle='none'"><a href="#" target="#"><span class="STYLE3">会员浏览记录管理</span></a></td>
                              </tr>
                          </tbody></table></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10"></div></td>
                          <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                              <tbody><tr>
                                <td height="20" style="cursor: pointer; border-style: none; border-width: 1px;" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; " onmouseout="this.style.borderStyle='none'"><a href="#" target="#"><span class="STYLE3">留言管理</span></a></td>
                              </tr>
                          </tbody></table></td>
                        </tr><tr>
                          <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10"></div></td>
                          <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                              <tbody><tr>
                                <td height="20" style="cursor: pointer; border-style: none; border-width: 1px;" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; " onmouseout="this.style.borderStyle='none'"><a href="#" target="#"><span class="STYLE3">钓场评分管理</span></a></td>
                              </tr>
                          </tbody></table></td>
                        </tr>
                    </tbody></table></td>
                  </tr>
                  <tr>
                    <td height="5"><img src="images/main_52.gif" width="151" height="5"></td>
                  </tr>
                </tbody></table>
            </div></td>
          </tr>
        </tbody></table>          </td>
      </tr>
      
    </tbody></table></td>
  </tr>
  
</tbody></table>
<script>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
imgmenu = eval("imgmenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
imgmenu.background="images/main_47.gif";
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
imgmenu.background="images/main_48.gif";
}
}

</script></body></html>