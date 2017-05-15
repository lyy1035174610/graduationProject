<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>map</title>
    <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ir7jFwBM0tPkLebXl3ScT9cB">
    </script>

    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/main.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />

    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            font-family: 微软雅黑, 宋体;
        }

        .title{
            height: 86px;
            text-align: center;
            font-size: 24px;
            line-height: 86px;
        }
        .clearfloat:after{
            content: "";
            display: block;
            clear: both;
        }
        .select-cont{
            width: 298px;
            float: left;
        }
        .menu{
            background-color: #3cb0d0;
            width: 100%;
            padding: 5px 5px 0;
            color: white;
        }
        .menu>div{
            float: left;
            width: 144px;
            height: 32px;
            line-height: 32px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
        }
        .select{
            background-color: white;
            color: black;
        }

        .scroll-clip{
            width: 100%;
            height: 580px;
            position: relative;
            border: 1px solid #eee;
        }
        #list,#fishingPlace{
            position: absolute;
            width: 100%;
            height: 100%;
            overflow-y: scroll;
            color: #49484b;
            text-align: center;
        }
        #list::-webkit-scrollbar,#fishingPlace::-webkit-scrollbar
        {
            width: 8px;
            height: 8px;
            background-color: #F5F5F5;
        }

        #list::-webkit-scrollbar-track,#fishingPlace::-webkit-scrollbar-track
        {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 0px;
            background-color: #F5F5F5;
        }


        #list::-webkit-scrollbar-thumb,#fishingPlace::-webkit-scrollbar-thumb
        {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: #555;
        }
        #list ul li{
            display: block;
            cursor: pointer;
            font-size: 16px;
            line-height: 58px;
            border-bottom: #EEEEEE 1px solid;
        }
        #list ul li span{
            display: block;
        }
        #list ul li div{
            line-height: 28px;
            margin-bottom: 10px;
            text-align: left;
            display: none;
        }
        #list ul li div input{
            margin-left: 30px;
        }
        #fishingPlace {
            display: none;
        }
        #fishingPlace div{
            padding: 10px;
        }
        #fishingPlace div dl{
            display: block;
            width:190px;
            border-bottom: 1px #eee solid;
            float: left;
        }
        #fishingPlace div span{
            display: block;
            color: red;
            float: right;
            text-align: left;
        }
        #fishingPlace div dl dd{
            float: left;
            width: 46px;
            background-color: #f9f9f9;
            margin-right: 8px;
            text-align: center;
            height: 46px;
        }
        #fishingPlace div dl dd img{
            width: 100%;
            height: 100%;
        }
        #fishingPlace div dl dt{
            float: left;
            text-align: left;
            line-height: 24px;
            width: 135px;
            overflow:hidden;
            white-space:nowrap;
            text-overflow:ellipsis;
            cursor: pointer;
        }
        #fishingPlace div dl dt:last-child{
            font-size: 8px;
        }
        #fishingPlace div:hover dl dt{
            color: #37B9FF;
        }
        #map-cont{
            position: absolute;
            width:1000px;
            height:600px;
            margin-left: 298px;
        }
        .fishingPlaceInfo{
            padding: 10px;
            border-bottom: 1px #eee solid;
        }
        .fishingPlaceInfo img{
            display: block;
            position: absolute;
            width: 46px;
            height: 46px;
            top: 3px;
            left: 3px;
        }
        .fishingPlaceInfo .name{
            position: absolute;
            overflow:hidden;
            width: 120px;
            white-space:nowrap;
            text-overflow:ellipsis;
            top: 5px;
            left:55px;
        }
        .fishingPlaceInfo .address{
            position: absolute;
            width: 120px;
            overflow:hidden;
            white-space:nowrap;
            text-overflow:ellipsis;
            top: 30px;
            left:55px;
            font-size: 8px;
        }
        .fishingPlaceInfo .price{
            position: absolute;
            top: 0px;
            left:172px;
            color: red;
        }
        .infoWindow img{
            width: 240px;
            height: 140px;
        }
        .infowindow div{
            width: 100%;
        }
        .infowindow div span{
            display: block;
            margin-top: 10px;
        }
        .infowindow div span:first-child{
            float: left;
            width: 70%;
            overflow:hidden;
            white-space:nowrap;
            text-overflow:ellipsis;
        }
        .infowindow div span:last-child{
            float: right;
            text-align: right;
            color: red;
            width: 25%;
            overflow:hidden;
            white-space:nowrap;
            text-overflow:ellipsis;
        }
        .infowindow a{
            margin-top: 10px;
            float: right;
            color: white;
            font-size: 8px;
            padding: 5px;
            border-radius: 3px;
            background-color: #006dac;
        }
    </style>
    <script type="text/javascript">
        var fishingPlaceInfo=[{"fishing_place_name":"鱼多多","longitude":113.358468,"latitude":23.051268,"free_or_not":"否","species_of_fish":"鲈鱼"},
            {"fishing_place_name":"出水口","longitude":113.406761,"latitude":23.037168,"free_or_not":"否","species_of_fish":"鳊鱼,罗飞鱼"},
            {"fishing_place_name":"新洲码头","longitude":113.419121,"latitude":23.049406,"free_or_not":"是","species_of_fish":"青鱼"}];//从后台查询到的钓场列表信息数组
        var currentLongitude;
        var currentLatitude;
        var url = '<%=request.getContextPath()%>/getFishingPlaceInfo';
        var f_html='';
        window.onload=function init() {
            var sidebar_filter = document.getElementById('sidebar-filter');
            var sidebar_fishingPlace = document.getElementById('sidebar-fishingPlace');
            var list = document.getElementById('list');//只有一个list，表示筛选条件列表
            var fishingPlace = document.getElementById('fishingPlace');//钓场列表
            var list_li = list.getElementsByTagName('li');//list里有多个li,每个li表示一种筛选条件
            var list_span = list.getElementsByTagName('span');//筛选条件的名称列表
            var fishingPlace_html = fishingPlace.innerHTML;
            f_html=fishingPlace_html;
           // var customLayer;
            var map = new BMap.Map("map-cont",{enableMapClick:false});
            var point = new BMap.Point(113.270793,23.135308);
            var navigationControl = new BMap.NavigationControl();
            var geolocation = new BMap.Geolocation();
            var checkbox = document.getElementsByTagName('input');
            list.style.display = 'block';
            fishingPlace.style.display = 'none';

            //为每个筛选条件绑定展开跟关闭事件
            for(var i=0;i<list_li.length;i++){
                list_span[i].clicked = false;
                list_span[i].index = i;
                list_span[i].onclick = function(){
                    var div = list_li[this.index].getElementsByTagName('div');
                    if(this.clicked){
                        div[0].style.display = 'none';
                        this.clicked = false;
                    }
                    else{
                        div[0].style.display = 'block';
                        this.clicked = true;
                    }
                }
            }
            sidebar_filter.onclick = function () {
                list.style.display = 'block';
                sidebar_filter.className = 'select';
                sidebar_fishingPlace.className = '';
                fishingPlace.style.display = 'none';
            };
            sidebar_fishingPlace.onclick = function () {
                list.style.display = 'none';
                sidebar_fishingPlace.className = 'select';
                sidebar_filter.className = '';
                fishingPlace.style.display = 'block';
            };

            //地图加载
            map.centerAndZoom(point, 15);
            map.enableScrollWheelZoom(true);

            navigationControl.setOffset(new BMap.Size(40,40));
            map.addControl(navigationControl);

            //定位当前坐标
            geolocation.getCurrentPosition(function(r){
                if(this.getStatus() == BMAP_STATUS_SUCCESS){
                    var mk = new BMap.Marker(r.point);
                    map.addOverlay(mk);
                    map.panTo(r.point);
                    currentLongitude = r.point.lng;
                    currentLatitude = r.point.lat;
                    alert('您的位置：'+r.point.lng+','+r.point.lat);
                }
                else {
                    alert('failed'+this.getStatus());
                }
            },{enableHighAccuracy: true})
            //关于状态码
            //BMAP_STATUS_SUCCESS	检索成功。对应数值“0”。
            //BMAP_STATUS_CITY_LIST	城市列表。对应数值“1”。
            //BMAP_STATUS_UNKNOWN_LOCATION	位置结果未知。对应数值“2”。
            //BMAP_STATUS_UNKNOWN_ROUTE	导航结果未知。对应数值“3”。
            //BMAP_STATUS_INVALID_KEY	非法密钥。对应数值“4”。
            //BMAP_STATUS_INVALID_REQUEST	非法请求。对应数值“5”。
            //BMAP_STATUS_PERMISSION_DENIED	没有权限。对应数值“6”。(自 1.1 新增)
            //BMAP_STATUS_SERVICE_UNAVAILABLE	服务不可用。对应数值“7”。(自 1.1 新增)
            //BMAP_STATUS_TIMEOUT	超时。对应数值“8”。(自 1.1 新增)

            //加载数据
            insertData(null,fishingPlaceInfo);
            //insertOverlay(fishingPlaceInfo);

            //在地图添加标记
            function addMarker(point){
                var marker = new BMap.Marker(point);
                map.addOverlay(marker);
            }
            //添加自定义覆盖物,<-------开始------->
            function ComplexCustomOverlay(point, text, mouseoverText){
                this._point = point;
                this._text = text;
                this._overText = mouseoverText;
            }
            ComplexCustomOverlay.prototype = new BMap.Overlay();
            ComplexCustomOverlay.prototype.initialize = function(map){
                this._map = map;
                var div = this._div = document.createElement("div");
                div.style.position = "absolute";
                div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
                div.style.backgroundColor = "#EE5D5B";
                div.style.border = "1px solid #BC3B3A";
                div.style.color = "white";
                div.style.height = "18px";
                div.style.padding = "2px";
                div.style.lineHeight = "18px";
                div.style.whiteSpace = "nowrap";
                div.style.MozUserSelect = "none";
                div.style.fontSize = "12px"
                var span = this._span = document.createElement("span");
                div.appendChild(span);
                span.appendChild(document.createTextNode(this._text));
                var that = this;

                var arrow = this._arrow = document.createElement("div");
                arrow.style.background = "url(http://map.baidu.com/fwmap/upload/r/map/fwmap/static/house/images/label.png) no-repeat";
                arrow.style.position = "absolute";
                arrow.style.width = "11px";
                arrow.style.height = "10px";
                arrow.style.top = "22px";
                arrow.style.left = "10px";
                arrow.style.overflow = "hidden";
                div.appendChild(arrow);

                div.onmouseover = function(){
                    this.style.backgroundColor = "#6BADCA";
                    this.style.borderColor = "#0000ff";
                    this.getElementsByTagName("span")[0].innerHTML = that._overText;
                    arrow.style.backgroundPosition = "0px -20px";
                }

                div.onmouseout = function(){
                    this.style.backgroundColor = "#EE5D5B";
                    this.style.borderColor = "#BC3B3A";
                    this.getElementsByTagName("span")[0].innerHTML = that._text;
                    arrow.style.backgroundPosition = "0px 0px";
                }

                map.getPanes().labelPane.appendChild(div);

                return div;
            }
            ComplexCustomOverlay.prototype.draw = function(){
                var mp = this._map;
                var pixel = mp.pointToOverlayPixel(this._point);
                this._div.style.left = pixel.x - parseInt(this._arrow.style.left) + "px";
                this._div.style.top  = pixel.y - 30 + "px";
            }
            //var txt = "银湖海岸城", mouseoverTxt = txt + " " + parseInt(Math.random() * 1000,10) + "套" ;

            //var myCompOverlay = new ComplexCustomOverlay(new BMap.Point(113.30764968,23.1200491), "银湖海岸城",mouseoverTxt);

           // map.addOverlay(myCompOverlay);

            for(var i=0;i<fishingPlaceInfo.length;i++){
                var money=fishingPlaceInfo[i].free_or_not=="是"?"免费":"收费";
                var text=fishingPlaceInfo[i].fishing_place_name+"("+money+")";
                var detailText=text+fishingPlaceInfo[i].species_of_fish;
                //alert(detailText);
                var point = new BMap.Point(fishingPlaceInfo[i].longitude,fishingPlaceInfo[i].latitude);
                var myCompOverlay = new ComplexCustomOverlay(point,text ,detailText);
                map.addOverlay(myCompOverlay);
            }
            //添加自定义覆盖物,<-------结束------->


            function addListen(fishingPlaceInfo){
                var fishingPlaceI = document.getElementsByClassName('fishingPlace');
                alert(fishingPlaceI.length);
                for(var i=0 ; i<fishingPlaceI.length; i++) {
                    money=fishingPlaceInfo[i].free_or_not=="是"?"免费":"收费";
                    text=fishingPlaceInfo[i].fishing_place_name+"("+money+")";
                    detailText=text+fishingPlaceInfo[i].species_of_fish;
                    fishingPlaceI[i].myCompOverlay = new ComplexCustomOverlay(new BMap.Point(fishingPlaceInfo[i].longitude, fishingPlaceInfo[i].latitude), text,detailText);
                    fishingPlaceI[i].onmouseover = function () {
                        map.addOverlay(this.myCompOverlay);
                        //alert("进入");
                    };
                    fishingPlaceI[i].onmouseout = function () {
                        map.removeOverlay(this.myCompOverlay);
                       // alert("退出");
                    };
                }
            }

            function insertOverlay(fishingPlaceInfo) {
                alert(fishingPlaceInfo.length+"hahah");
                for(var i=0;i<fishingPlaceInfo.length;i++){
                    var money=fishingPlaceInfo[i].free_or_not=="是"?"免费":"收费";
                    var text=fishingPlaceInfo[i].fishing_place_name+"("+money+")";
                    var detailText=text+fishingPlaceInfo[i].species_of_fish;
                    alert(detailText);
                    var point = new BMap.Point(fishingPlaceInfo[i].longitude,fishingPlaceInfo[i].latitude);
                    var myCompOverlay = new ComplexCustomOverlay(point,text ,detailText);
                    map.addOverlay(myCompOverlay);
                }
                alert("1111111");
            }

            //数据加载
            function insertData(err,fishingPlaceInfo){
                fishingPlace.innerHTML = '';
                if(!err){
                    var html = '';
                    for(var i=0;i<fishingPlaceInfo.length;i++){
                        money=fishingPlaceInfo[i].free_or_not=="是"?"免费":"收费";
                        text=fishingPlaceInfo[i].fishing_place_name+"("+money+")";
                        detailText=text+fishingPlaceInfo[i].species_of_fish;
                        html  +=  fishingPlace_html
                            .replace(/\{\{name\}\}/g,fishingPlaceInfo[i].fishing_place_name)
                            .replace(/\{\{address\}\}/g,"longitude="+fishingPlaceInfo[i].longitude+"&latitude="+fishingPlaceInfo[i].latitude)
                            .replace(/\{\{price\}\}/g,money);
                        //var point = new BMap.Point(fishingPlaceInfo[i].longitude,fishingPlaceInfo[i].latitude);
                       // var myCompOverlay = new ComplexCustomOverlay(point,text ,detailText);
                        //map.addOverlay(myCompOverlay);
                        //addMarker(point);
                    }
                    //alert("前。。");
                    fishingPlace.innerHTML = html;
                    //addListen(fishingPlaceInfo);
                }
            }
        }


        //从后台获取钓场信息列表数组
        function getfishingPlaceInfo(){
            //alert(1);
            var fishingPlaceInfo = [];

            var species_of_fishes=document.getElementsByName("type");
            var species_of_fish='';
            for(var k=0;k<species_of_fishes.length;k++){
                if(species_of_fishes[k].checked) {
                    if(species_of_fishes[k].value=='1') {
                        species_of_fish = '1';
                        break;
                    }
                    else species_of_fish = species_of_fish + species_of_fishes[k].value+',';
                }
            }
            //alert(2);
            var free_or_nots = document.getElementsByName("free_or_not");
            var free_or_not='';
            for(var i=0;i<free_or_nots.length;i++){
                if(free_or_nots[i].checked){
                    free_or_not = free_or_nots[i].value;
                }
            }
            //alert(3);
            var scores=document.getElementsByName("score");
            var score='';
            for(var i=0;i<scores.length;i++){
                if(scores[i].checked){
                    score = scores[i].value;
                }
            }
            //alert(4);
            var distances=document.getElementsByName("distance");
            var distance='';
            for(var i=0;i<distances.length;i++){
                if(distances[i].checked){
                    distance = distances[i].value;
                }
            }
            //alert(5);
            url = url+"?longitude="+currentLongitude+"&latitude="+currentLatitude+"&species_of_fish="+species_of_fish+"&free_or_not="+free_or_not+"&score="+score+"&distance="+distance;
            alert(url);
            //var f_html=document.getElementById('fishingPlace').innerHTML;
            //document.getElementById('fishingPlace').innerHTML;
            $.ajax({
                type:'get',
                url:url,
                dataType:'json',
                success:function(data){
                    var fishingPlace={};
                    var arr = eval(data);
                    alert(arr.length);
                    for(var m = 0; m < arr.length; m++){
                        fishingPlace.longitude = arr[m].fishingPlace.longitude;
                        fishingPlace.latitude = arr[m].fishingPlace.latitude;
                        fishingPlace.fishing_place_name = arr[m].fishingPlace.fishing_place_name;
                        fishingPlace.species_of_fish = arr[m].fishingPlace.species_of_fish;
                        fishingPlace.free_or_not = arr[m].fishingPlace.free_or_not;
                        fishingPlace.discoverer_name = arr[m].fishingPlace.discoverer_name;
                        fishingPlace.score = arr[m].fishingPlace.score;
                        //alert(arr[m].fishingPlace.fishing_place_name);

                        fishingPlaceInfo.push(fishingPlace);
                    }
                    alert("fishingPlaceInfo长度:"+fishingPlaceInfo.length);
                    document.getElementById('fishingPlace').innerHTML = "<span>测试</span><br/>"+f_html;
                }
            });
            url = '<%=request.getContextPath()%>/getFishingPlaceInfo';
            //alert(6);
            init();
        }

        //刷新地图
        function refresh(fishingPlaceInfo) {

        }

    </script>
