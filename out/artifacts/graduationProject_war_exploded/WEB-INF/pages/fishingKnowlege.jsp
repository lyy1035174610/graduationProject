<%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/3/28
  Time: 6:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>钓鱼百科</title>
    <link rel="stylesheet" href="./css/fishingKnowlege.css">
</head>
<body>
<br/>
<center>
    <h1><b>钓鱼百科</b></h1>
</center>
<br/><br/>
<div class="rumen-nav">
    <a name="baike"></a>

    <div class="class-lable-box" style="position: static;">
        <dl class="class-lable">
            <dt><span class="title">渔具百科</span></dt>
            <dd>
                <a href="<%=request.getContextPath()%>/baozhagou" title="爆炸钩" target="_blank">
                    爆炸钩 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/dangzhen" title="挡针" target="_blank">
                    挡针 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/diaoxiang" title="钓箱" target="_blank">
                    钓箱 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/haigan" title="海竿" target="_blank">
                    海竿 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/jigan" title="矶竿" target="_blank">
                    矶竿 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/taidiaogan" title="台钓竿" target="_blank">
                    台钓竿 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/xiliugan" title="溪流竿" target="_blank">
                    溪流竿 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/xiugou" title="袖钩" target="_blank">
                    袖钩 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/yishiniyugou" title="伊势尼鱼钩" target="_blank">
                    伊势尼鱼钩 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/yuhu" title="鱼护" target="_blank">
                    鱼护 </a>
            </dd>
        </dl>
    </div>
    <div class="class-lable-box" style="position: static;">
        <dl class="class-lable">
            <dt><span class="title">鱼饵百科</span></dt>
            <dd>
                <a href="<%=request.getContextPath()%>/lasifen" title="拉丝粉" target="_blank">
                    拉丝粉 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/xuehuafen" title="雪花粉" target="_blank">
                    雪花粉 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/yuerwuhuaxing" title="鱼饵雾化性" target="_blank">
                    鱼饵雾化性 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/yuerrongsanxing" title="鱼饵溶散性" target="_blank">
                    鱼饵溶散性 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/erliaobizhong" title="饵料比重" target="_blank">
                    饵料比重 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/yuerfugouxing" title="鱼饵附钩性" target="_blank">
                    鱼饵附钩性 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/diaoyuxiaoyao" title="钓鱼小药" target="_blank">
                    钓鱼小药 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/jiumi" title="酒米" target="_blank">
                    酒米 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/yuantangkeli" title="原塘颗粒" target="_blank">
                    原塘颗粒 </a>
            </dd>
        </dl>
    </div>
    <div class="clear"></div>
    <div class="class-lable-box" style="position: static;">
        <dl class="class-lable">
            <dt><span class="title">钓法百科</span></dt>
            <dd>
                <a href="<%=request.getContextPath()%>/baoshidiaofa" title="包食钓法" target="_blank">
                    包食钓法 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/paoqiandiaofa" title="跑铅钓法" target="_blank">
                    跑铅钓法 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/laerdiaofa" title="拉饵钓法" target="_blank">
                    拉饵钓法 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/feiqiandiaofa" title="飞铅钓法" target="_blank">
                    飞铅钓法 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/taidiao" title="台钓钓法" target="_blank">
                    台钓钓法 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/jingjidiaofa" title="竞技钓法" target="_blank">
                    竞技钓法 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/chuantongdiaofa" title="传统钓法" target="_blank">
                    传统钓法 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/paogandiaofa" title="抛竿钓法" target="_blank">
                    抛竿钓法 </a>
            </dd>
        </dl>
    </div>
    <div class="class-lable-box" style="position: static;">
        <dl class="class-lable">
            <dt><span class="title">对象鱼百科</span></dt>
            <dd>
                <a href="<%=request.getContextPath()%>/caoyu" title="草鱼" target="_blank">
                    草鱼 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/bianyu" title="鳊鱼" target="_blank">
                    鳊鱼 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/guyu" title="鲴鱼" target="_blank">
                    鲴鱼 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/heiyu" title="黑鱼" target="_blank">
                    黑鱼 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/jiyu" title="鲫鱼" target="_blank">
                    鲫鱼 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/liyu" title="鲤鱼" target="_blank">
                    鲤鱼 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/qingyu" title="青鱼" target="_blank">
                    青鱼 </a>
            </dd>
        </dl>
    </div>
    <div class="clear"></div>
    <div class="class-lable-box">
        <dl class="class-lable">
            <dt><span class="title">垂钓水域</span></dt>
            <dd>
                <a href="<%=request.getContextPath()%>/shuiku" title="水库" target="_blank">
                    水库 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/heikang" title="黑坑" target="_blank">
                    黑坑 </a>
            </dd>
            <dd>
                <a href="<%=request.getContextPath()%>/jianghe" title="江河" target="_blank">
                    江河 </a>
            </dd>
        </dl>
    </div>
</div>
</body>
</html>
