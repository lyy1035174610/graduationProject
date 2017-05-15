<%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/5/9
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>钓场详情</title>
    <script>
        function button_onclick(){
            //在当前也面进行跳转
            var points = document.getElementsByName("score");
            var point;
            for(var i=0;i<points.length;i++)
                if(points[i].checked)
                    point = points[i].value;
            window.location.href="./testMapAPI?u_name=kk";
        }
    </script>
</head>
<body>
<center>
    <h1 style="color:blue;">钓点信息界面</h1>
    <h2>经度：${longitude}</h2>
    <h2>纬度： ${latitude}</h2>
    <h2>名称：${fishing_place_name}</h2>
    <h2>鱼类： ${species_of_fish}</h2>
    <h2>是否收费：${free_or_not}</h2>
    <h2>发现者姓名：${discoverer_name}</h2>
    <h2>评分：${score}</h2>
</center>
<div>
    <input type="radio" value="1" class="type" name="score"/>1分
    <input type="radio" value="2" class="type" name="score"/>2分
    <input type="radio" value="3" class="type" name="score"/>3分
    <input type="radio" value="4" class="type" name="score"/>4分
    <input type="radio" value="5" class="type" name="score" checked/>5分
    <input type="button" value="打分" onclick="javascript:button_onclick();"/>
</div>
</body>
</html>