</head>
<body>
<%--欢迎 <a href="./userInformation?u_name=${user.u_name}">${user.u_name}</a> 登陆系统！ <a href="./quit">退出</a><br/>--%>
<%--<img src="<%=request.getContextPath()%>/images/1.jpg"  alt="加载图片aa" width="100" height="100"/>--%>
<a href="./fishingPlace?u_name=${user.u_name}">添加钓点</a>
<div class="container clearfloat">
    <div class="select-cont">
        <div class="menu clearfloat">
            <div id="sidebar-filter" class="select">筛选条件</div>
            <div id="sidebar-fishingPlace">钓点列表</div>
        </div>
        <div class="scroll-clip">
            <div id="list">
                <ul>
                    <li>
                        <span>距离范围</span>
                        <div>
                            <input type="radio" value="1" class="distance" name="distance"  checked/>不限
                            <input type="radio" value="1000" class="distance" name="distance" />1000米以下
                            <br/>
                            <input type="radio" value="5000" class="distance" name="distance" />5000米以下
                            <input type="radio" value="10000" class="distance" name="distance"/>10000米以下
                            <br/>
                            <input type="radio" value="20000" class="distance" name="distance"/>20000米以下
                        </div>
                    </li>
                    <li>
                        <span>鱼的种类</span>
                        <div>
                            <input type="checkbox" value="1" class="type" name="type" checked/>不限
                            <input type="checkbox" value="鲈鱼" class="type" name="type"/>鲈鱼
                            <br/>
                            <input type="checkbox" value="鳟鱼" class="type" name="type"/>鳟鱼
                            <input type="checkbox" value="罗非鱼" class="type" name="type"/>罗非鱼
                            <br/>
                            <input type="checkbox" value="鲤鱼" class="type" name="type"/>鲤鱼
                            <input type="checkbox" value="草鱼" class="type" name="type"/>草鱼
                            <br/>
                            <input type="checkbox" value="鳊鱼" class="type" name="type"/>鳊鱼
                            <input type="checkbox" value="鲴鱼" class="type" name="type"/>鲴鱼
                            <br/>
                            <input type="checkbox" value="黑鱼" class="type" name="type"/>黑鱼
                            <input type="checkbox" value="鲫鱼" class="type" name="type"/>鲫鱼
                            <br/>
                            <input type="checkbox" value="青鱼" class="type" name="type"/>青鱼
                        </div>
                    </li>
                    <li>
                        <span>是否收费</span>
                        <div>
                            <input type="radio" value="1" class="type" name="free_or_not" checked/>不限
                            <input type="radio" value="是" class="type" name="free_or_not"/>收费
                            <input type="radio" value="否" class="type" name="free_or_not"/>免费
                        </div>
                    </li>
                    <li>
                        <span>评分</span>
                        <div>
                            <input type="radio" value="1" class="type" name="score" checked/>不限
                            <input type="radio" value="2" class="type" name="score"/>1分以上
                            <br/>
                            <input type="radio" value="3" class="type" name="score"/>2分以上
                            <input type="radio" value="4" class="type" name="score"/>3分以上
                            <br/>
                            <input type="radio" value="5" class="type" name="score"/>4分以上
                            <input type="radio" value="6" class="type" name="score"/>5分
                        </div>
                    </li>
                </ul>
                <button onclick="getfishingPlaceInfo()">&nbsp;&nbsp;&nbsp;查询&nbsp;&nbsp;&nbsp;</button><br/>
            </div>


            <div id="fishingPlace">
                <div class="clearfloat fishingPlace">
                    <dl>
                        <dd><img src="<%=request.getContextPath()%>/images/2.jpg"/></dd>
                        <dt>{{name}}</dt>
                        <dt><a href="<%=request.getContextPath()%>/fishingPlaceDetails?{{address}}" >{{address}}</a></dt>
                    </dl>
                    <span class="price">{{price}}</span>
                </div>
            </div>
        </div>
    </div>
    <div id="map-cont"></div>
</div>
</body>
</html>