<%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/4/22
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <title>登录表单</title>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        $("#button_submit").click(function(){
            //序列化表单元素，返回json数据
           // var params = $("#userForm").serializeArray();
            var params ={};
            var u_name = document.getElementById("u_name").value;
            var u_password = document.getElementById("u_password").value;
            params.push("u_name",u_name);
            params.push("u_password",u_password);
            //通过id来获取而不是name
            alert(document.getElementById("u_name").value);
            //console.log(params);
//            一对”[]“表示一个数组，“[]”中间每一个“{}"都是数组的一个元素。
//            {}表示一个对象，{}内每一个":"和其前后组成对象的一个属性：”属性:属性值“
//            比如上面的”Uid:用户编号“就是他外层{}的一个属性。
            //也可以把表单之外的元素按照name value的格式存进来
            //params.push({name:"hello",value:"man"});
            $.ajax({
                url:"<%=request.getContextPath()%>/sendJson",
                type:"post",
                data:params
            });
        });

        $("#getJson").click(function(){
            //
           // var data = {"number":123};
            $.ajax({
                <%--type:"post",--%>
                <%--url:"<%=request.getContextPath()%>/getJson",--%>
                <%--data:data,--%>
                <%--dataType: "json",--%>
                <%--ContentType: "application/json;charset=UTF-8",--%>
                url:"<%=request.getContextPath()%>/getJson",
                type:"post",
                success:function(data){
                    var arr = eval(data);
                    alert(arr.length);
                    for(var m = 0; m < arr.length; m++){
                        alert(arr[m].u_name);
                    }
                }
            });
        });
    });
</script>
<body>
<form id="userForm">
    用户名：<input name="u_name" id="u_name" type="text" />
    <br/>
    密&nbsp;&nbsp;&nbsp;码：<input name="u_password" type="password" />
    <br/>
</form>
<button id="button_submit" >提交</button>
<button type="reset" >重置</button>
<button id="getJson" >从后台获取json数据解析到前台</button><br/>
<iframe height="700" width="1000" marginheight="2" marginwidth="2" src="http://localhost:8080/graduationProject/map.html" />
</body>
</html>
