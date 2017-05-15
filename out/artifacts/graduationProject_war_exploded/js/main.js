/**
 * Created by YingyuLi on 2017/5/6.
 */

var url = '<%=request.getContextPath()%>/getFishingPlaceInfo';
var longitude;
var latitude;
var species_of_fish=document.getElementById("type");
var free_or_not=document.getElementById("free_or_not");
var score=document.getElementById("score");
var distance=document.getElementById("distance");

//window.onload =
    function init() {
    var sidebar_filter = document.getElementById('sidebar-filter');
    var sidebar_fishingPlace = document.getElementById('sidebar-fishingPlace');
    var list = document.getElementById('list');//只有一个list，表示筛选条件列表
    var fishingPlace = document.getElementById('fishingPlace');//钓场列表
    var list_li = list.getElementsByTagName('li');//list里有多个li,每个li表示一种筛选条件
    var list_span = list.getElementsByTagName('span');//筛选条件的名称列表
    var fishingPlace_html = fishingPlace.innerHTML;
    var customLayer;
    var map = new BMap.Map("map-cont",{enableMapClick:false});
    var point = new BMap.Point(116.404, 39.915);
    var navigationControl = new BMap.NavigationControl();
    var geolocation = new BMap.Geolocation();
    var checkbox = document.getElementsByTagName('input');
    list.style.display = 'block';
    fishingPlace.style.display = 'none';

    //地图加载

    map.centerAndZoom(point, 15);
    map.enableScrollWheelZoom(true);

    navigationControl.setOffset(new BMap.Size(40,40));
    map.addControl(navigationControl);

    //定位当前坐标

    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            (r.point);
            map.addOverlay(mk);
            map.panTo(r.point);
            alert('您的位置：'+r.point.lng+','+r.point.lat+'+++'+n);
            longitude = r.point.lng;
            latitude = r.point.latitude;
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
        var fishingPlaceI = document.getElementsByClassName('-0');
        for(var i=0 ; i<fishingPlaceI.length; i++) {
            fishingPlaceI[i].myCompOverlay = new ComplexCustomOverlay(new BMap.Point(fishingPlaceInfo[i].location[0], fishingPlaceInfo[i].location[1]), fishingPlaceInfo[i]);
            fishingPlaceI[i].onmouseover = function () {
                map.addOverlay(this.myCompOverlay);
            };
            fishingPlaceI[i].onmouseout = function () {
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
                html  +=  fishingPlace_html
                    .replace(/\{\{name\}\}/g,fishingPlaceInfo[i].fishing_place_name)
                    .replace(/\{\{address\}\}/g,fishingPlaceInfo[i].longitude+","+fishingPlaceInfo[i].latitude)
                    .replace(/\{\{price\}\}/g,'&yen;'+fishingPlaceInfo[i].free_or_not);
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

    var require = {
        distance:[],
        type:[],
        free_or_not:[],
        score:[],
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
                    case 'free_or_not':{
                        require.free_or_not.push(parseInt(this.value));
                        var filter = getFilter(require);
                        refreshPage(filter);
                        break;
                    }
                    case 'score':{
                        require.score.push(parseInt(this.value));
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
        var type = require.type.length !==0  ? '|fish_type:['+ require.type.join(',')+']' :'';
        alert(type);
        filter += type;
        console.log('filter'+filter)
        return filter;
    }

    //刷新地图
    function refreshPage(filter){
        url = url+"?longitude="+longitude+"&latitude="+latitude+"&species_of_fish="+species_of_fish+"&free_or_not="+free_or_not+"&score="+score+"&distance="+distance;
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


    //从后台获取钓场信息
    getfishingPlaceInfo(url,function(err,fishingPlaceInfo){
        insertData(err,fishingPlaceInfo);
        if(!err) {
            addListen(fishingPlaceInfo);
        }
    });

}

function getfishingPlaceInfo(){
    var fishingPlaceInfo = [];
    var longitude;
    var latitude;
    var species_of_fishes=document.getElementsByName("type");
    var species_of_fish;
    for(k in species_of_fishes){
        if(species_of_fishes[k].checked)
            species_of_fish = species_of_fish +species_of_fishes[k].value;
    }
    var free_or_not=document.getElementById("free_or_not");
    var score=document.getElementById("score");
    var distance=document.getElementsByClassName("distance");
    url = url+"?longitude="+longitude+"&latitude="+latitude+"&species_of_fish="+species_of_fish+"&free_or_not="+free_or_not+"&score="+score+"&distance="+distance;
    alert(url);
    $.ajax({
        type:'get',
        url:url,
        dataType:'json',
        success:function(data){
            var fishingPlace={};
            var arr = eval(data);
            alert(arr.length);
            for(var m = 0; m < arr.length; m++){
                fishingPlace.longitude = arr[m].longitude;
                fishingPlace.latitude = arr[m].latitude;
                point = new BMap.Point(fishingPlace.longitude,fishingPlace.latitude);
                var mk = new BMap.Marker(point);
                map.addOverlay(mk);
                map.panTo(point);
                fishingPlace.fishing_place_name = arr[m].fishing_place_name;
                fishingPlace.species_of_fish = arr[m].species_of_fish;
                fishingPlace.free_or_not = arr[m].free_or_not;
                fishingPlace.discoverer_name = arr[m].discoverer_name;
                fishingPlace.score = arr[m].score;
                fishingPlaceInfo.push(fishingPlace);
            }
        }
    });
    url = '<%=request.getContextPath()%>/getFishingPlaceInfo';
}

function searchFishingPlace(){
    alert("哈哈哈");
}
