<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Examples</title>
    <style>
        body{
            margin:0;
            padding:0;
            background-color: ;
        }
        #loginTxt{
            height:120px;
            line-height: 120px;
            width:100%;
            margin:50px 0 30px 0;
        }
        #loginTxt .loginTxt{
            text-align: center;
            width:120px;
            height:120px;
            line-height:110px;
            border-radius:120px;
            color:#06e;
            border:5px solid rgba(0,0,255,.5);
            font-size:50px;
            position: absolute;
            left:50%;
            transform:translateX(-50%);
            transition:border-color .5s ease;
        }
        #loginTxt .loginTxt:hover{
            border-color: rgba(0,0,255,.7);
        }
        #form{
            width:500px;
            height:200px;
            position: absolute;
            left:50%;
            transform:translateX(-50%);
            background-color: ;
        }
        #form #inputArea{
            width:100%;
            height:150px;
        }
        .input{
            border:1px solid #06e;
            border-radius:40px;
            height:40px;
            width:380px;
            margin-bottom:20px;
            display: flex;
            overflow: hidden;
            margin-left:60px;
        }
        .input span{
            display: block;
            width:80px;
            height:40px;
            line-height:40px;
            text-align: center;
            background-color: #06e;
            color:#fff;
        }
        #inputArea .input:nth-of-type(2){
            border-color: rgb(32,158,133);
        }
        #inputArea .input:nth-of-type(2) span{
            background-color: rgb(32,158,133);
        }
        #form #inputArea input{
            background-color: transparent;
            border:none;
            border-left:1px solid #06e;
            width:300px;
            height:40px;
            line-height:40px;
            margin-left:0px;
            padding-left:10px;
            font-size: 18px;
            outline: none;
        }
        .submit{
            display: flex;
        }
        .submit input,.submit .ahref{
            border:1px solid #06e;
            background-color: transparent;
            width:155px;
            margin-left:60px;
            height:40px;
            line-height:40px;
            border-radius:40px;
            cursor:pointer;
            transition:background-color .5s ease,color .5s ease;
            font-size: 18px;
        }
        .submit input:hover{
            background-color:#06e;
            color:#fff;
        }
        .submit .ahref{
            border-color:rgb(32,158,133);
        }
        .submit .ahref:hover{
            background-color:rgb(32,158,133);

        }
        .submit .ahref a:hover {
            color:#fff;
        }
        .submit .ahref a{
            display: block;
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div id="loginTxt">
    <div class="loginTxt">
        钓
    </div>
</div>
<form action="login" id="form" method="post">
    <div id="inputArea">
        <div class="input">
            <span>账号</span>
            <input type="text" id="user" placeholder="请输入登录账号" name="u_name">
        </div>
        <div class="input">
            <span>密码</span>
            <input type="password" id="password" placeholder="请输入密码" name="u_password">
        </div>

    </div>
    <div class="submit">
        <input type="submit" value="登录">
        <div class="ahref">
            <a href="./register">去注册</a>
        </div>
        <div class="ahref">
            <a href="./adminLogin">管理员登陆</a>
        </div>
    </div>
</form>
</body>
</html>