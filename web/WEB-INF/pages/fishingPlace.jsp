<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/4/4
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>百度地图</title>
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>
    <script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script>
</head>
<body>
<%--欢迎 <a href="./userInformation?u_name=${user.u_name}">${user.u_name}</a> 登陆系统！ <a href="./quit">退出</a><br/>--%>
<input type="text" id="cityName" value="广州"/>
<input type="button" onclick="setCity()" value="查找" />
<div id="container" style="width:1024px;height:600px;"></div>
<form action="addFishingPlace" method="post">
    <table>
        <tr>
            <td>坐标:</td>
            <td><input type="text" id="coordinate" readonly name="coordinate"/></td>
        </tr>
        <tr>
            <td>名称:</td>
            <td><input type="text" id="fishing_place_name"  name="fishing_place_name"/></td>
        </tr>
        <tr>
            <td>鱼的种类:</td>
            <td>
                <input type="checkbox" value="青鱼"  name="species_of_fish"/>青鱼
                <input type="checkbox" value="鲈鱼"  name="species_of_fish"/>鲈鱼
                <input type="checkbox" value="鳟鱼"  name="species_of_fish"/>鳟鱼
                <input type="checkbox" value="罗非鱼"  name="species_of_fish"/>罗非鱼
                <input type="checkbox" value="鲤鱼"  name="species_of_fish"/>鲤鱼
                <br/>
                <input type="checkbox" value="草鱼"  name="species_of_fish"/>草鱼
                <input type="checkbox" value="鳊鱼"  name="species_of_fish"/>鳊鱼
                <input type="checkbox" value="鲴鱼"  name="species_of_fish"/>鲴鱼
                <input type="checkbox" value="黑鱼"  name="species_of_fish"/>黑鱼
                <input type="checkbox" value="鲫鱼"  name="species_of_fish"/>鲫鱼
            </td>
        </tr>
        <tr>
            <td>是否收费:</td>
            <td><select id="free_or_not" name="free_or_not" >
                <option value="是">是</option>
                <option value="否" selected>否</option>
            </select></td>
        </tr>
        <tr>
            <td>发现者:</td>
            <td><input type="text" id="discoverer_name" value="${user.u_name}" readonly name="discoverer_name"/></td>
        </tr>
    </table>
    <input type="submit" value="添加钓点">
</form>

<script type="text/javascript">
    var map = new BMap.Map("container");        //在container容器中创建一个地图,参数container为div的id属性;
    var point = new BMap.Point(120.2,30.25);    //创建点坐标
    map.centerAndZoom(point, 14);                //初始化地图，设置中心点坐标和地图级别
    map.enableScrollWheelZoom();                //激活滚轮调整大小功能
    map.addControl(new BMap.NavigationControl());    //添加控件：缩放地图的控件，默认在左上角；
    map.addControl(new BMap.MapTypeControl());        //添加控件：地图类型控件，默认在右上方；
    map.addControl(new BMap.ScaleControl());        //添加控件：地图显示比例的控件，默认在左下方；
    map.addControl(new BMap.OverviewMapControl());  //添加控件：地图的缩略图的控件，默认在右下方； TrafficControl
    map.addEventListener("click",function(e){//添加鼠标点击地图获取坐标点事件
        //alert(e.point.lng + "," + e.point.lat);
        document.getElementById('coordinate').value = e.point.lng + "," + e.point.lat;
    });
    var search = new BMap.LocalSearch("中国", {
        onSearchComplete: function(result){
            if (search.getStatus() == BMAP_STATUS_SUCCESS){
                var res = result.getPoi(0);
                var point = res.point;
                map.centerAndZoom(point, 11);
            }
        },renderOptions: {  //结果呈现设置，
            map: map,
            autoViewport: true,
            selectFirstResult: true
        } ,onInfoHtmlSet:function(poi,html){//标注气泡内容创建后的回调函数，有了这个，可以简单的改一下返回的html内容了。

        }
    });

    function setCity(){
        search.search(document.getElementById("cityName").value);
    }
    search.search(document.getElementById("cityName").value);
</script>
</body>
</html>
