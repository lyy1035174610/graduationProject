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
    <title>修改个人信息界面</title>
    <script type= "text/javascript" >
        function save() {
            var u_password1 = document.getElementById("u_password1").value.trim();
            var u_password2 = document.getElementById("u_password2").value.trim();
            var u_age = document.getElementById("u_age").value.trim();
            var u_phone = document.getElementById("u_phone").value.trim();
            var u_email = document.getElementById("u_email").value.trim();
            var passwordRegex=/^[0-9A-Za-z_]\w{7,15}$/;
            var emailRegex = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            var phoneRegex = /^((\(\d{3}\))|(\d{3}\-))?13\d{9}$/;
            var ageRegex = /^(?:[1-9]?\d|100)$/;

            if((u_password1!=u_password2)||u_password1==null){
                alert("密码和确认密码必须相同且不能为空！密码长度在8个字符到16个字符，由字母、数字和\"_\"组成.");
                return false;
            }
            if(!passwordRegex.test(u_password1)){
                //密码长度在8个字符到16个字符，由字母、数字和".""-""_""@""#""$"组成
                //var passwordRegex=/^[0-9A-Za-z.\-\_\@\#\$]{8,16}$/;
                //密码长度在8个字符到16个字符，由字母、数字和"_"组成
                alert("密码长度必须在8个字符到16个字符之间");
                return false;
            }

            if(!ageRegex.test(u_age)){
                alert("年龄必须为0~99之间的整数且不能为空！")
                return false;
            }
            if(!phoneRegex.test(u_phone)){
                alert("手机号码输入有误！")
                return false;
            }
            if(!emailRegex.test(u_email)){
                alert("邮箱输入有误！")
                return false;
            }
            document.getElementById("alterUserInformationForm").submit();
        }
    </script>
</head>
<body>
<center>
    <h1 style="color:blue;">个人信息修改界面</h1>
    <hr/>
    <form id="alterUserInformationForm" name="alterUserInformation" action="saveChange" method="post">

        <table cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>用户名:</td>
                <td><input type="text" id="u_name" name="u_name" readonly="true"  value="${user.u_name}"/></td>
                <%--placeholder="${u_name}--%>
            </tr>
            <tr>
                <td>旧密码：</td>
                <td><input type="password" id="oldPassword" name="oldPassword"/></td>
            </tr>
            <tr>
                <td>新密码：</td>
                <td><input type="password" id="u_password1" name="u_password1"/></td>
            </tr>
            <tr>
                <td>确认密码：</td>
                <td><input type="password" id="u_password2" name="u_password2"/></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><input type="radio" id="u_sex" name="u_sex" value='男' checked/>男<input type="radio" name="u_sex" value='女'/>女</td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td><input type="text" id="u_age" name="u_age"/></td>
            </tr>
            <tr>
                <td>电话：</td>
                <td><input type="text" id="u_phone" name="u_phone"/></td>
            </tr>
            <tr>
                <td>电子邮箱：</td>
                <td><input type="text" id="u_email" name="u_email"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input onclick="save();" type="button" value="确定修改">
                    <input type="reset" value="重置"/></td>
            </tr>
        </table>
    </form>
    <h3>${err}</h3>
</center>
</body>
</html>
