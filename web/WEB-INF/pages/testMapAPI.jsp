<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>map</title>
    <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ir7jFwBM0tPkLebXl3ScT9cB">
    </script>

    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
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
    <script>
        window.onload = function() {
            var sidebar_filter = document.getElementById('sidebar-filter');
            var sidebar_fishingPlace = document.getElementById('sidebar-fishingPlace');
            var list = document.getElementById('list');//只有一个list，表示筛选条件列表
            var fishingPlace = document.getElementById('fishingPlace');//钓场列表
            list.style.display = 'block';
            fishingPlace.style.display = 'none';
            var list_li = list.getElementsByTagName('li');//list里有多个li,每个li表示一种筛选条件
            var list_span = list.getElementsByTagName('span');//筛选条件的名称列表
            var fishingPlace_html = fishingPlace.innerHTML;
            var customLayer;
            //地图加载
            var map = new BMap.Map("map-cont",{enableMapClick:false});
            var point = new BMap.Point(116.404, 39.915);
            map.centerAndZoom(point, 15);
            map.enableScrollWheelZoom(true);
            var navigationControl = new BMap.NavigationControl();
            navigationControl.setOffset(new BMap.Size(40,40));
            map.addControl(navigationControl);



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

            function addListen(fishingPlaceInfo){
                var hotelI = document.getElementsByClassName('fishingPlace');
                for(var i=0 ; i<hotelI.length; i++) {
                    hotelI[i].myCompOverlay = new ComplexCustomOverlay(new BMap.Point(fishingPlaceInfo[i].location[0], fishingPlaceInfo[i].location[1]), fishingPlaceInfo[i]);
                    hotelI[i].onmouseover = function () {
                        map.addOverlay(this.myCompOverlay);
                    };
                    hotelI[i].onmouseout = function () {
                        map.removeOverlay(this.myCompOverlay);
                    };
                }
            }

            //数据加载
            function insertData(err,fishingPlaceInfo){
                fishingPlace.innerHTML = '';
                if(!err){
                    var html = '';
                    for(var i=0;i<fishingPlaceInfo.length;i++){
                        html  +=  fishingPlace_html.replace(/\{\{imgSrc\}\}/g,fishingPlaceInfo[i].img.big)
                            .replace(/\{\{name\}\}/g,fishingPlaceInfo[i].name)
                            .replace(/\{\{address\}\}/g,fishingPlaceInfo[i].address)
                            .replace(/\{\{price\}\}/g,'&yen;'+fishingPlaceInfo[i].price);
                    }
                    fishingPlace.innerHTML = html;
                }
            }

            //麻点图层
            function prodTileLayer(filter){
                if(customLayer) {
                    map.removeTileLayer(customLayer);
                }
                customLayer=new BMap.CustomLayer({
                    ak:'ir7jFwBM0tPkLebXl3ScT9cB',
                    geotableId: 135736,
                    q: '', //检索关键字
                    tags: '', //空格分隔的多字符串
                    filter: filter //过滤条件
                });
                map.addTileLayer(customLayer);
                customLayer.addEventListener('hotspotclick',myHotspotclick);
            }
            function myHotspotclick(e){
                var customPoi = e.customPoi;//poi的默认字段
                var contentPoi=e.content;//poi的自定义字段
                var searchInfoWindow = prodSearchInfoWindow(map,contentPoi);
                var point = new BMap.Point(customPoi.point.lng, customPoi.point.lat);
                searchInfoWindow.open(point);
            }
            prodTileLayer('');

            //数据筛选
            var checkbox = document.getElementsByTagName('input');
            var require = {
                distance:[],
                type:[],
                getMax: function () {
                    var max = Math.max.apply(null, this.distance);
                    return max;
                },
                getMin: function(){
                    var min = Math.min.apply(null, this.distance);
                    return min;
                },
                removeEle: function(index,arrName){
                    if(index>-1){
                        this[arrName].splice(index,1);
                    }
                }
            };
            for(var i=0;i<checkbox.length;i++){
                checkbox[i].onclick = function(){
                    if(this.checked){
                        switch (this. getAttribute('data-label')){
                            case 'distance':{
                                var distance = (this.value);
                                require.distance.push(parseInt(distance));
                                var filter = getFilter(require);//获得条件
                                refreshPage(filter);//刷新页面
                                break;
                            }
                            case 'type':{
                                require.type.push(parseInt(this.value));
                                var filter = getFilter(require);
                                refreshPage(filter);
                                break;
                            }
                        }
                    }
                    else{
                        switch (this. getAttribute('data-label')){
                            case 'distance':{
                                var distance = (this.value);
                                var index = require.distance.indexOf(parseInt(distance));
                                require.removeEle(index,'distance');
                                var index = require.distance.indexOf(parseInt(distance));
                                require.removeEle(index,'distance');
                                var filter = getFilter(require);
                                refreshPage(filter);
                                break;
                            }
                            case 'type':{
                                var index  = require.type.indexOf(parseInt(this.value));
                                require.removeEle(index,'type');
                                var filter = getFilter(require);
                                refreshPage(filter);
                                break;
                            }
                        }
                    }
                }
            }
            function getFilter(require){
                var filter = '';
                if(require.distance[0] === 0 || require.distance[0]){
                    var price = 'distance:' + require.getMin() + ',' +require.getMax();
                    filter += price;
                }
                console.log(require.type.length);
                var type = require.type.length !==0  ? '|hotel_type:['+ require.type.join(',')+']' :'';
                filter += type;
                console.log('filter'+filter)
                return filter;
            }

            //刷新地图
            function refreshPage(filter){
                var url = 'http://api.map.baidu.com/geosearch/v3/nearby?ak=ir7jFwBM0tPkLebXl3ScT9cB&geotable_id=135736&location=116.395884,39.932154&radius=100000'
                if(filter) {
                    prodTileLayer(filter);
                    url = url + '&filter=' + filter;
                }
                else{
                    prodTileLayer('');
                }
                getfishingPlaceInfo(url,function(err,fishingPlaceInfo){
                    if(err){
                        console.log(err);
                        insertData(err);
                    }
                    else {
                        insertData(null,fishingPlaceInfo);
                        addListen(fishingPlaceInfo);
                    }
                });
            }

            var url = 'http://api.map.baidu.com/geosearch/v3/nearby?ak=ir7jFwBM0tPkLebXl3ScT9cB&geotable_id=135736&location=116.395884,39.932154&radius=100000'
            getfishingPlaceInfo(url,function(err,fishingPlaceInfo){
                insertData(err,fishingPlaceInfo);
                if(!err) {
                    addListen(fishingPlaceInfo);
                }
            });
        }
    </script>
</head>
<body>
欢迎 <a href="./userInformation?u_name=${u_name}">${u_name}</a> 登陆系统！ <a href="./quit">退出</a><br/>
<%--<img src="<%=request.getContextPath()%>/images/1.jpg"  alt="加载图片aa" width="100" height="100"/>--%>
<a href="./fishingPlace?u_name=${u_name}">添加钓点</a>
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
                            <input type="radio" value="1" class="distance" name="distance" checked/>不限
                            <input type="radio" value="1000" class="distance" name="distance" />1000米以下
                            <br/>
                            <input type="radio" value="5000" class="distance" name="distance"/>5000米以下
                            <input type="radio" value="10000" class="distance" name="distance"/>10000米以下
                            <br/>
                            <input type="radio" value="20000" class="distance" name="distance"/>20000米以下
                        </div>
                    </li>
                    <li>
                        <span>鱼的种类</span>
                        <div>
                            <input type="checkbox" value="1" class="type" name="type" checked/>不限
                            <input type="checkbox" value="2" class="type" name="type"/>鲈鱼
                            <br/>
                            <input type="checkbox" value="3" class="type" name="type"/>鳟鱼
                            <input type="checkbox" value="4" class="type" name="type"/>罗非鱼
                            <br/>
                            <input type="checkbox" value="5" class="type" name="type"/>鲤鱼
                            <input type="checkbox" value="6" class="type" name="type"/>草鱼
                        </div>
                    </li>
                </ul>
            </div>


            <div id="fishingPlace">
                <div class="clearfloat fishingPlace">
                    <dl>
                        <dd><img src="{{imgSrc}}"/></dd>
                        <dt>{{name}}</dt>
                        <dt>{{address}}</dt>
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